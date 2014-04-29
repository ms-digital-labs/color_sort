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

## How it works

Often when dealing with colors on computers, we're working with the [RGB color model](http://en.wikipedia.org/wiki/Color_model#RGB_color_model). As each color has three components, we can think of it as a point in 3D space. This allows us to use the [Euclidean distance](http://en.wikipedia.org/wiki/Euclidean_distance) to see how far apart two colors are.

Unfortunately, the RGB color space doesn't model how people perceive colors, so a pair of colors that are close together in RGB space may actually look quite different, and vice-versa. We can solve this by using the [Lab color space](http://en.wikipedia.org/wiki/Lab_color_space) and [CIEDE2000 distance function](http://en.wikipedia.org/wiki/Color_difference#CIEDE2000). This color space and distance function are tuned to give a smaller distance for perceputally close colors.

Now we have a way of determining the perceptual distance between two colors, but we can't use this with a normal sorting algorithm because we can't define a [Total order](http://en.wikipedia.org/wiki/Total_order) over all colors. What we really need to do is find the shortest path through our colors in Lab color space, using the CIEDE2000 distance function.

This turns out to be the [Travelling salesman problem](http://en.wikipedia.org/wiki/Travelling_salesman_problem). We first tried the [Nearest neighbour](http://en.wikipedia.org/wiki/Nearest_neighbour_algorithm) heuristic, but found that it left ugly discontinuities in the sorted colors.

Next we tried [Simulated annealing](http://en.wikipedia.org/wiki/Simulated_annealing), but found that it didn't converge on a solution anywhere near quickly enough to be useful.

The solution we settled on was to iteratively build of a list of colors, inserting each one in to the list at the point at which it causes the lowest increase in the total distance between all the colors currently in the list. This allows us to sort a few hundred colors in a couple of seconds, and produces visually pleasing results.

#### Other approaches

Wikipedia lists [several other approaches for solving TSP](http://en.wikipedia.org/wiki/Travelling_salesman_problem#Computing_a_solution) - both exact solutions and approximate solutions. We didn't explore these because we couldn't find libraries that implemented them and didn't have the time to implement them ourselves.

It's almost certain that there's a better approach to solving this particular case of TSP, but we ran out of time/motivation to investigate further. If you know a better approach, please let us know!

## Performance

The algorithm used by this gem has complexity O(n<sup>2</sup>) in the size of the list being sorted. Some example timings on a MacBook Pro:

Number of colors | Time (seconds)
---------------- | --------------
100              | 0.11
200              | 0.37
300              | 0.72
500              | 2.14
1000             | 9.01

## A note on naming

This gem was authored in the UK, where color is usually spelt colour. However, this gem depends on two others ([color](http://color.rubyforge.org/) and [colorscore](https://github.com/quadule/colorscore)) that spell it without the u, so for the sake of consistency it's spelt as color in this gem too.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/color_sort/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
