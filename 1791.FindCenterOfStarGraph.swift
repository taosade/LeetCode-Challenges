/*

There is an undirected star graph consisting of 'n' nodes labeled
from '1' to 'n'. A star graph is a graph where there is one center
node and exactly 'n - 1' edges that connect the center node with
every other node.

You are given a 2D integer array 'edges' where each
'edges[i] = [ui, vi]' indicates that there is an edge between the
nodes 'u-i' and 'v-i'. Return the center of the given star graph.

*/

class Solution
{
	func findCenter(_ edges: [[Int]]) -> Int
	{
		guard
			edges.count >= 2,
			edges[0].count >= 2,
			edges[1].count >= 2
		else { return 0 }

		return edges[1].contains(edges[0][0]) ? edges[0][0] : edges[0][1]
	}
}
