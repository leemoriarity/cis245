/* ADD A NEW CUSTOMER - usp_INSERT_ CUSTOMER*/

CREATE PROCEDURE usp_INSERT_CUSTOMER
@customerid decimal (4),
@firstname char (25),
@lastname char (25),
@address char (60),
@city char (25),
@state char (2),
@postalcode decimal (5),
@phone char (14),
@email char (60)
AS
BEGIN
INSERT INTO CUSTOMERS(CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, POSTAL_CODE, PHONE, EMAIL)
VALUES (@customerid, @firstname, @lastname, @address, @city, @state, @postalcode, @phone, @email)
END

/*   sample use:    exec usp_INSERT_CUSTOMER … */



/* ADD A NEW PRODUCT - usp_INSERT_PRODUCT*/

CREATE PROCEDURE usp_INSERT_PRODUCT
@productid decimal (4),
@productname char (60),
@unitprice decimal (6),
@instock decimal (3)
AS
BEGIN
INSERT INTO PRODUCTS(PROD_ID, PROD_NAME, UNIT_PRICE, IN_STOCK)
VALUES (@productid, @productname, @unitprice, @instock)
END

/*   sample use:    exec usp_INSERT_PRODUCT … */



/* ADD A NEW PRODUCT - usp_INSERT_PAYMENT*/

CREATE PROCEDURE usp_INSERT_PAYMENT
@paymentid decimal (4),
@customernum decimal (4),
@cardlast4 decimal (4),
@expdate char (7),
@paymentdate date
AS
BEGIN
INSERT INTO PAYMENTS(PAYMENT_ID, CUSTOMER_NUM, CARD_LAST4, EXP_DATE, PAYMENT_DATE)
VALUES (@paymentid, @customernum, @cardlast4, @expdate, @paymentdate)
END

/*   sample use:    exec usp_INSERT_PAYMENT … */



/* DELETE A PRODUCT BY PRODUCT_ID - usp_DELETE_PRODUCT */

CREATE PROCEDURE usp_DELETE_PRODUCT
@productid decimal (4)
AS DELETE
FROM PRODUCTS
WHERE SERVER_ID = @productid

/* sample use: exec usp_DELETE_PRODUCT 1  */



/* DELETE A PRODUCT BY PRODUCT_ID - usp_DELETE_PRODUCT */

CREATE PROCEDURE usp_DELETE_ORDER
@ordernum decimal (4)
AS DELETE
FROM ORDERS, ORDER_DETAILS, PAYMENTS
WHERE ORDER_NUM = @ordernum

/* sample use: exec usp_DELETE_ORDER 1004  */



/* DELETE A CUSTOMER BY CUSTOMER_ID - usp_DELETE_CUSTOMER */

CREATE PROCEDURE usp_DELETE_CUSTOMER
@customerid decimal (4)
AS DELETE
FROM CUSTOMERS
WHERE ORDER_NUM = @customerid

/* sample use: exec usp_DELETE_CUSTOMER 1002  */



/* DELETE A CUSTOMER BY EMAIL - usp_DELETE_CUSTOMER_EMAIL */

CREATE PROCEDURE usp_DELETE_CUSTOMER_EMAIL
@email char (60) 
AS DELETE
FROM CUSTOMERS
WHERE EMAIL = @email

/* sample use: exec usp_DELETE_CUSTOMER_EMAIL ‘donniegee@icloud.com’  */




/* UPDATE CUSTOMER EMAIL - usp_UPDATE_CUSTOMER_EMAIL */

CREATE PROCEDURE usp_UPDATE_CUSTOMER_EMAIL
@customerid decimal (4),
@email char (60)
AS
UPDATE CUSTOMERS
SET
EMAIL = @email,
WHERE
CUSTOMER_ID = @customerid

/*  sample use:  exec usp_UPDATE_CUSTOMER_EMAIL ’new@email.com’… */



/* UPDATE CUSTOMER PHONE - usp_UPDATE_CUSTOMER_PHONE */
CREATE PROCEDURE usp_UPDATE_CUSTOMER_PHONE
@customerid decimal (4),
@phone char (14)
AS
UPDATE CUSTOMERS
SET
PHONE = @phone,
WHERE
CUSTOMER_ID = @customerid

/*  sample use:  exec usp_UPDATE_CUSTOMER_PHONE ‘555-123-4567’… */



/* UPDATE PRODUCT PRICE - usp_UPDATE_PRODUCT_PRICE */

CREATE PROCEDURE usp_UPDATE_PRODUCT_PRICE
@productid decimal (4),
@price decimal (6)
AS
UPDATE PRODUCTS
SET
UNIT_PRICE = @price,
WHERE
PRODUCT_ID = @productid

/*  sample use:  exec usp_ UPDATE_PRODUCT_PRICE… */



/* UPDATE PRODUCT QUANTITY - usp_UPDATE_PRODUCT_QUANTITY */

CREATE PROCEDURE usp_UPDATE_PRODUCT_PRICE
@productid decimal (4),
@instock decimal (3)
AS
UPDATE PRODUCTS
SET
IN_STOCK = @instock,
WHERE
PRODUCT_ID = @productid

/*  sample use:  exec usp_ UPDATE_PRODUCT_QUANTITY… */
