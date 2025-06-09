# Lab 27: Implementation of Iterative Statements - for loop

# Task 1: Iterate over each character in a string
print("Task 1: Iterate over each character in a string")
for char in "Edunet Foundation":
    print(char)

# Task 2: Using range to iterate from 0 to 4
print("\nTask 2: Using range to iterate from 0 to 4")
for i in range(5):
    print(i)

# Task 3: Nested for loop to print a 2D list
print("\nTask 3: Nested for loop with 2D list")
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
for row in matrix:
    for item in row:
        print(item, end=' ')
    print()

# Task 4: Break the loop when number is 5
print("\nTask 4: Using break to stop when number is 5")
for i in range(10):
    if i == 5:
        break
    print(i)

# Task 5: Continue the loop, skipping even numbers
print("\nTask 5: Using continue to print only odd numbers")
for i in range(10):
    if i % 2 == 0:
        continue
    print(i)

# Task 6: Using else with a for loop
print("\nTask 6: Using else after a for loop")
for i in range(5):
    print(i)
else:
    print("Loop completed successfully.")
