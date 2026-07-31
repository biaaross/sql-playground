# SQL Handler Mini Project

## Project Description

This project was created to practice MySQL Stored Procedures and Handler structures.

### Topics

- Stored Procedure
- DECLARE
- SELECT INTO
- IF / ELSE
- CASE
- CONTINUE HANDLER
- EXIT HANDLER
- NOT FOUND
- SQLEXCEPTION
- SIGNAL
- INSERT
- UPDATE
- DELETE

---

# Task 1

Create a procedure named **product_search_handler**.

Requirements

- Receive product_id as input.
- If the product exists, display:
  - Product Name
  - Price
  - Stock
- If the product does not exist,
  use **CONTINUE HANDLER FOR NOT FOUND**.
- Display:

```
Product not found.
```

Status

- [ ]

---

# Task 2

Create a procedure named **customer_search_handler**.

Requirements

- Receive customer_id.
- Show customer's full name and city.
- If the customer cannot be found,
  use **NOT FOUND HANDLER**.

Status

- [ ]

---

# Task 3

Create a procedure named **add_new_brand**.

Requirements

- Receive brand_name.
- Insert the new brand.
- If any SQL error occurs,
  use **EXIT HANDLER FOR SQLEXCEPTION**.
- Show

```
Brand added successfully.
```

or

```
Brand could not be added.
```

Status

- [ ]

---

# Task 4

Create a procedure named **update_product_price**.

Requirements

- Receive
  - product_id
  - new_price
- If price <= 0
  use **SIGNAL**
- Otherwise update the price.

Status

- [ ]

---

# Task 5

Create a procedure named **delete_product**.

Requirements

- Receive product_id.
- Delete the product.
- If the product cannot be found,
  use **NOT FOUND HANDLER**.
- If SQL error occurs,
  use **EXIT HANDLER**.

Status

- [ ]

---

# Task 6

Create a procedure named **increase_stock**.

Requirements

- Receive
  - product_id
  - increase_amount
- Stock cannot be negative.
- If increase_amount <=0
  use SIGNAL.
- Update stock.

Status

- [ ]

---

# Task 7

Create a procedure named **new_sale**.

Requirements

Receive

- customer_id
- product_id
- quantity

Rules

- Product must exist.
- Customer must exist.
- Stock must be enough.
- Quantity cannot be zero.
- Use
  - NOT FOUND
  - SIGNAL
  - SQLEXCEPTION

Status

- [ ]

---

# Task 8

Create a procedure named **brand_information**.

Requirements

Receive brand_id.

Display

- Brand Name
- Number of Products
- Average Price

Use

NOT FOUND HANDLER

Status

- [ ]

---

# Task 9

Create a procedure named **category_statistics**.

Requirements

Receive category_id.

Display

- Category Name
- Product Count
- Total Stock
- Average Price

If category does not exist,
use NOT FOUND.

Status

- [ ]

---

# Task 10

Final Challenge

Create a procedure named

**product_management_system**

Requirements

Inside a single procedure use

- DECLARE
- SELECT INTO
- IF
- CASE
- NOT FOUND
- CONTINUE
- EXIT
- SQLEXCEPTION
- SIGNAL
- INSERT
- UPDATE
- DELETE

Status

- [ ]