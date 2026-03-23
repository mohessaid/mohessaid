---
title: "Leaving Hugo for Astro"
date: 2025-03-30
lang: en
description: "Why I moved away from Hugo and chose Astro for my personal site"
draft: false
tags: ["astro", "hugo", "ssg", "web"]
---

Since I bought this domain, I've tested countless SSGs (Static Site Generators). I used Jekyll, Gatsby, Nexo, Next.js, and others. I never finished any of those versions — I switched between them because I have new ideas all the time.

## Hugo

I think I was one of the first users of this SSG. I tried it both for my website and for other websites. It was my first interaction with Go, and I was surprised to learn it was created in 2012. However, I never published those websites. This version is built with Hugo. I chose it for its build time and the hope of using or interacting with Go while working on it. I never did.

## Limitations

Even though the build time is fast, Hugo falls behind in the front-end race. You can't integrate new front-end frameworks without using Node or its peers, which is stupid if you ask me. Why would I choose Hugo if the build time isn't handled through Go?

## Using Bulma

I tried using Bulma to style my current website. I fought so hard to get it to work. The problem was mainly in the process of using it through SASS or SCSS files without the need for custom modules.

In Hugo, you can change the generator behavior through configuration files — where it looks for styling files or assets, where to output them, and so on. So, I could and did integrate Bulma using its compiled and minified CSS file; however, it wasn't satisfying at all. Later on, I made it work through Dart Sass.

## Moving to Astro

I'm using Astro in other projects. I'm not good with it yet, but it seems like a great tool for what I'm planning to do. I don't care about the build time anymore. Maybe I'll use it with the most performant JavaScript/TypeScript runtime to get the best results. But I will never trade flexibility for performance again — especially in this part of my world.

New ideas come with checking the right tools to release them, but as always, the will to do the actual work fades away in the searching phase. I dropped tools the moment my will to continue vanished. This time, I'm shipping.
