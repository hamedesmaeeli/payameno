import pandas as pd
from bs4 import BeautifulSoup
import os
import re


# --- تابع کمکی: استخراج مقدار با استفاده از برچسب ---
def find_label_value(info_block, label_text):
    """
    مقدار متنی که بلافاصله بعد از یک برچسب (label) خاص قرار دارد و دارای کلاس infomark ng-binding است را پیدا می‌کند.
    """
    label_element = info_block.find('label', string=label_text)
    if label_element:
        # مقدار در برچسب بعدی با کلاس 'infomark ng-binding' است
        value_element = label_element.find_next_sibling('label', class_='infomark ng-binding')
        if value_element:
            return value_element.text.strip()
    return ''


# --- تابع اصلی استخراج از یک فایل HTML (بدون تغییر منطق استخراج) ---
def extract_data_from_html(html_file_path):
    """
    فایل HTML گزارش انتخاب واحد را تجزیه و تحلیل کرده و لیست رکوردهای استخراج شده را برمی‌گرداند.
    همچنین 'نام فایل منبع' را به هر رکورد اضافه می‌کند.
    """
    file_name = os.path.basename(html_file_path)

    try:
        with open(html_file_path, 'r', encoding='utf-8') as f:
            html_content = f.read()
    except FileNotFoundError:
        print(f"❌ خطا: فایل در مسیر مشخص شده ({html_file_path}) یافت نشد.")
        return []
    except Exception as e:
        print(f"❌ خطا در خواندن فایل {file_name}: {e}")
        return []

    soup = BeautifulSoup(html_content, 'html.parser')
    all_records = []

    # استفاده از 'کد دانش آموز:' به عنوان قوی‌ترین و مطمئن‌ترین لنگر
    code_text_elements = soup.find_all(string=lambda t: t and 'کد دانش آموز:' in t)

    if not code_text_elements:
        print(f"⚠️ اخطار: هیچ رکوردی در فایل {file_name} یافت نشد.")
        return []

    for code_text_element in code_text_elements:
        info_block = code_text_element.find_parent('div', class_='school-info')

        if not info_block:
            continue

        student_info_text = info_block.get_text(separator='|', strip=True)

        # استخراج فیلدهای ثابت
        student_code_match = re.search(r'کد دانش آموز:\|(.*?)\|', student_info_text)
        student_code = student_code_match.group(1).strip() if student_code_match else ''
        major_match = re.search(r'رشته:\|(.*?)\|', student_info_text)
        major = major_match.group(1).strip() if major_match else ''

        # استخراج فیلدهای جدید با استفاده از تابع کمکی
        father_name = find_label_value(info_block, 'نام پدر:')
        birth_date = find_label_value(info_block, 'تاریخ تولد:')
        id_number = find_label_value(info_block, 'شماره شناسنامه:')

        # استخراج نام و نام خانوادگی
        name_element = info_block.find('label', string='نام:')
        family_element = info_block.find('label', string='نام خانوادگی:')

        if name_element and family_element:
            student_name = name_element.find_next_sibling('label', class_='infomark ng-binding').text.strip()
            student_family = family_element.find_next_sibling('label', class_='infomark ng-binding').text.strip()
        else:
            student_name = "❌ نیاز به تفکیک دستی (نام چسبیده)"
            student_family = "❌ نیاز به تفکیک دستی (نام خانوادگی چسبیده)"

        student_data = {
            'نام فایل منبع': file_name,  # <-- ستون جدید: نام فایل HTML
            'نام دانش‌آموز': student_name,
            'نام خانوادگی': student_family,
            'نام پدر': father_name,
            'تاریخ تولد': birth_date,
            'شماره شناسنامه': id_number,
            'کد دانش‌آموز': student_code,
            'رشته': major,
        }

        # مرحله ۳: استخراج دروس از بلوک جدول
        main_print_block = code_text_element.find_parent('div', class_='panel-body-print')
        if not main_print_block:
            continue

        table = main_print_block.find('table', class_='table table-bordered table-striped')

        # اگر درسی انتخاب نشده یا جدول پیدا نشد
        if not table or not table.find('tbody'):
            full_record = student_data.copy()
            full_record.update({
                'کد درس': 'N/A',
                'نام درس': 'N/A',
                'نوع': 'N/A',
                'واحد': 'N/A',
                'نام معلم': 'N/A'
            })
            all_records.append(full_record)
            continue

        # استخراج سطرها
        rows = table.find('tbody').find_all('tr')

        for row in rows:
            cols = [col.text.strip() for col in row.find_all('td')]

            # سطر جمع واحد یا سطر خالی را نادیده بگیر
            if 'جمع واحد' in cols or not cols or not cols[0].isdigit():
                continue

            if len(cols) >= 6:
                course_record = {
                    'کد درس': cols[1],
                    'نام درس': cols[2].replace('\n', '').replace('\t', '').strip(),
                    'نوع': cols[3],
                    'واحد': cols[4],
                    'نام معلم': cols[5].replace('\n', ' ').replace('\t', ' ').strip()
                }

                full_record = student_data.copy()
                full_record.update(course_record)
                all_records.append(full_record)

    return all_records


# --- تابع تجمیع کننده و ذخیره‌ساز اصلی ---
def process_all_html_files(folder_path='.', output_excel_path='گزارش_تجمیعی_انتخاب_واحد.xlsx'):
    """
    تمام فایل‌های HTML موجود در مسیر داده شده را پردازش و نتایج را در یک فایل اکسل تجمیع می‌کند.
    """

    # اطمینان از اینکه pandas و openpyxl نصب شده‌اند
    try:
        import openpyxl
    except ImportError:
        print("❌ خطا: ماژول 'openpyxl' برای ذخیره اکسل مورد نیاز است. لطفاً آن را نصب کنید: pip install openpyxl")
        return

    all_extracted_data = []
    html_files_processed = 0

    print(f"🔎 در حال جستجوی فایل‌های HTML در پوشه: {os.path.abspath(folder_path)}")

    # لیست کردن تمام فایل‌های HTML در پوشه
    for file_name in os.listdir(folder_path):
        if file_name.endswith('.html') or file_name.endswith('.htm'):
            html_file_path = os.path.join(folder_path, file_name)

            print(f"--- 🔄 پردازش فایل: {file_name} ---")

            # استخراج داده‌ها از فایل HTML و افزودن به لیست نهایی
            records = extract_data_from_html(html_file_path)
            all_extracted_data.extend(records)
            html_files_processed += 1

    if not all_extracted_data:
        print(f"\n❌ عملیات پایان یافت: هیچ داده‌ای از {html_files_processed} فایل HTML پردازش شده استخراج نشد.")
        return

    # تعریف ستون‌های نهایی
    final_columns = [
        'نام فایل منبع', 'نام دانش‌آموز', 'نام خانوادگی', 'نام پدر', 'تاریخ تولد', 'شماره شناسنامه',
        'کد دانش‌آموز', 'رشته',
        'کد درس', 'نام درس', 'نوع', 'واحد', 'نام معلم'
    ]

    df = pd.DataFrame(all_extracted_data, columns=final_columns)

    # --- ذخیره خروجی ---
    try:
        df.to_excel(output_excel_path, index=False, engine='openpyxl')
        print("\n" + "=" * 50)
        print(f"✅ موفقیت! {html_files_processed} فایل پردازش شد.")
        print(f"📥 فایل اکسل تجمیعی با نام '{output_excel_path}' با موفقیت تولید شد.")
        print("تعداد رکوردهای خروجی (سطر):", len(df))
        print("=" * 50)

    except Exception as e:
        print(f"\n❌ خطا در ذخیره فایل اکسل: {e}")


# --- اجرای تابع اصلی ---
if __name__ == '__main__':
    # این تابع تمام فایل‌های HTML در پوشه جاری را پردازش می‌کند.
    # کافی است تمام فایل‌های HTML و main2.py در یک پوشه باشند و این کد را اجرا کنید.
    process_all_html_files()