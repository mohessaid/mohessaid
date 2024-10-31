+++
title = "Adding SVG Logo to Hugo!"
date = 2024-10-30T10:43:00+01:00
type = "journal"
+++

I tried to add my SVG logo to the header of this website. I found some solutions, but they didn't work for me.

<!--more-->

I went through the documentation of Hugo and find this solution:

```html
{{ readFile "assets/mohessaid_light.svg" | safeHTML }}
```

Which is the same as the the solutions available in the first page of Google. However, I didn't know that the `static` folder or path they answer is just something to indicate that we are looking for the image in a folder called `static`. So I changed to `assets` since my logo resides there.
