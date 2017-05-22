const app = require('./../src/mathmodule');

test('adds 1 + 2 to equal 3', () => {
  expect(app.sum(1, 2)).toBe(3);
});