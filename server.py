from binascii import Error
from flask import Flask, jsonify, render_template
import sqlite3
from sqlalchemy import create_engine
import pandas as pd

app = Flask(__name__)

# Create a connection to the SQLite database
def create_connection(db_file):
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)
    return conn

# Load data into the "db_data" table
df = pd.read_csv("Amazon.csv")
connection = create_connection("Amazon.db")
df.to_sql('db_data', connection, if_exists='replace')
connection.close()

# Engine for the "db_data" table
db_url = 'sqlite:///Amazon.db'
engine = create_engine(db_url, echo=True)

# Engine for the "Products" table

data_db_url = 'sqlite:///data.db'
data_engine = create_engine(data_db_url, echo=True)

# Route to render the index template
@app.route('/')
def index():
    return render_template('index.html')





# First chart
sql_query = """
SELECT
  SUM(CASE WHEN "is amazon seller" = 'Y' THEN 1 ELSE 0 END) AS AmazonSellerCount,
  SUM(CASE WHEN "is amazon seller" != 'Y' OR "is amazon seller" IS NULL THEN 1 ELSE 0 END) AS NotAmazonSellerCount
FROM db_data;
"""

@app.route('/get-datachart')
def get_datachart():
    try:
        # Execute the query and read the result into a DataFrame
        df_2 = pd.read_sql(sql_query, engine)

        # Convert int64 to int for serialization
        amazon_seller_count = int(df_2['AmazonSellerCount'].iloc[0])
        not_amazon_seller_count = int(df_2['NotAmazonSellerCount'].iloc[0])

        # Create a list of dictionaries representing the data
        data_list_of_dicts = [
            {"Label": "Amazon Seller", "Count": amazon_seller_count},
            {"Label": "Not Amazon Seller", "Count": not_amazon_seller_count}
        ]

        # Return the data as JSON
        return jsonify(data_list_of_dicts)

    except Exception as e:
        # Handle exceptions, log them, or return an error response
        return jsonify({'error': str(e)})
    




# Second chart
sql_query_2 = """
SELECT "Product Name", "Selling Price"
FROM db_data
GROUP BY "Product Name", "Selling Price"
LIMIT 4;
"""

@app.route('/get-datachart-2')
def get_datachart_2():
    try:
        # Execute the query and read the result into a DataFrame
        df_2 = pd.read_sql(sql_query_2, engine)

        # Create a list of dictionaries representing the data
        data_list_of_dicts = [
            {"category": product, "value": selling_price} for product, selling_price in zip(df_2['Product Name'], df_2['Selling Price'])
        ]

        # Return the data as JSON
        return jsonify(data_list_of_dicts)

    except Exception as e:
        # Handle exceptions, log them, or return an error response
        return jsonify({'error': str(e)})
    





# Third chart


@app.route('/get-datachart-3')
def get_datachart_3():
    try:
        # Update the SQL query to reference the 'db_data' table
        sql_query_3 = """  
        SELECT ProductName, SUM(Price) AS TotalSales
        FROM Products
        GROUP BY ProductName
        ORDER BY TotalSales DESC
        LIMIT 5;
        """    

        # Execute the query and read the result into a DataFrame
        df_3 = pd.read_sql(sql_query_3, data_engine)

        # Create a list of dictionaries representing the data
        data_list_of_dicts = [
            {"category": row['ProductName'], "value": row['TotalSales']} for index, row in df_3.iterrows()
        ]

        # Return the data as JSON
        return jsonify(data_list_of_dicts)

    except Exception as e:
        # Handle exceptions, log them, or return an error response
        return jsonify({'error': str(e)})


#fouth chart 
    
@app.route('/get-datachart-4')
def get_datachart_4():
    try:
        # Update the SQL query to reference the new query for chart 4
        sql_query_4 = """
        SELECT
            Customers.CustomerID,
            SUM(Orders.TotalAmount) AS TotalAmountSpent
        FROM
            Customers
        JOIN
            Orders ON Customers.CustomerID = Orders.CustomerID
        GROUP BY
            Customers.CustomerID
        ORDER BY
            TotalAmountSpent DESC
        LIMIT 7;
        """

        # Execute the query and read the result into a DataFrame
        df_4 = pd.read_sql(sql_query_4, data_engine)

        # Create a list of dictionaries representing the data
        data_list_of_dicts = [
            {
                "customer_id": row['CustomerID'],
                "total_amount_spent": row['TotalAmountSpent']
            } for index, row in df_4.iterrows()
        ]

        # Return the data as JSON
        return jsonify(data_list_of_dicts)

    except Exception as e:
        # Handle exceptions, log them, or return an error response
        return jsonify({'error': str(e)})



#chart 5
def get_datachart_5():
    try:
        # Update the SQL query for chart 5
        sql_query_5 = """
        SELECT
            Status,
            COUNT(*) AS order_count
        FROM
            Orders
        GROUP BY
            Status;
        """

        # Execute the query and read the result into a DataFrame
        df_5 = pd.read_sql(sql_query_5, data_engine)

        # Create a list of dictionaries representing the data
        data_list_of_dicts = [
            {
                "status": row['Status'],
                "order_count": row['order_count']
            } for index, row in df_5.iterrows()
        ]

        # Return the data as JSON
        return jsonify(data_list_of_dicts)

    except Exception as e:
        # Handle exceptions, log them, or return an error response
        return jsonify({'error': str(e)})








if __name__ == '__main__':
    app.run(debug=True)

    