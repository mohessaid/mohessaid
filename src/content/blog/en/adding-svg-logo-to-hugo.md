---
title: "Adding SVG Logo to Hugo"
date: 2024-10-30
lang: en
description: "How I added my SVG logo to the Hugo site header — a simple fix that wasn't obvious at first."
draft: false
tags: ["hugo", "svg", "tips"]
---

I tried to add my SVG logo to the header of this website. I found some solutions, but they didn't work for me.

I went through the Hugo documentation and found this solution:

```html
{{ readFile "assets/mohessaid_light.svg" | safeHTML }}
```

Which is the same as the solutions available on the first page of Google. However, I didn't know that the `static` folder or path they mention is just something to indicate that we are looking for the image in a folder called `static`. So I changed it to `assets` since my logo resides there.
