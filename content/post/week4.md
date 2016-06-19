+++
categories = ["gsoc"]
date = "2016-06-16T19:42:46+02:00"
tags = ["gsoc", "browsix", "systemd"]
title = "GSoC - Middle of Week 4"

+++

A LOT has happened during the week 2 and 3. I have even managed to work on the project while waiting for the doctor in a hospital emergency room. Long story short: I've been pretty busy lately, at least yesterday was this year's last lecture for me and now I only have to pass 2 exams and that will be it.

Today Github reports 43 commits, 5,005 additions and 2,839 deletions from my side in the master branch of the [repo](https://github.com/b1101/systemgo). The last comit was done 3 days ago and I am oficially stuck. I am not stuck in the sense that I do not know _what_ to do, I am stuck in the sense that I do not know _how_ to do it __properly__. Currently I think that almost all of the structural decisions I came up with are totally useless and need to be redone.

One of the biggest issues is that I want to make stuff _simple_, but the closer I get to implementing **Systemd** functionality, the more I am forced to do things _**Systemd** way_. Actually, now it seems that there is really no other way of doing it given **Systemd** _monolithicity_.
