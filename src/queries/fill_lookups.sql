INSERT INTO REGIONS (REGION_ID, REGION_NAME_AR, REGION_NAME_EN) VALUES
(1, 'الرياض', 'Riyadh'),
(2, 'مكة المكرمة', 'Mecca'),
(3, 'المدينة المنورة', 'Medina'),
(4, 'الشرقية', 'Eastern Province'),
(5, 'عسير', 'Asir'),
(6, 'تبوك', 'Tabuk'),
(7, 'حائل', 'Hail'),
(8, 'الحدود الشمالية', 'Northern B`orders'),
(9, 'جازان', 'Jazan'),
(10, 'نجران', 'Najran'),
(11, 'الباحة', 'Al-Baha'),
(12, 'الجوف', 'Al-Jawf'),
(13, 'القصيم', 'Qassim');

INSERT INTO PAYMENT_STATUS (PAYMENT_STATUS_ID, PAYMENT_STATUS_AR, PAYMENT_STATUS_EN) VALUES
(1, 'مدفوع', 'Paid'),
(2, 'لم يتم الدفع', 'Unpaid'),
(3, 'مرفوض', 'Rejected');

INSERT INTO ORDER_STATUS (ORDER_STATUS_ID, ORDER_STATUS_AR, ORDER_STATUS_EN) VALUES
(1, 'قيد المعالجة', 'Processing'),
(2, 'قيد الشحن', 'Shipping'),
(3, 'مكتمل', 'Completed'),
(4, 'ملغى', 'Cancelled');

INSERT INTO PAYMENT_METHOD (PAYMENT_METHOD_ID, PAYMENT_METHOD_AR, PAYMENT_METHOD_EN) VALUES
(1, 'مدى', 'MADA'),
(2, 'بطاقة ائتمان', 'Credit Card'),
(3, 'أبل باي', 'Apple Pay'),
(4, 'نقداً عند التسليم', 'Cash on Delivery');
