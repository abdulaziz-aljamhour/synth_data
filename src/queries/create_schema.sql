CREATE TABLE IF NOT EXISTS `REGIONS` (
	`REGION_ID` integer primary key NOT NULL UNIQUE,
	`REGION_NAME_AR` TEXT NOT NULL,
	`REGION_NAME_EN` TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS `PRODUCT_STATUS_LOOKUP` (
	`PRODUCT_STATUS_ID` integer primary key NOT NULL UNIQUE,
	`PRODUCT_STATUS_AR` TEXT NOT NULL,
	`PRODUCT_STATUS_EN` TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS `ORDERS` (
	`ORDER_ID` integer primary key NOT NULL UNIQUE,
	`ORDER_STATUS_ID` INTEGER NOT NULL,
	`PAYMENT_STATUS_ID` INTEGER NOT NULL,
	`PRODUCT_ID` INTEGER NOT NULL,
	`USER_ID` INTEGER NOT NULL,
	`SELLER_ID` INTEGER NOT NULL,
	`TOTAL` INTEGER NOT NULL,
	`SUBTOTAL` INTEGER NOT NULL,
	`SHIPPING_COST` INTEGER NOT NULL,
	`PAYMENT_METHOD_ID` INTEGER NOT NULL,
	`TRACKING_NUMBER` INTEGER NOT NULL,
	`NOTES` TEXT NOT NULL,
	`CREATED_AT` REAL NOT NULL,
	`UPDATED_AT` REAL NOT NULL,
	`ORDERED_AT` REAL NOT NULL,
	`SHIPPED_AT` REAL NOT NULL,
FOREIGN KEY(`ORDER_STATUS_ID`) REFERENCES `ORDER_STATUS`(`ORDER_STATUS_ID`),
FOREIGN KEY(`PAYMENT_STATUS_ID`) REFERENCES `PAYMENT_STATUS`(`PAYMENT_STATUS_ID`),
FOREIGN KEY(`PRODUCT_ID`) REFERENCES `PRODUCTS`(`PRODUCT_ID`),
FOREIGN KEY(`USER_ID`) REFERENCES `USERS`(`USER_ID`),
FOREIGN KEY(`SELLER_ID`) REFERENCES `SELLER`(`SELLER_ID`),
FOREIGN KEY(`PAYMENT_METHOD_ID`) REFERENCES `PAYMENT_METHOD`(`PAYMENT_METHOD_ID`)
);
CREATE TABLE IF NOT EXISTS `USERS` (
	`USER_ID` integer primary key NOT NULL UNIQUE,
	`NATIONAL_ID` INTEGER,
	`FIRST_NAME` TEXT NOT NULL,
	`MIDDLE_NAME` TEXT NOT NULL,
	`FAMILY_NAME` TEXT NOT NULL,
	`PHONE_NUMBER` TEXT NOT NULL,
	`BIRTH_DATE` INTEGER NOT NULL,
	`REGION_ID` INTEGER NOT NULL,
	`USER_NAME` TEXT NOT NULL,
	`PASSWORD` TEXT NOT NULL,
	`CREATION_DATE` REAL NOT NULL,
FOREIGN KEY(`REGION_ID`) REFERENCES `REGIONS`(`REGION_ID`)
);
CREATE TABLE IF NOT EXISTS `ORDER_STATUS` (
	`ORDER_STATUS_ID` integer primary key NOT NULL UNIQUE,
	`ORDER_STATUS_AR` TEXT NOT NULL,
	`ORDER_STATUS_EN` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `PAYMENT_STATUS` (
	`PAYMENT_STATUS_ID` integer primary key NOT NULL UNIQUE,
	`PAYMENT_STATUS_AR` INTEGER NOT NULL,
	`PAYMENT_STATUS_EN` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `PAYMENT_METHOD` (
	`PAYMENT_METHOD_ID` integer primary key NOT NULL UNIQUE,
	`PAYMENT_METHOD_AR` INTEGER NOT NULL,
	`PAYMENT_METHOD_EN` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `PRODUCTS` (
	`PRODUCT_ID` integer primary key NOT NULL UNIQUE,
	`PRODUCT_NAME_AR` TEXT NOT NULL,
	`PRODUCT_NAME_EN` TEXT NOT NULL,
	`DESCRIPTION` TEXT NOT NULL,
	`SELLER_ID` INTEGER NOT NULL,
	`STATUS` INTEGER NOT NULL,
	`CREATED_AT` REAL NOT NULL,
	`UPDATED_AT` REAL NOT NULL
);
CREATE TABLE IF NOT EXISTS `SELLER` (
	`SELLER_ID` integer primary key NOT NULL UNIQUE,
	`NAME_AR` TEXT NOT NULL,
	`NAME_EN` TEXT NOT NULL,
	`RATING` INTEGER NOT NULL,
	`NUMBER_OF_RATINGS` INTEGER NOT NULL,
	`CREATED_AT` REAL NOT NULL,
	`UPDATED_AT` REAL NOT NULL
);
CREATE TABLE IF NOT EXISTS `SHIPPER` (
	`SHIPPER_ID` integer primary key NOT NULL UNIQUE,
	`SHIPPING_CATEGORY_ID` INTEGER NOT NULL,
	`CREATED_AT` INTEGER NOT NULL,
	`UPDATED_AT` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `SHIPPING_CONTRACT_AGREEMENT` (
	`SHIPPING_CONTRACT_ID` integer primary key NOT NULL UNIQUE,
	`SELLER_ID` INTEGER NOT NULL,
	`SHIPPER_ID` INTEGER NOT NULL,
	`CONTRACT_DURATION` INTEGER NOT NULL,
	`STATUS` INTEGER NOT NULL,
	`SERVICE_LEVEL_ID` INTEGER NOT NULL,
	`BEGINS_AT` REAL NOT NULL,
	`ENDS_AT` REAL NOT NULL,
	`CREATED_AT` REAL NOT NULL,
	`UPDATED_AT` REAL NOT NULL,
FOREIGN KEY(`SERVICE_LEVEL_ID`) REFERENCES `SERVICE_LEVEL_LOOKUP`(`SERVICE_LEVEL_ID`)
);

CREATE TABLE IF NOT EXISTS `SERVICE_LEVEL_LOOKUP` (
	`SERVICE_LEVEL_ID` integer primary key NOT NULL UNIQUE,
	`SERVICE_LEVEL_AR` TEXT NOT NULL,
	`SERVICE_LEVEL_EN` TEXT NOT NULL
);