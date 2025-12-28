import pandas as pd
from bs4 import BeautifulSoup
import os
import re

# --- نرمال‌سازی متن ---
def normalize_text(s):
    if not s:
        return ''
    s = s.replace('ي', 'ی').replace('ك', 'ک')
    s = re.sub(r'[\u200c\u200f]', '', s)  # حذف نیم‌فاصله و RTL
    s = re.sub(r'\s+', ' ', s)            # یکدست‌سازی فاصله‌ها
    return s.strip()

# --- یافتن مقدار بعد از یک برچسب درون یک پنل ---
def find_value_in_panel(panel, label_text):
    target = normalize_text(label_text).replace(':', '')
    for lab in panel.find_all('label'):
        txt = normalize_text(lab.get_text()).replace(':', '')
        if target in txt:
            sib = lab.find_next(lambda tag: tag.name == 'label' and 'infomark' in (tag.get('class') or []))
            if sib and sib.find_parent('div', class_='panel-body-print') == panel:
                return normalize_text(sib.get_text())
    return ''

# --- استخراج کانتکست دانش‌آموز از پنل ---
def extract_student_context(panel, file_name):
    student_name = find_value_in_panel(panel, 'نام')
    student_family = find_value_in_panel(panel, 'نام خانوادگی')
    father_name = find_value_in_panel(panel, 'نام پدر')
    birth_date = find_value_in_panel(panel, 'تاریخ تولد')
    id_number = find_value_in_panel(panel, 'شماره شناسنامه')
    student_code = find_value_in_panel(panel, 'کد دانش آموز')
    major = find_value_in_panel(panel, 'رشته')

    return {
        'نام فایل منبع': file_name,
        'نام دانش‌آموز': student_name,
        'نام خانوادگی': student_family,
        'نام پدر': father_name,
        'تاریخ تولد': birth_date,
        'شماره شناسنامه': id_number,
        'کد دانش‌آموز': student_code,
        'رشته': major,
    }

# --- استخراج از یک فایل HTML ---
def extract_data_from_html(html_file_path):
    file_name = os.path.basename(html_file_path)
    try:
        with open(html_file_path, 'r', encoding='utf-8') as f:
            html_content = f.read()
    except Exception as e:
        print(f"❌ خطا در خواندن فایل {file_name}: {e}")
        return []

    soup = BeautifulSoup(html_content, 'html.parser')
    all_records = []

    panels = soup.find_all('div', class_='panel-body-print')
    if not panels:
        panels = [soup]

    for panel in panels:
        student_data = extract_student_context(panel, file_name)
        if not any(student_data.values()):
            continue

        table = panel.find('table')
        if not table or not table.find('tbody'):
            full_record = student_data.copy()
            full_record.update({'کد درس': 'N/A', 'نام درس': 'N/A', 'نوع': 'N/A', 'واحد': 'N/A', 'نام معلم': 'N/A'})
            all_records.append(full_record)
            continue

        rows = table.find('tbody').find_all('tr')
        for row in rows:
            cols = [normalize_text(col.get_text()) for col in row.find_all('td')]
            if not cols or 'جمع واحد' in cols or not cols[0].isdigit():
                continue
            if len(cols) >= 6:
                course_record = {
                    'کد درس': cols[1],
                    'نام درس': cols[2],
                    'نوع': cols[3],
                    'واحد': cols[4],
                    'نام معلم': cols[5]
                }
                full_record = student_data.copy()
                full_record.update(course_record)
                all_records.append(full_record)

    return all_records

# --- پردازش همه فایل‌ها و ساخت دو خروجی ---
def process_all_html_files(folder_path='.', output_excel_path=None, preview_rows=20):
    try:
        import openpyxl
    except ImportError:
        print("❌ لطفاً نصب کنید: pip install openpyxl")
        return

    if output_excel_path is None:
        import datetime
        today = datetime.date.today().strftime("%Y%m%d")
        output_excel_path = f"گزارش_تجمیعی_انتخاب_واحد_{today}.xlsx"

    all_extracted_data = []
    html_files_processed = 0

    for file_name in os.listdir(folder_path):
        if file_name.lower().endswith(('.html', '.htm')):
            html_file_path = os.path.join(folder_path, file_name)
            records = extract_data_from_html(html_file_path)
            all_extracted_data.extend(records)
            html_files_processed += 1

    if not all_extracted_data:
        print(f"\n❌ هیچ داده‌ای از {html_files_processed} فایل استخراج نشد.")
        return

    final_columns = [
        'نام فایل منبع', 'نام دانش‌آموز', 'نام خانوادگی', 'نام پدر', 'تاریخ تولد', 'شماره شناسنامه',
        'کد دانش‌آموز', 'رشته', 'کد درس', 'نام درس', 'نوع', 'واحد', 'نام معلم'
    ]

    df = pd.DataFrame(all_extracted_data, columns=final_columns)
    df.to_excel(output_excel_path, index=False, engine='openpyxl')
    print(f"\n✅ موفقیت! {html_files_processed} فایل پردازش شد.")
    print(f"📥 خروجی تجمیعی: {output_excel_path}")
    print(f"📊 تعداد رکوردها: {len(df)}")

    # نمایش پیش‌نمایش رکوردهای درس
    print("\n🟦 پیش‌نمایش رکوردهای درس:")
    print(df.head(preview_rows))

    # --- ساخت فایل خلاصه دانش‌آموزان ---
    df['واحد'] = pd.to_numeric(df['واحد'], errors='coerce').fillna(0)
    df['سال تولد'] = df['تاریخ تولد'].astype(str).str[:4]
    df['ماه تولد'] = df['تاریخ تولد'].astype(str).str[4:6]
    df['روز تولد'] = df['تاریخ تولد'].astype(str).str[6:8]

    # نرمال‌سازی ستون نوع
    df['نوع'] = df['نوع'].astype(str).apply(normalize_text)

    # شرط‌ها
    mask_hazoori = (df['نوع'] == 'حضوری') & (df['نام درس'] != 'انضباط') & (~df['نوع'].str.contains('مهارت خارج از مدرسه', na=False))
    mask_ghair = df['نوع'].str.contains('غیر', na=False) & df['نوع'].str.contains('حضوری', na=False)
    mask_maharat = df['نوع'].str.contains('مهارت خارج از مدرسه', na=False)

    summary = df.groupby(
        ['نام فایل منبع','نام دانش‌آموز','نام خانوادگی','نام پدر',
         'سال تولد','ماه تولد','روز تولد','شماره شناسنامه','کد دانش‌آموز','رشته'],
        as_index=False
    ).agg(
        مجموع_واحدهای_حضوری=('واحد', lambda x: x[mask_hazoori.loc[x.index]].sum()),
        مجموع_واحدهای_غیرحضوری=('واحد', lambda x: x[mask_ghair.loc[x.index]].sum()),
        مجموع_واحدهای_مهارت_خارج_از_مدرسه=('واحد', lambda x: x[mask_maharat.loc[x.index]].sum())
    )

    summary_output = output_excel_path.replace("گزارش_تجمیعی", "خلاصه_دانش‌آموزان")
    summary.to_excel(summary_output, index=False, engine='openpyxl')
    print(f"\n✅ فایل خلاصه ساخته شد: {summary_output}")
    print("\n🟦 پیش‌نمایش خلاصه دانش‌آموزان:")
    print(summary.head(preview_rows))


if __name__ == '__main__':
    process_all_html_files()
