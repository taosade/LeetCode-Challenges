/*

Write a function 'createCounter'. It should accept an initial integer
'init'. It should return an object with three functions:

- 'increment()' increases the current value by '1' and then returns
it.
- 'decrement()' reduces the current value by '1' and then returns it.
- 'reset()' sets the current value to 'init' and then returns it.

*/

type ReturnObj =
{
	increment: () => number,
	decrement: () => number,
	reset: () => number,
}

function createCounter(init: number): ReturnObj
{
	let count = init

	return {
		increment() { return ++count },
		decrement() { return --count },
		reset() { return count = init }
	}
}

/* A comment to test Git commit */