gulp = require "gulp"
playground = require "playground"
shell = require "gulp-shell"

messages =
  generating: "Building Playgrounds..."

sourceFolder = "./source"
destinationFolder = "./playgrounds"

gulp.task "default", ["generate"]

gulp.task "generate",
  console.log messages.generating
  shell.task "playground #{sourceFolder} -d #{destinationFolder} -p ios", quiet: false
