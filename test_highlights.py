# Test file for VS Code-style f-string highlighting
def test_highlights():
    # Regular strings (normal string color)
    regular_string = "This is a regular string"
    another_string = 'Single quoted string'
    
    # F-strings - VS Code style highlighting:
    # - 'f' prefix should be purple (like keywords)
    # - String content should be normal string color  
    # - {} braces should be yellow/bold
    # - Content inside {} should use normal syntax colors
    name = "World"
    age = 25
    fstring1 = f"Hello {name}!"              # f=purple, {}=yellow, name=normal
    fstring2 = f'Age: {age} years old'       # f=purple, {}=yellow, age=normal
    fstring3 = f"""Multi-line f-string with {name} and {age}"""
    
    # Various brackets (should be cyan)
    my_list = [1, 2, 3, 4, 5]               # []=cyan
    my_tuple = (1, 2, 3)                    # ()=cyan
    my_dict = {"key": "value", "number": 42} # {}=cyan (not f-string)
    
    # Function calls with brackets
    print(f"Testing f-string: {name}")      # print=blue, f=purple, {}=yellow
    len(my_list)                            # len=blue, []=cyan
    
    # Complex f-string expressions
    result = f"Result: {sum([1, 2, 3]) * 2}"        # sum=blue inside {}
    formatted = f"Name: {name.upper()}, Age: {age + 1}"  # method calls inside {}
    
    return fstring1, my_dict