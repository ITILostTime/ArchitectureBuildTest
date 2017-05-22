const app = require('./../src/mathmodule');
//BLA
test('substract 3 - 2 to equal 1', () => {
  expect(app.sub(3, 2)).toBe(1);
});