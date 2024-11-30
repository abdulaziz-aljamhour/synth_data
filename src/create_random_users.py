import pandas as pd
import random
import string
from datetime import datetime


male_names = [
    'محمد', 'علي', 'سلمان', 'فهد', 'عبدالله', 'حسن', 'يوسف', 'سامي', 'ماجد', 'عادل',
    'راشد', 'تركي', 'عبدالرحمن', 'صالح', 'خالد', 'مبارك', 'خلف', 'بدر', 'غسان', 'إبراهيم'
]

female_names = [
    'فاطمة', 'نور', 'مريم', 'خديجة', 'عائشة', 'مها', 'نورة', 'سارة', 'هدى', 'عبير',
    'أمل', 'هناء', 'آية', 'رنا', 'سلمى', 'شذى', 'رجاء', 'زينب', 'رغد', 'أسماء'
]


family_names = [
    'الزهراني', 'التميمي', 'الغامدي', 'الشمري', 'العتيبي', 'السعودي', 'القحطاني', 'الراشد',
    'المالكي', 'الحربي', 'الفيصل', 'الشيباني', 'القصيبي', 'البقمي', 'البلوي', 'الجيلاني',
    'الحسيني', 'الفهيد', 'السبيعي', 'الداوود'
]

# Convert them to DataFrames
df_male_names = pd.DataFrame(male_names, columns=["FIRST_NAME"])
df_female_names = pd.DataFrame(female_names, columns=["FIRST_NAME"])
df_family_names = pd.DataFrame(family_names, columns=["FAMILY_NAME"])

def generate_phone_number():
    return "05" + ''.join(random.choices(string.digits, k=8))


def generate_national_id():
    return ''.join(random.choices(string.digits, k=10))


# Function to generate a random birth date between 1980 and 2010
def generate_birth_date():
    year = random.randint(1980, 2010)
    month = random.randint(1, 12)
    day = random.randint(1, 28)  # To avoid issues with days in months
    return datetime(year, month, day)

# Function to generate a random username
def generate_username(user_id):
    return f"user{user_id}"

# Function to generate a random password
def generate_password(user_id):
    return f"password{user_id}"

# Function to generate random user data
def generate_user_data(user_id):
    first_name = random.choice(df_male_names["FIRST_NAME"].tolist() + df_female_names["FIRST_NAME"].tolist())
    family_name = random.choice(df_family_names["FAMILY_NAME"].tolist())
    phone_number = generate_phone_number()
    national_id = generate_national_id()
    birth_date = generate_birth_date()
    region_id = random.randint(1, 13)
    username = generate_username(user_id)
    password = generate_password(user_id)
    creation_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    
    return {
        "USER_ID": user_id,
        "NATIONAL_ID": national_id,
        "FIRST_NAME": first_name,
        "FAMILY_NAME": family_name,
        "PHONE_NUMBER": phone_number,
        "BIRTH_DATE": birth_date,
        "REGION_ID": region_id,
        "USER_NAME": username,
        "PASSWORD": password,
        "CREATION_DATE": creation_date
    }

# Create a list of users
users = [generate_user_data(i) for i in range(1, 1001)]

# Convert the list of users to a pandas DataFrame
df_users = pd.DataFrame(users)

df_users.head()