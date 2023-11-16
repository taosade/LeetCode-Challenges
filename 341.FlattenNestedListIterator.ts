/*

You are given a nested list of integers 'nestedList'. Each element is
either an integer or a list whose elements may also be integers or
other lists. Implement an iterator to flatten it.

Implement the 'NestedIterator' class:

'NestedIterator(List<NestedInteger> nestedList)' - Initializes the
iterator with the nested list 'nestedList'.
'int next()' - Returns the next integer in the nested list.
'boolean hasNext()' - Returns 'true' if there are still some integers
in the nested list and false otherwise.

*/

class NestedInteger
{
	private value: number | NestedInteger[]

	constructor(value?: number)
	{
		this.value = Number.isInteger(value) ? value as number : []
	}

	isInteger(): boolean { return Number.isInteger(this.value) }

	getInteger(): number | null
	{
		return Number.isInteger(this.value) ? this.value as number : null
	}

	setInteger(value: number)
	{
		if (Number.isInteger(value)) this.value = value
	}

	add(elem: NestedInteger)
	{
		if (typeof this.value === 'number')
		{
			this.value = [elem]; return
		}

		this.value.push(elem)
	}

	getList(): NestedInteger[]
	{
		return typeof this.value === 'number' ? [] : this.value
	}
}

class NestedIterator
{
	private values: number[] = []

	private flattenNestedInteger(nestedInteger: NestedInteger): number[]
	{
		const possibleInteger = nestedInteger.getInteger()

		if (Number.isInteger(possibleInteger))
			return [possibleInteger!]

		const res: number[] = []

		for (const elem of nestedInteger.getList())
			res.push(...this.flattenNestedInteger(elem))

		return res
	}

	constructor(nestedList: NestedInteger[])
	{
		for (const elem of nestedList)
			this.values.push(...this.flattenNestedInteger(elem))
	}

	hasNext(): boolean { return this.values.length > 0 }

	next(): number { return this.values.shift() ?? NaN }
}