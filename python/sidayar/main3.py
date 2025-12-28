import pandas as pd
from bs4 import BeautifulSoup
import os
import re

# --- نرمال‌سازی متن ---
def normalize_text(s):
    if s is None:
        return ''
    s = str(s)
    s = s.replace('ي', 'ی').replace('ك', 'ک')
    s = re.sub(r'[\u200c\u200f]', '', s)  # حذف نیم‌فاصله و RTL
    s = re.sub(r'\s+', ' ', s)            # یکدست‌سازی فاصله‌ها
    return s.strip()

# --- یافتن مقدار بعد از یک برچسب درون یک پنل (ایمن و دقیق) ---
def find_value_in_panel(panel, label_text, exact=True, exclude_keywords=None):
    target = normalize_text(label_text).replace(':', '')
    exclude_keywords = exclude_keywords or []
    for lab in panel.find_all('label'):
        txt = normalize_text(lab.get_text()).replace(':', '')
        if any(k in txt for k in exclude_keywords):
            continue
        if exact:
            matched = (txt == target)
        else:
            matched = (txt.startswith(target))
        if matched:
            sib = lab.find_next(lambda tag: tag.name == 'label' and 'infomark' in (tag.get('class') or []))
            if sib and sib.find_parent('div', class_='panel-body-print') == panel:
                return normalize_text(sib.get_text())
    return ''

# --- استخراج کانتکست دانش‌آموز از پنل ---
def extract_student_context(panel, file_name):
    student_name = find_value_in_panel(
        panel, 'نام', exact=True,
        exclude_keywords=['نام درس', 'نام رشته', 'نام مقطع', 'نام پدر', 'نام خانوادگی']
    )
    # fallback: اگر نام اشتباه باشد
    if not student_name or student_name == 'بزرگسال':
        alt_name = find_value_in_panel(
            panel, 'نام دانش‌آموز', exact=True,
            exclude_keywords=['نام درس', 'نام رشته', 'نام مقطع']
        )
        if alt_name and alt_name != 'بزرگسال':
            student_name = alt_name

    student_family = find_value_in_panel(panel, 'نام خانوادگی', exact=True)
    father_name   = find_value_in_panel(panel, 'نام پدر', exact=True)
    birth_date    = find_value_in_panel(panel, 'تاریخ تولد', exact=True)
    id_number     = find_value_in_panel(panel, 'شماره شناسنامه', exact=True)
    if not id_number:
        id_number = find_value_in_panel(panel, 'شماره شناسنامه دانش آموز', exact=True)

    student_code  = find_value_in_panel(panel, 'کد دانش آموز', exact=True) or find_value_in_panel(panel, 'کد دانش‌آموز', exact=True)
    major         = find_value_in_panel(panel, 'رشته', exact=True)
    major_id      = find_value_in_panel(panel, 'شناسه رشته', exact=True)
    grade_level   = find_value_in_panel(panel, 'مقطع', exact=True)

    return {
        'نام فایل منبع': file_name,
        'نام دانش‌آموز': student_name,
        'نام خانوادگی': student_family,
        'نام پدر': father_name,
        'تاریخ تولد': birth_date,
        'شماره شناسنامه': id_number,
        'کد دانش‌آموز': student_code,
        'رشته': major,
        'شناسه رشته': major_id,
        'مقطع': grade_level,
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
            # اگر هیچ داده‌ای پیدا نشد، رد می‌کنیم
            continue

        table = panel.find('table')
        # اگر جدول دروس وجود ندارد، حداقل رکورد هویتی با N/A برای درس‌ها ثبت شود
        if not table or not table.find('tbody'):
            full_record = student_data.copy()
            full_record.update({'کد درس': 'N/A', 'نام درس': 'N/A', 'نوع': 'N/A', 'واحد': '0', 'نام معلم': 'N/A'})
            all_records.append(full_record)
            continue

        rows = table.find('tbody').find_all('tr')
        for row in rows:
            cols = [normalize_text(col.get_text()) for col in row.find_all('td')]
            # رد سطرهای خلاصه/جمع و سطرهای ناقص
            if not cols or 'جمع واحد' in cols or not cols[0].isdigit():
                continue
            # انتظار حداقل 6 ستون: ردیف، کد درس، نام درس، نوع، واحد، نام معلم
            if len(cols) >= 6:
                course_record = {
                    'کد درس':   cols[1],
                    'نام درس':  cols[2],
                    'نوع':      cols[3],
                    'واحد':     cols[4],
                    'نام معلم': cols[5]
                }
                full_record = student_data.copy()
                full_record.update(course_record)
                all_records.append(full_record)

    return all_records

# --- پردازش همه فایل‌ها و ساخت دو خروجی ---
def process_all_html_files(folder_path='.', output_excel_path=None, preview_rows=20):
    try:
        import openpyxl  # برای ذخیره اکسل
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
        'کد دانش‌آموز', 'رشته', 'شناسه رشته', 'مقطع',
        'کد درس', 'نام درس', 'نوع', 'واحد', 'نام معلم'
    ]

    df = pd.DataFrame(all_extracted_data)
    # مرتب‌سازی ستون‌ها و افزودن ستون‌های خالی در صورت نبودن
    for col in final_columns:
        if col not in df.columns:
            df[col] = ''
    df = df[final_columns]

    # ذخیره خروجی تجمیعی
    df.to_excel(output_excel_path, index=False, engine='openpyxl')
    print(f"\n✅ موفقیت! {html_files_processed} فایل پردازش شد.")
    print(f"📥 خروجی تجمیعی: {output_excel_path}")
    print(f"📊 تعداد رکوردها: {len(df)}")

    # پیش‌نمایش رکوردهای درس
    print("\n🟦 پیش‌نمایش رکوردهای درس:")
    print(df.head(preview_rows))

    # --- ساخت فایل خلاصه دانش‌آموزان ---
    # تبدیل واحد به عدد
    df['واحد'] = pd.to_numeric(df['واحد'], errors='coerce').fillna(0)

    # استخراج سال/ماه/روز تولد از رشته تاریخ تولد (فرض فرمت پیوسته؛ در غیر این صورت به‌روزرسانی لازم است)
    df['تاریخ تولد'] = df['تاریخ تولد'].astype(str)
    df['سال تولد'] = df['تاریخ تولد'].str[:4]
    df['ماه تولد'] = df['تاریخ تولد'].str[4:6]
    df['روز تولد'] = df['تاریخ تولد'].str[6:8]

    # نرمال‌سازی ستون نوع
    df['نوع'] = df['نوع'].astype(str).apply(normalize_text)

    # ماسک‌ها
    mask_maharat = df['نوع'].str.contains('مهارت خارج از مدرسه', na=False)
    # غیرحضوری را با انعطاف: شامل «غیر» و «حضوری» (برای پوشش همه نگارش‌ها)
    mask_ghair = df['نوع'].str.contains('غیر', na=False) & df['نوع'].str.contains('حضوری', na=False)
    # حضوری واقعی بدون «انضباط» و بدون مهارت خارج از مدرسه
    mask_hazoori = (df['نوع'] == 'حضوری') & (df['نام درس'] != 'انضباط') & (~mask_maharat)

    # گروه‌بندی و محاسبه مجموع‌ها
    group_keys = [
        'نام فایل منبع','نام دانش‌آموز','نام خانوادگی','نام پدر',
        'سال تولد','ماه تولد','روز تولد','شماره شناسنامه','کد دانش‌آموز',
        'رشته','شناسه رشته','مقطع'
    ]

    # برای استفاده از ماسک‌های سراسری در تجمیع، ایندکس‌های گروه را استفاده می‌کنیم
    df = df.reset_index()  # اضافه‌کردن ستون index برای هم‌ترازی ماسک‌ها

    summary = df.groupby(group_keys, as_index=False).agg(
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
    # پوشه‌ی شامل فایل‌های HTML را می‌توانید به‌دلخواه تنظیم کنید
    process_all_html_files(folder_path='.', output_excel_path=None, preview_rows=20)
