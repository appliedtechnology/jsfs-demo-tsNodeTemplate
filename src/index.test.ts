import 'mocha';
import assert from 'assert';

import { greet } from './index';

describe('ts tests', () => {
  it('get greeting', () => {
    // arrange
    const birthYear = 1972;
    const name = 'Marcus';

    // act
    const result = greet(name, birthYear);

    // assert
    const currentAge = new Date().getFullYear() - birthYear;
    assert.strictEqual(result, `Hello Marcus, you are ${currentAge} years old`);
  });
});
