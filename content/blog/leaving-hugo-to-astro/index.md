+++
title = "Leaving Hugo to Astro"
date = 2025-03-30T18:00:00+01:00
draft = false
type = "blog"
+++

Since I bought this domain, I've tested countless SSGs (Static Site Generators). I used Jekyll, Gatsby, Nexo, Next.js, and others. I never finished any of those versions—I switched between them because I have new ideas all the time. New ideas come with checking the right tools to release them, but as always, the will to do the actual work fades away in the searching phase. So, I never finished any of them nor used the acquired skills professionally; in fact, I dropped them the moment my will to continue vanished.

# Hugo
I think I was one of the first users of this SSG. I tried it both for my website and for other websites. It was my first interaction with Go, and I was surprised to learn it was created in 2012. However, I never published those websites.
This version is built with Hugo. I chose it for its build time and the hope of using or interacting with Go while working on it. I never did.

# Limitations
Even though the build time is fast, Hugo falls behind in the front-end race. You can't integrate new front-end frameworks without using Node or its peers, which is stupid if you ask me. Why would I choose Hugo if the build time isn't handled through Go?

# Using Bulma
I tried using Bulma to style my current website. I fought so hard to get it to work. The problem was mainly in the process of using it through SASS or SCSS files without the need for custom modules.
When I try something new, I follow the rules set by it. However, if the rules are too limiting and block the way to final results, I drop those tools immediately.
In Hugo, you can change the generator behavior through configuration files—where it looks for styling files or assets, where to output them, and so on. So, I could and did integrate Bulma using its compiled and minified CSS file; however, it wasn't satisfying at all.
Later on, I made it work through Dart Sass. I will talk about this matter in another article.

# Moving to Astro
I'm using Astro in other projects. I'm not good with it yet, but it seems like a great tool for what I'm planning to do. I don't care about the build time anymore. Maybe I'll use it with the most performant JavaScript/TypeScript runtime to get the best results. But I will never trade flexibility for performance again—especially in this part of my world.