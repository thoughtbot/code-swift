gulp = require "gulp"
playground = require "playground"
shell = require "gulp-shell"
cache = require "gulp-cached"
debug = require "gulp-debug"

sourceFolder = "./source"
destinationFolder = "./playgrounds"

gulp.task "default", ["generate-all"]

gulp.task "generate-all",
  shell.task "playground #{sourceFolder} -d #{destinationFolder} -p ios", quiet: false

gulp.task "watch", ->
  gulp.watch "#{sourceFolder}/**/*.md", ["generate"]

gulp.task "generate", ->
  gulp.src("#{sourceFolder}/*.md")
    .pipe cache("playgrouds")
    .pipe debug
      title: "Generated"
    .pipe shell ["playground <%= file.path %> -d #{destinationFolder} -p ios"], quiet: false
