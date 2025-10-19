import pdfplumber
import pandas as pd
import re

pdf_path = "1111.pdf"
lessons = []

with pdfplumber.open(pdf_path) as pdf:
    for page_num, page in enumerate(pdf.pages):
        text = page.extract_text()
        print(f"\n📄 صفحه {page_num+1}:\n{text[:500]}")  # فقط ۵۰۰ کاراکتر اول برای بررسی

        lines = text.split("\n")
        for line in lines:
            # regex دقیق برای تشخیص ساختار جدول دروس
            match = re.match(
                r"^(\d+|[۰-۹]+)\s+(\d+|[۰-۹]+)\s+([\u0600-\u06FF\s]+?)\s+(غير حضورى|حضورى)\s+(\d+|[۰-۹]+)\s+([\u0600-\u06FF\s]+)",
                line.strip()
            )
            if match:
                lessons.append({
                    "ردیف": match.group(1),
                    "کد درس": match.group(2),
                    "نام درس": match.group(3).strip(),
                    "نوع حضور": match.group(4),
                    "تعداد واحد": int(match.group(5)),
                    "نام معلم": match.group(6).strip()
                })

# بررسی نتیجه
if not lessons:
    print("⛔ جدول دروس از فایل PDF استخراج نشد. لطفاً خروجی بالا را بررسی کن تا ببینیم آیا متن قابل خواندن هست یا نه.")
else:
    df = pd.DataFrame(lessons)
    total_units = df["تعداد واحد"].sum()
    df.loc[len(df.index)] = ["", "", "جمع واحدها", "", total_units, ""]
    df.to_excel("لیست_دروس_دانش‌آموز.xlsx", index=False)
    print("✅ فایل اکسل با موفقیت ذخیره شد.")
