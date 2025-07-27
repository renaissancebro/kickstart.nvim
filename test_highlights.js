// JavaScript test file for template literals and bracket highlighting
function testHighlights() {
    // Regular strings (normal color)
    const regularString = "This is a regular string";
    const singleQuoted = 'Single quoted string';
    
    // Template literals (should be orange/bold)
    const name = "World";
    const age = 25;
    const templateLiteral1 = `Hello ${name}!`;
    const templateLiteral2 = `Age: ${age} years old`;
    const multiLine = `
        Multi-line template literal
        with ${name} and ${age}
    `;
    
    // Various brackets (should be cyan)
    const myArray = [1, 2, 3, 4, 5];
    const myObject = { key: "value", number: 42 };
    const mySet = new Set([1, 2, 3]);
    
    // Function calls with brackets
    console.log(`Testing template: ${name}`);
    JSON.stringify(myObject);
    
    // Nested structures
    const nested = {
        data: [1, 2, { inner: `value: ${age}` }],
        func: () => `Hello ${name}`
    };
    
    // Complex template expressions
    const result = `Result: ${[1, 2, 3].reduce((a, b) => a + b) * 2}`;
    const formatted = `Name: ${name.toUpperCase()}, Age: ${age + 1}`;
    
    return templateLiteral1;
}