/*

Given an 'n x n' binary matrix image, flip the image horizontally,
then invert it, and return the resulting image.

*/

function flipAndInvertImage(image: number[][]): number[][]
{
	return image.map(row => row.map(num => num ? 0 : 1).reverse())
}
