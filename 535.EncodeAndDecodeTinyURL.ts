/*

TinyURL is a URL shortening service where you enter a URL such as
'https://leetcode.com/problems/design-tinyurl' and it returns a short
URL such as 'http://tinyurl.com/4e9iAk'. Design a class to encode a
URL and decode a tiny URL.

There is no restriction on how your encode/decode algorithm should
work. You just need to ensure that a URL can be encoded to a tiny URL
and the tiny URL can be decoded to the original URL.

*/

class TinyUrl
{
	private db = new Map<number, string>
	private prefix = 'tinyurl/'

	encode(longUrl: string): string
	{
		for (const [id, url] of this.db.entries())
			if (url === longUrl)
				return this.prefix + id.toString()

		this.db.set(this.db.size + 1, longUrl)

		return this.prefix + this.db.size.toString()
	}

	decode(shortUrl: string): string
	{
		const id = shortUrl.slice(this.prefix.length)

		if (!shortUrl.startsWith(this.prefix) || !/^[1-9]\d*$/.test(id))
			return 'Invalid URL'

		return this.db.get(parseInt(id, 10)) ?? 'URL Not Found'
	}
}