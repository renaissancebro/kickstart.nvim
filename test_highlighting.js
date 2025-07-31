// Test JavaScript template literal and bracket highlighting
const name = "World";
const age = 25;

// Template literals should have colored braces
const greeting = `Hello ${name}! You are ${age} years old.`;
const complex = `Result: ${Math.max(...[1, 2, 3])} items`;

// Function calls should have colored parentheses
console.log(greeting.length);
const result = Array.from([1, 2, 3, 4, 5]);

// Different bracket types
const myArray = [1, 2, 3, [4, 5]];
const myObject = {key: "value", nested: [1, 2]};

// Nested brackets should have rainbow colors
const nested = [[1, 2], [3, 4], {a: [1, 2, 3]}];

function testFunction(param1, param2) {
    return `Testing ${param1} with ${param2}`;
}