# wxGTK Base Image for Docker

![wxWidgets](https://www.wxwidgets.org/assets/img/header-logo.png) 
![Alpine Linux](https://d1q6f0aelx0por.cloudfront.net/product-logos/library-alpine-logo.png)

This is a plain base image built on top of [Alpine
Linux](https://alpinelinux.org/) to host applications written with
[wxWidgets](https://www.wxwidgets.org/) C++ library.

## What is wxGTK?
[wxGTK](https://www.wxwidgets.org/docs/faq/gtk/) is a port of wxWidgets to the
GTK+ toolkit. It is the default port used (if available) on all Linux and Unix
platforms except for Mac OS X.

## Variants

- **alpine-{WXGTK_VERSION}** - runtime image _(~9 MB)_ with wxgtk-base package
  installed
- **alpine-{WXGTK_VERSION}-dev** - development variant contains wxgtk-base just
  like the runtime image, but also some tools needed to build your application:
  make, c++, gcc and wxgtk-dev.

## How to use?

1. Mount you source code in `/build`
2. Use both base images to build your software and runtime image:
   ```dockerfile
   FROM sq7lrx/wxgtkbase:3.0.4-r5-dev AS builder
   COPY * .
   RUN ./configure \
    && make -j$(nproc)
   # or
   RUN c++ main.cpp -o release/application
   
   FROM sq7lrx/wxgtkbase:3.0.4-r5
   WORKDIR /app
   COPY --from builder /build/release/application . # default is /app
   CMD ["./application"]
   ```

## Quick Reference

* This image is buit and maintained by [Adam
  Kolakowski](https://github.com/sq7lrx). For those of you who are radio
  amateurs (HAM operators), it's SQ7LRX.
* [Alpine Linux](https://alpinelinux.org/) is a security-oriented, lightweight
  Linux distribution based on musl libc and busybox.
* [wxWidgets](https://www.wxwidgets.org/) is a C++ library that lets developers
  create applications for Windows, macOS, Linux and other platforms with a
  single code base.

## License

This work is licensed under the terms of **Apache License 2.0**. For details see
[here](./COPYING.txt)