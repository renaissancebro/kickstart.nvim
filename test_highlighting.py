# Test f-string and bracket highlighting
name = "World"
age = 25

# F-strings should have colored braces
greeting = f"Hello {name}! You are {age} years old."
complex_fstring = f"Result: {sum([1, 2, 3])} items in {{'key': 'value'}}"

# Function calls should have colored parentheses
print(len(greeting))
result = max([1, 2, 3, 4, 5])

# Different bracket types
my_list = [1, 2, 3, (4, 5)]
my_dict = {"key": "value", "nested": [1, 2]}
my_set = {1, 2, 3}

# Nested brackets should have rainbow colors
nested = [[1, 2], [3, 4], {"a": (1, 2, 3)}]

def test_function(param1, param2):
    return f"Testing {param1} with {param2}"