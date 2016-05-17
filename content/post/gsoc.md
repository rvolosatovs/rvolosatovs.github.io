+++
categories = ["gsoc"]
date = "2016-05-19T15:23:35+02:00"
tags = ["gsoc", "browsix"]
title = "GSoC 2016 - Introduction"

+++

Hi, my name is Roman, I am a First-year Software Science Bachelor student at [TU/e](https://www.tue.nl/). This summer I am going to work on implementation of [init and IPC systems](https://summerofcode.withgoogle.com/projects/#6227933760847872) for [Browsix](https://github.com/plasma-umass/browsix), which is a project developed in [PLASMA-UMass](http://plasma.cs.umass.edu/). <!--more-->

[Bobby Powers](https://bpowers.net/) is going to be my mentor.

And if all of that was not *'cool'* enough - I'm going to write in [Go](https://golang.org/).

## The project
The init system is intended to make using Browsix in development easier. An additional goal is making it possible to run it on 'real' hardware(I think I'm going to end up using it on my own machine).

Systemd, a somewhat controversial init system is de-facto standard in the Linux world and it is important to keep that in mind. The init system I'm going to develop will provide an interface familiar for a person coming from 'systemd' background and on top of that the service specification is going to be done in Systemd unit-file format.

The init system itself does not seem to be too hard to implement and so I will probably spend a lot of time working on the IPC.

For now I have implemented `xargs` and fixed an [issue](https://github.com/plasma-umass/browsix/pull/30) with `rm -r` flag for Browsix shell, both were done in [Typescript](http://www.typescriptlang.org/).
