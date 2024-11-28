+++
title = "How to Host Hugo in Vercel"
date = 2024-11-28T11:44:00+01:00
draft = false
type = "blog"
[params]
    subtitle = "An updated tutorial on how to build Hugo on Vercel. Using the latest version along with Hugo Mods."
    cover = "https://dev-to-uploads.s3.amazonaws.com/uploads/articles/5dw1cg199ya4koefrnjn.png"
+++


I decided to go with [Hugo](https://gohugo.io) to build my personal [website](https://mohessaid.com). The only thing I based my choice on was the build time. I thought Hugo was in the same league as [Astro](https://astro.new) when it comes to content management perks, but it isn't quite there yet. Or, I can say it has its own path since it's older than most of the other static site generators I've encountered. Moreover, it's a Go application, which is another important factor to consider when evaluating technology choices.

## What Can Be Added!

Yes, it's possible to extend Hugo's functionality. You can add missing features through modules that modify the build process. For example, I was missing MDX support in Hugo. I can address this through a module that renders MDX at build time. I haven't tried it myself, but it seems possible.
I can also potentially add a parallel building pipeline—if we can call it that. This might involve using tools like Vite, Turbo, or Webpack. However, this approach would likely complicate the build process and potentially slow down Hugo's main building mechanism. These integrations have been used to incorporate Tailwind and other frontend libraries. Interestingly, if you look at Hugo's upcoming features, you'll see plans for integrating Tailwind and other technologies.

## Building on Vercel

I used some third-party Hugo tools, specifically [HugoMods](https://hugomods.com). The [icons module](https://icons.hugomods.com) caught my attention because I wanted to add icons to my website without importing an entire font. While searching, the Icons module was the first thing that appeared. It offers a variety of icon vendors, including Bootstrap, Font Awesome, Feather icons, and more.
Locally, everything worked perfectly. However, after pushing my changes, nothing seemed to change. Upon checking the build page in Vercel, I noticed...

```Bash
[12:10:48.021] Running build in Washington, D.C., USA (East) – iad1
[12:10:48.210] Cloning github.com/mohessaid/mohessaid (Branch: main, Commit: eaeecd1)
[12:10:48.449] Cloning completed: 238.727ms
[12:10:49.038] Restored build cache from previous deployment (5i5sCdjnY3KZXgGBqbqfgJUjrwYB)
[12:10:49.132] Running "vercel build"
[12:10:49.714] Vercel CLI 39.0.2
[12:10:50.440] Total in 3 ms
[12:10:50.441] Error: failed to load modules: failed to download modules: binary with name "go" not found in PATH
[12:10:50.446] Error: Command "hugo --gc" exited with 1
[12:10:50.625]
```
 

When Hugo attempted to install the modules needed for the build, it couldn't find the Go binaries. I sought help from Claude and GPT, hoping for a quick solution, but they were unable to provide direct assistance. I had to guide them through each step, and eventually, I lost hope in their ability to help me.
I had even used Claude for a solution that was nearly successful, if not for the limitations in the Vercel input fields.

## What Worked?

I navigated to the settings page of my website in the Vercel dashboard. In the "Environment Variables" tab, I added a variable named "HUGO_VERSION" and set its value to the latest available version of Hugo.

![Hugo Version Environment Variable in Vercel.](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/6jubi79id5sqr3ir6otf.png)

In the "General" tab, select Hugo as the framework preset. Then override the build command with the following:


```Bash
curl -L https://go.dev/dl/go1.22.2.linux-amd64.tar.gz -o go1.22.2.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && export PATH=$PATH:/usr/local/go/bin && go env GOTPATH  &&  hugo --gc --minify 
```

![General settings in Vercel dashboard](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/4mtqfvcajt95s03myr2e.png)

> Note: I'm using Go version 1.22.2, which is the latest at the time of writing. You can modify the version to match your specific requirements.

## Why Build Command?

I understand your skepticism. Like you, I thought I had a clever solution. Initially, I attempted to install Go in the Install Command field, but it failed miserably. Vercel's build process couldn't locate the binaries, despite my exhaustive troubleshooting.
After exploring countless potential solutions without success, I stumbled upon a GitHub issue where someone had placed their entire installation process directly in the build field. Replicating their approach, I finally achieved success. At this point, the solution speaks for itself.
Attempting to place these steps in the install command field will likely result in errors.

![Build logs for using install command](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/kp9wsrs6jrt107utc8lq.png)

Or this one

![Build logs for using install command](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/hbf5sbog2gdr14azixa2.png)

Installing Amazon Linux Extras won't solve the Go installation challenge. The version of Go available through this method is significantly outdated. I tested this approach thoroughly and encountered consistent failures. I attempted to use both `yum` and `dnf` package managers in the install command, but neither method successfully resolved the Go binary issue.

---

Finally, I shared this post across different platforms to test which one of them get first in search results. I was willing to do this months ago. However, I couldn't the right post for it. You can follow the experiment from [here](https://dub.sh/ZIRzyDy).
