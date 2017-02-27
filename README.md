# PHP-Lint

PHP-Lint is simplified linter solution for php, based on [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer),


Currently it's support only as HG hook, GIT hook will come soon.

Current rule set is in progress. It consist of [PSR1](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-1-basic-coding-standard.md), [PSR2](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2-coding-style-guide.md),
 PEAR, [PHPCompatibility](https://github.com/wimg/PHPCompatibility), [Yii2 Coding Standard](https://github.com/yiisoft/yii2-coding-standards), some of Squiz and Generic rules.

## Installation

Installation is realized by [Composer](https://getcomposer.org).

In the console write:

```
composer require --dev grnrbt/php-lint "*"
```

or add following line in `require-dev` section of `composer.json` file.

```
"grnrbt/php-lint": "*"
```

## Usage

**HG hook**  
Checks only staged files in repository so it can be added in present repositories without problems with old files.

Add following code into `.hg/hgrc` file or HG-client settings:
```
[hooks]
pretxncommit.hglint = vendor\bin\lint
```
or in Windows:
```
[hooks]
pretxncommit.hglint = vendor\bin\lint.bat
```

To skip checking run commit from console with ENV param `NO_VERIFY=1`:
```
NO_VERIFY=1 hg ci -u <user> -m <message> 
```

**Manual run**  
You can run linter with ruleset manually from console
```
$ ./vendor/bin/lint
```
It will check staged files or run CodeSniffer itself
```
$ ./vendor/bin/phpcs --extensions=php --standard=/vendor/grnrbt/php-lint/ruleset.xml <dir>
```
For checking choosen directory `<dir>`

**PHPStorm**  
If you're using PhpStorm you can configure it to use CodeSniffer using Settings → Languages & Frameworks → PHP → Code Sniffer.

## Custom rules
You can override standard rules by placing file `ruleset.xml` in root directory of your project. In that file you can 
include original file and add your own rules or disable rules, that was added in common ruleset.
 
```
<?xml version="1.0"?>
<ruleset name="Custom Standard">
    <description>A custom coding standard</description>

    <exclude-pattern>*/tests/*</exclude-pattern>
    
    <rule ref="/vendor/grnrbt/php-lint/ruleset.xml"/>
    
    <!-- custom rules, overrides -->
</ruleset>
```

## Links

* [Annotated ruleset.xml](https://pear.php.net/manual/en/package.php.php-codesniffer.annotated-ruleset.php)

