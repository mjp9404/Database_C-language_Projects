Forever Golf

Authors: Parker, Minjong, Leo, Jonathan
Date: February 19, 2022

Creating tables should be running the codes in this order:

1.	Create course information table.
	a.	Create course_id, course_name, city, postal_code, country, average_rating, description, length and year built columns. All of them should not be null. postal code must be in the format L9L9L9 where L is a letter and 9 is a digit. Average_Rating must be between 1 and 5, whole number and the length must be in yards.

2.	Create tee times table.
	a.	Tee_time, course_id, price, has cart, holes, and available slots table must be created. All the columns cannot be null. Holes can only be 9 or 18 and has cart column only accepts one character (y/n).

3.	Create the customer table and the columns needed:
	a.	Customer_id, favorite_course_id, email_address, first_name, last_name, gift_card_credit, and amount_of_cards columns must be created. All of them should not be null. Email address must contain @ symbol and the gift card credit must be greater than 0.

4.	Create the credit card table.
	a.	Add card_number, customer_id, name_on_card, expiration_date and default_card columns. All of them shouldn’t be null.

5.	Create reservation table.
	a.	Add reservation_id, customer_id, tee _ime, players, green fees paid, tax paid, and amount_charged columns. All the 

6.	Create a table called customer review.
	a.	Create the columns review_id, course_id, customer_id, title, comments, and star_rating columns. All columns should not be null. Star rating must be a whole number between 1 and 5.

7.	Create promo code table.
	a.	Add the columns promo_code, rewards_id, reservation_id, is_used, value, date_issued, and expiry_date. Expiry_date last 2 digits must be between 1 and 12. Is_used should be 1 or 0. All the columns cannot be null.

8.	Create foreever rewards table.
	a.	Create the columns rewards_id, customer_id, and promos_owned. All columns cannot be null.

9.	Create the bridging table with card_number and reservation_id.