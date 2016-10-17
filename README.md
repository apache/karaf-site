Apache Karaf Website
====================

This project contains the Apache Karaf website.

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

To publish the local website to the production location (http://karaf.apache.org), you have to use:

```
mvn install scm-publish:publish-scm
```
