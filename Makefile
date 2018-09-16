.PHONY: all
all: docs/build.js docs/index.html

docs/build.js: towers.js node_modules
	browserify $< -o $@

docs/index.html: README.md
	echo '<!DOCTYPE html>' > $@
	echo '<meta charset="utf-8" />' >> $@
	echo '<meta name="viewport" content="width=device-width">' >> $@
	echo '<title>Tricky Towers</title>' >> $@
	echo '<style type="text/css">body{margin: 2em auto; max-width: 38em; line-height: 1.5; color: #333; padding: 0 1em} h1, h2, h3 {line-height: 1.2}</style>' >> $@
	pandoc $< >> $@
	echo '<script src="./build.js"></script>' >> $@

node_modules: package.json
	npm install
