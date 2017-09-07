'use strict';

var format = require('prettier-eslint')
var path = require('path');

module.exports = function(grunt) {

    grunt.registerMultiTask('prettier_eslint', 'Grunt plugin to Formats your JavaScript using Prettier followed by ESLint --fix', function() {
        var options = this.options();

        this.files.forEach(function(fileDesc) {
            fileDesc.files.forEach(function(file) {
                grunt.file.expandMapping(file, fileDesc.dest).forEach(function(filepath) {
                    options.text = grunt.file.read(filepath.src[0]);

                    var formatted = format(options);
                    var dirname = path.resolve(path.dirname(filepath.dest));

                    if (!grunt.file.isDir(dirname)) {
                        grunt.file.mkdir(dirname);
                    }

                    grunt.file.write(filepath.dest, formatted);
                });
            });
        });

    });

};
