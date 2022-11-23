# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Squid proxy server](http://www.squid-cache.org/).

Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages. Squid has extensive access controls and makes a great server accelerator.

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/zarguell/squid) and is the recommended method of installation.

```bash
docker pull zarguell/squid
```

Alternatively you can build the image yourself.

```bash
docker build -t zarguell/squid github.com/zarguell/squid
```
