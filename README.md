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

Karaf website uses Jekyll to build (generate the HTML resources) and npm/sass to build the CSS assets (Bootstrap 5 based theme).

To install Jekyll, refer to https://jekyllrb.com/docs/

Install the node dependencies and the Ruby modules required by the site:

```
npm install
bundle install
```

Build the site for the first time, then start the local development server on http://localhost:4000 with auto-regeneration (this also recompiles the CSS):

```
npm start
```

To produce a one-shot static build (CSS + HTML) into `_site/`, without serving:

```
npm run build
```

### Lower-level steps

`npm start` and `npm run build` both run the CSS build automatically. If you only need the individual steps:

```
npm run build:css   # compile the Bootstrap 5 theme (_scss/) to assets/css/karaf.css
npm run watch:css   # rebuild CSS continuously while styling
npm run optimize:svg # minify the SVG assets (logos) after editing any images/*.svg
```

`assets/css/karaf.css` is generated and gitignored — it is not committed. Once you have run `npm start`, `npm run build`, or `npm run build:css` at least once, the file exists on disk and you can also run Jekyll directly:

```
bundle exec jekyll serve
```

You can also use Jekyll Docker image to server:

```
docker run --rm --volume="$PWD:/srv/jekyll:Z" --publish 4000:4000 jekyll/jekyll jekyll serve
```

This command builds website and start the local Jekyll server on http://localhost:4000

NB: your local Jekyll installation might need additional modules required by Apache Karaf website. Just run `bundle install` to install these modules.

## Building with Docker

```
docker run --rm --volume="$PWD:/srv/jekyll:Z" -it jekyll/jekyll jekyll build
```

## Deploy

Build the site for production (this also compiles the CSS and optimizes the SVGs, see note above):

```
JEKYLL_ENV=production npm run build
```

You can also use Jekyll Docker image to build (run `npm run build:css` first, since the Docker image cannot resolve the Bootstrap 5 Sass imports):

```
docker run --rm --volume="$PWD:/srv/jekyll:Z" jekyll/jekyll jekyll build
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
