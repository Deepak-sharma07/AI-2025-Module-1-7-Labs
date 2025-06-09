import mysql.connector
from mysql.connector import Error

# Function to create a connection to the MySQL database
def create_connection():
    """Create a connection to the MySQL database."""
    try:
        connection = mysql.connector.connect(
            host='localhost',  # MySQL server host
            user='root',       # MySQL username
            password='root',  # Replace with your MySQL password
            database='college_db'  # Database name
        )
        if connection.is_connected():
            print("Connected to MySQL server successfully.")
        return connection
    except Error as e:
        print(f"Error: {e}")
        return None

# Function to fetch and display data from the students table
def fetch_student_data(connection):
    """Fetch and display student data from the students table."""
    try:
        cursor = connection.cursor()
        select_query = "SELECT * FROM students"  # SQL query to fetch student records
        cursor.execute(select_query)
        records = cursor.fetchall()

        # Display the fetched records
        print("Fetched student records:")
        print(f"{'ID':<5} {'Name':<20} {'Age':<5} {'Course':<20}")
        print("-" * 50)
        for row in records:
            print(f"{row[0]:<5} {row[1]:<20} {row[2]:<5} {row[3]:<20}")
    except Error as e:
        print(f"Error: {e}")

# Main function to execute the process
def main():
    """Main function to connect to MySQL and fetch student records."""
    connection = create_connection()
    if connection:
        fetch_student_data(connection)
        connection.close()
        print("MySQL connection closed.")

# Run the script
if __name__ == "__main__":
    main()