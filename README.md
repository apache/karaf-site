Apache Karaf Website
====================

This project contains the Apache Karaf website.

## Contribute

The concrete repository is on the svn but if you want to contribute, you have to clone the Github repository which is a mirror and provide a pull request with your changes. You can find more informations about how to contribute on the community page of the project (https://karaf.apache.org/community.html).

Clone:

```
git clone https://github.com/apache/karaf-site.git
```

## Building

Karaf website uses jekyll to build (generate the HTML resources).

To install Jekyll, refer to https://jekyllrb.com/docs/

Once Jekyll is installed, you can build website using:

```
bundle exec jekyll serve
```

This command builds website and start the local Jekyll server on http://localhost:4000

NB: your local Jekyll installation might need additional modules required by Apache Karaf website. Just run `bundle install` to install these modules.

## Deploy

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
