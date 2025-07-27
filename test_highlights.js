// JavaScript test file for VS Code-style template literal highlighting
function testHighlights() {
    // Regular strings (normal color)
    const regularString = "This is a regular string";
    const singleQuoted = 'Single quoted string';
    
    // Template literals - VS Code style highlighting:
    // - Backticks and content should be normal string color
    // - ${} braces should be yellow/bold
    // - Content inside ${} should use normal syntax colors
    const name = "World";
    const age = 25;
    const templateLiteral1 = `Hello ${name}!`;              // ${}=yellow, name=normal
    const templateLiteral2 = `Age: ${age} years old`;       // ${}=yellow, age=normal
    const multiLine = `
        Multi-line template literal
        with ${name} and ${age}
    `;
    
    // Various brackets (should be cyan)
    const myArray = [1, 2, 3, 4, 5];                        // []=cyan
    const myObject = { key: "value", number: 42 };          // {}=cyan (not template)
    const mySet = new Set([1, 2, 3]);                       // ()=cyan, []=cyan
    
    // Function calls with brackets
    console.log(`Testing template: ${name}`);               // log=blue, ${}=yellow
    JSON.stringify(myObject);                               // stringify=blue, ()=cyan
    
    // Complex template expressions
    const result = `Result: ${[1, 2, 3].reduce((a, b) => a + b) * 2}`;  // methods inside ${}
    const formatted = `Name: ${name.toUpperCase()}, Age: ${age + 1}`;    // method calls inside ${}
    
    return templateLiteral1;
}