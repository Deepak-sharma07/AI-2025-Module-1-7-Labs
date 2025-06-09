# Lab 37: Creating Functions and Performing Arithmetic Operations

# Function for addition
def add(a, b):
    return a + b

# Function for subtraction
def subtract(a, b):
    return a - b

# Function for multiplication
def multiply(a, b):
    return a * b

# Function for division with error handling
def divide(a, b):
    if b == 0:
        return "Error: Division by zero"
    return a / b

# Main block to test the functions
if __name__ == "__main__":
    num1 = 10
    num2 = 5

    print("Addition:", add(num1, num2))
    print("Subtraction:", subtract(num1, num2))
    print("Multiplication:", multiply(num1, num2))
    print("Division:", divide(num1, num2))
