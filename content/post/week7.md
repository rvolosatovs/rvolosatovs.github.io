+++
categories = ["gsoc"]
date = "2016-07-11T20:02:37+02:00"
tags = ["gsoc", "browsix", "go", "testify", "gomock"]
title = "GSoC - Week 7"

+++

Time is running fast. It's been 50 days since I started working on [Systemgo](https://github.com/b1101/systemgo) (_unbeliveable_). I have learned __a hell of a lot__ and, well, became a _gopher_ in the meantime. 

I read code instead of news articles and watch videos about code instead of movies. Coding just feels..._natural_ at this point, and the more so, the more excited I become about it.

Currently I'm in process of coming up with tests. Tests should only test the package they belong to and _preferably_ not rely on other packages. As an example, I there are these 2 closely related packages - `unit` and `system`, where the former is used to deal with transforming an instance of `io.Reader` into appropriate definition(Go does not have inheritance, but definitions of each unit type can differ, I worked around it using `reflect` package, somewhat in the `json.Unamrshal` fashion, check it out [here](https://github.com/b1101/systemgo/blob/master/unit/definition.go#L71-L128)).
`System` package parses unit files and determines, instance of which type from the `unit` package to create according to the filename and later saves that as an instance of embedded `unit.Interface` on a newly created `system.Unit`. 
The load part of this is hard to test without using the unit package, as the type the definition is assigned to is hard-coded(I used a hashmap _suffix_->_constructor_ initially, but I got rid of constructors for the sake of simplicity).
For everything else - [Gomock](https://github.com/golang/mock).

Initially I created a testing library, where I basically just defined the message formatting, but yesterday I discovered [Testify](https://github.com/stretchr/testify), which I used for the assertions. I actually found out about it some time ago, but was hesitant to try and boy was I wrong: tests became so much more readable and concise - take a [look](https://github.com/b1101/systemgo/commit/9eca0206b10948cf427d852e090a0366ca652b5b). It turned out to be super easy to use and super effective.

By the way, I have done some cool things since my last blog post:
- Wrote my first ever [Makefile](https://github.com/b1101/systemgo/blob/master/Makefile)
- Setup Travis-CI
- Setup Coveralls
- Put a badge for anything I could possibly put one for(_yay_)
