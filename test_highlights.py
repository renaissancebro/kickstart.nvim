# Test file for f-string and bracket highlighting
def test_highlights():
    # Regular strings (should use normal string color)
    regular_string = "This is a regular string"
    another_string = 'Single quoted string'
    
    # F-strings (should be orange/bold)
    name = "World"
    age = 25
    fstring1 = f"Hello {name}!"
    fstring2 = f'Age: {age} years old'
    fstring3 = f"""Multi-line f-string with {name} and {age}"""
    
    # Various brackets (should be cyan)
    my_list = [1, 2, 3, 4, 5]
    my_dict = {"key": "value", "number": 42}
    my_tuple = (1, 2, 3)
    
    # Function calls with brackets
    print(f"Testing f-string: {name}")
    len(my_list)
    
    # Nested structures
    nested = {"data": [1, 2, {"inner": f"value: {age}"}]}
    
    # Complex f-string expressions
    result = f"Result: {sum([1, 2, 3]) * 2}"
    formatted = f"Name: {name.upper()}, Age: {age + 1}"
    
    return fstring1, my_dict, nested