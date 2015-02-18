### Code Swift Playgrounds

1. Install the dependencies: `npm install -g gulp && npm install` (if you don't have `npm`, install `node.js` using `brew install node`. Don't have `brew`? Well...)
2. Add a new or edit the existing markdown files in `/source/`
3. Run `gulp` in the command line to generate the playgrounds
4. Commit and push
5. Profit

### Auto Generation

If you watn the Playgrounds to be generated as soon as you save the source file, run:

~~~shell
gulp watch
~~~
