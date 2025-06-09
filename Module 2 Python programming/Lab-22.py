# Lab 22: Implementation of Conditional Statements

# Task 1: Check if temperature is below freezing point
temperature = int(input("Enter temperature in Celsius: "))
if temperature < 0:
    print("The temperature is below freezing point.")

# Task 2: Check whether a number is even or odd
number = int(input("\nEnter a number to check even or odd: "))
if number % 2 == 0:
    print("The number is even.")
else:
    print("The number is odd.")

# Task 3: Grading system based on marks
marks = int(input("\nEnter your marks: "))
if marks >= 90:
    print("Grade: A")
elif marks >= 80:
    print("Grade: B")
elif marks >= 70:
    print("Grade: C")
elif marks >= 60:
    print("Grade: D")
else:
    print("Grade: F")

# Task 4: Check if a number is positive, zero, or negative using nested if
num = int(input("\nEnter a number: "))
if num >= 0:
    if num == 0:
        print("The number is zero.")
    else:
        print("The number is positive.")
else:
    print("The number is negative.")
