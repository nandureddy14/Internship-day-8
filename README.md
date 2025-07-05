# Internship-day-8

Of course, Hari! Here's a clear explanation of each SQL procedure and function you wrote for your `E_commerce` database, along with the logic behind them and how they’re useful in real-world applications:

---

## 🧾 1. **Stored Procedure: `Avg_sales`**
**Purpose**: Find the average order amount for customers in a specific city.

### 🔍 How it works:
- Joins the `Customers` and `Orders` tables on `CustomerID`
- Filters results based on the `@city` input parameter
- Uses `AVG()` to calculate the average amount of orders made by customers in that city
- Groups the result by `City` so that only one average is shown

**Use Case**: Great for analyzing sales trends in different cities—could help a business decide where to promote or expand.

---

## ➕ 2. **Stored Procedure: `add_customer`**
**Purpose**: Add a new customer to the `Customers` table.

### 🛠️ How it works:
- Accepts 3 parameters: `@CustomerID`, `@Name`, `@city`
- Inserts a new record into `Customers`

**Use Case**: Helps automate onboarding of customers into your database through backend systems or admin portals.

---

## ❌ 3. **Stored Procedure: `del_order`**
**Purpose**: Delete an order by its ID with proper error handling.

### 💡 How it works:
- Accepts one parameter: `@OrderID`
- Uses a `TRY...CATCH` block to safely attempt deletion
- If an error (like foreign key violation) occurs, it captures the error message using `ERROR_MESSAGE()` and prints it

**Use Case**: Ensures that deletions don’t silently fail—ideal for building a reliable admin panel or clean-up script.

---

## 📆 4. **Function: `month_sales()`**
**Purpose**: Return all orders made in June.

### 📋 How it works:
- Inline Table-Valued Function that filters `Orders` where `MONTH(OrderDate) = 6`

**Use Case**: Simple and reusable logic for generating sales reports based on month—handy for dashboards or audit logs.

---

## 📦 5. **Function: `Sale_Type(@amt INT)`**
**Purpose**: Classify orders based on the `Amount` into different categories.

### 🧠 How it works:
- Accepts one input: order amount
- Uses a `CASE` statement to return:
  - `'Big_order'` if amount > 2000  
  - `'Avg_order'` if amount > 1000 and ≤ 2000  
  - `'Small_order'` if amount ≤ 1000

**Use Case**: Helpful in tagging transactions for analytics or creating labeled datasets for visualization.

---

