# grunt-prettier-eslint

![githubbanner](https://user-images.githubusercontent.com/3379410/27423240-3f944bc4-5731-11e7-87bb-3ff603aff8a7.png)

[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)]() [![Chat on gitter](https://img.shields.io/gitter/room/ovh/ux.svg)](https://gitter.im/ovh/ux)

[![NPM](https://nodei.co/npm/grunt-prettier-eslint.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/grunt-prettier-eslint/)

> Grunt plugin to Formats your JavaScript using Prettier followed by ESLint --fix

## Getting Started
This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```sh
npm install grunt-prettier-eslint --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-prettier-eslint');
```

## The "prettier_eslint" task

### Overview
In your project's Gruntfile, add a section named `prettier_eslint` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
    prettier_eslint: {
        options: {
            // Task-specific options go here.
        },
        your_target: {
            // Target-specific file lists and/or options go here.
        }
    }
});
```

### Options

#### options.separator
Type: `String`
Default value: `',  '`

A string value that is used to do something with whatever.

#### options.punctuation
Type: `String`
Default value: `'.'`

A string value that is used to do something else with whatever else.

### Usage Examples

#### Default Options
In this example, the default options are used to do something with whatever. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result would be `Testing, 1 2 3.`

```js
grunt.initConfig({
    prettier_eslint: {
        options: {},
        files: {
            'dest/default_options': ['src/testing', 'src/123'],
        }
    }
});
```

#### Custom Options
In this example, custom options are used to do something else with whatever else. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result in this case would be `Testing: 1 2 3 !!!`

```js
grunt.initConfig({
    prettier_eslint: {
        options: {
            separator: ': ',
            punctuation: ' !!!',
        },
        files: {
            'dest/default_options': ['src/testing', 'src/123'],
        }
    }
});
```

## Related links
* Contribute: https://github.com/ovh-ux/grunt-prettier-eslint/blob/master/CONTRIBUTING.md
* Report bugs: https://github.com/ovh-ux/grunt-prettier-eslint/issues
* Get latest version: https://github.com/ovh-ux/grunt-prettier-eslint

## License
See https://github.com/ovh-ux/grunt-prettier-eslint/blob/master/LICENSE
