---
title: "How to Host Hugo on Vercel"
date: 2024-11-28
lang: en
description: "An updated guide on deploying Hugo with modules (HugoMods) on Vercel — including the Go binary fix."
draft: false
tags: ["hugo", "vercel", "deployment", "go"]
---

I decided to go with [Hugo](https://gohugo.io) to build my personal [website](https://mohessaid.com). The only thing I based my choice on was the build time. I thought Hugo was in the same league as [Astro](https://astro.new) when it comes to content management perks, but it isn't quite there yet.

## What Can Be Added!

Yes, it's possible to extend Hugo's functionality through modules that modify the build process. For example, MDX support in Hugo can be addressed through a module that renders MDX at build time. These integrations have been used to incorporate Tailwind and other frontend libraries.

## Building on Vercel

I used some third-party Hugo tools, specifically [HugoMods](https://hugomods.com). The [icons module](https://icons.hugomods.com) caught my attention because I wanted to add icons to my website without importing an entire font.

Locally, everything worked perfectly. However, after pushing my changes, the Vercel build failed:

```bash
[12:10:50.440] Total in 3 ms
[12:10:50.441] Error: failed to load modules: failed to download modules: binary with name "go" not found in PATH
[12:10:50.446] Error: Command "hugo --gc" exited with 1
```

When Hugo attempted to install the modules needed for the build, it couldn't find the Go binaries. I sought help from Claude and GPT, but had to guide them through each step myself.

## What Worked?

**Step 1:** In the Vercel dashboard → Settings → Environment Variables, add:

```
HUGO_VERSION = <latest version>
```

**Step 2:** In the General tab, select Hugo as the framework preset, then override the build command with:

```bash
curl -L https://go.dev/dl/go1.22.2.linux-amd64.tar.gz -o go1.22.2.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && \
export PATH=$PATH:/usr/local/go/bin && \
go env GOPATH && \
hugo --gc --minify
```

> **Note:** Replace `go1.22.2` with the latest Go version at the time of your deployment.

## Why the Build Command and Not the Install Command?

Placing Go installation steps in the install command field consistently fails — Vercel's build process can't locate the binaries afterward. Placing everything in the build command field is the only reliable approach.

---

I also published this post across multiple platforms to run a small experiment on which one ranks first in search results.
