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

The `Content-Security-Policy` enforced on `*.apache.org` only allows script/style/font requests from `'self'` and a short list of apache.org domains, so any asset loaded from a third-party CDN (jsdelivr, Google Fonts, etc.) is silently blocked by the browser. Bootstrap's JS and Font Awesome must stay self-hosted: Font Awesome is bundled into `assets/css/karaf.css` via `_scss/karaf.scss` (with its webfonts copied by `npm run build:icons`), and Bootstrap's JS bundle is committed at `assets/js/vendor/bootstrap.bundle.min.js` — refresh it from `node_modules/bootstrap/dist/js/bootstrap.bundle.min.js` whenever the `bootstrap` npm version is bumped.

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
npm run build:icons # copy the Font Awesome webfonts to assets/webfonts
npm run optimize:svg # minify the SVG assets (logos) after editing any images/*.svg
```

`assets/css/karaf.css` and `assets/webfonts/` are generated and gitignored — they are not committed. Once you have run `npm start`, `npm run build`, or `npm run build:css`/`npm run build:icons` at least once, they exist on disk and you can also run Jekyll directly:

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

You can also use Jekyll Docker image to build (run `npm run build:css` and `npm run build:icons` first, since the Docker image cannot resolve the Bootstrap 5 Sass imports or copy the Font Awesome webfonts):

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
