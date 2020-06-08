Apache Karaf Website
====================

This project contains the Apache Karaf website.

## Contribute

The concrete repository is on the svn but if you want to contribute, you have to clone the Github repository which is a mirror and provide a pull request with your changes. You can find more informations about how to contribute on the community page of the project (https://karaf.apache.org/community.html).

Clone:

```
git clone https://github.com/apache/karaf-site.git
```

## Build

You need a machine with Maven to build the website.

Checkout:

```
http://svn.apache.org/repos/asf/karaf/site/trunk/ karaf-site
```

## Development

Installation of dev environment, follow official instructions:

https://jekyllrb.com/docs/

## Run

To start Jekyll local server, just run:

```
bundle exec jekyll serve
```

## Deploy

Build the site for production:

```
JEKYLL_ENV=production bundle exec jekyll build
```

Package the war:

```
mvn clean install
```

You can test the war with Jetty embedded and visit http://localhost:8080/ :

```
mvn jetty:run
```

Deploy on scm

```
mvn install scm-publish:publish-scm
```
