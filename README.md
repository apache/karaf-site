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

Run Build:

```
mvn clean install
```

## Publish

To publish the local website to the production location (https://karaf.apache.org), you have to use:

```
mvn install scm-publish:publish-scm
```
