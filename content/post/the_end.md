+++
categories = ["gsoc"]
date = "2016-08-20T12:58:27+03:00"
tags = ["gsoc", "browsix", "systemd", "systemgo"]
title = "GSoC - Summing it up"

+++
GSoC came to an end. Wow. At `215 commits / 16,229 ++ / 12,164 --` I think I finally got it right. It was amazing learning experience_(honestly, I did not really know how to code a year ago today)_. <!--more-->
I've had several unexpected issues during the work period - the most severe of them was probably that I worked on average for 10+ hours a day every day including weekends without making breaks and as a consequence to that, sometime near the end of July I came to a point, where I was not able to type anymore. Luckily, it all worked out fine at the end and now(even though it still hurts from time to time) I can work again.

I started writing a blog post on 29 July, which I was not able to finish because of the finger pain:

>For the last 2 weeks I was mostly working on the jobs and transactions part of the init system(kind of everything it is about). To be honest, it did not work out well at all(I did not push to the [jobs-and-transactions](https://github.com/b1101/systemgo/tree/jobs-and-transactions) branch for 11 days now...). Today I finally sat down and took my time to not only read what Systemd [does](https://github.com/systemd/systemd/blob/0fbd465f4138dd2c3c7428c23cae117a7b56568d/src/core/manager.c#L1249-L1302), but also thoroughly understand it(took me well over 3 hours - yea, I'm _slow_, but I'm also not that good with C).
>
>What I was trying to do at first, was recursively adding all the dependencies and then performing a DFS to construct a graph and check for possible errors(cycles etc.) and if there are no such - just concurrently start everything. That was the higher level idea - simple, right? I tried to stick to that until the end and refused to understand why Systemd introduced stuff like an explicit [transaction](https://github.com/systemd/systemd/blob/0fbd465f4138dd2c3c7428c23cae117a7b56568d/src/core/transaction.h#L29-L34), [job](https://github.com/systemd/systemd/blob/0fbd465f4138dd2c3c7428c23cae117a7b56568d/src/core/job.h#L129-L171), etc and a pretty big amount of lists and functions called to perform such a simple task.
>
>Eventually I undertood, that both "job" and "transaction" types are required. So I introduced a `type jobType int`, which is stored as a field on each `job` struct (explicit types seemed to introduce a significant amount of overhead and unnecessary complexity). My idea was to recursively add everything and merge jobs on-the-fly. I even introduced a `func (j *job) mergeWith(other *job) (err error)`, which would change the type of `j` accordingly. If the recursion would fail on one of the required dependencies, it would return an error, errors for optional dependencies would be discarded. And so I'm typing all the stuff down, happy that I finally stopped thinking/writing on paper and started actually coding, everything is going well...unil I realize... How do I 'unmerge' jobs if a recursion fails?
>Stuff Systemd does seemed to be _over-complicated_... Well, I was wrong. I fail to see how the stuff Systemd does can be made in a more efficient manner. Maybe it was me _over-simplifying_ things afterall?

By the way, I ended up implementing an [`add`](https://github.com/rvolosatovs/systemgo/blob/master/system/transaction.go#L51-L143) method on transaction, which was heavily inspired by the systemd [`add_job_and_dependencies`](https://github.com/systemd/systemd/blob/master/src/core/transaction.c#L836-L1044)

# Conclusion

See [this gist](https://gist.github.com/rvolosatovs/ebb776d43b9d7b0bfb1c4aac2ac3bf21) for description of the work done by me during GSoC2016
