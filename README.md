# ColorSort

ColorSort sorts an array of colors perceptually, using the
[CIEDE2000](http://en.wikipedia.org/wiki/Color_difference#CIEDE2000)
color distance function.

*Unsorted* | *Sorted*
---------- | --------
![200 unsorted lines of color](http://ms-digital-labs.github.io/unsorted.png) | ![200 sorted lines of color](http://ms-digital-labs.github.io/sorted.png)

## Installation

Add this line to your application's Gemfile:

    gem 'color_sort'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color_sort

## Usage

Call `ColorSort.sort` with an array of RGB colors in hex form (with or without preceeding #):

```ruby
unsorted_colors = ["35c047", "7f40ed", "39ae1e", "5f9d4c", "94ec1e", "93e482"]

sorted_colors = ColorSort.sort(unsorted_colors)
	# => ["94ec1e", "93e482", "39ae1e", "35c047", "5f9d4c", "7f40ed"]
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/color_sort/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
