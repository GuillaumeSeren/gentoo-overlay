gentoo-overlay
==============

My Gentoo overlay mostly bump/live-ebuilds, but I try also to have stable ebuilds,
for things that are in Gentoo or not upgraded in Gentoo.

## DISCLAIMER
This overlay is *not official*, and *not tested outside of my setup*,
so take some time to read ebuild before installing things.

_! USE IT AT YOUR OWN RISK !_

## INSTALL
You can install this overlay using the new [Portage/Sync system](https://wiki.gentoo.org/wiki/Project:Portage/Sync).
Add the overlay in '/etc/portage/repos.conf/guillaumeseren.conf':
```
[GuillaumeSeren]
location = /usr/local/portage/guillaumeseren
sync-type = git
sync-uri = https://github.com/GuillaumeSeren/gentoo-overlay.git
masters = gentoo
priority = 50
auto-sync = yes
```

Then you can sync the overlay with 'emerge --sync' *or* 'emaint sync --auto'.
To pull the overlay directly just:
```
emaint sync --repo  GuillaumeSeren
```

You should mask all ebuild by default in my overlay and just unmask,
the specific one you want
```
echo '*/*::GuillaumeSeren' >> /etc/portage/package.mask/guillaumeseren-repo
```

You also need to accept the package, you can do it per package, or for all of
them like
```
echo '*/*::GuillaumeSeren' > /etc/portage/package.accept_keywords/guillaumeseren-repo'
```

Then search the ebuild like:
```
emerge --search git-extras
```

As we masked the whole overlay, the package you want should be masked,
you might need to search it more precisely, like:
```
$ emerge --search git-extras
[ Results for search key : git-extras ]
Searching...

*  dev-vcs/git-extras [ Masked ]
      Latest version available: 9999
      Latest version installed: 9999
      Size of files: 0 KiB
      Homepage:      https://github.com/tj/git-extras
      Description:   GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
      License:       MIT

[ Applications found : 1 ]

```

To install this version you will need to *unmask*, the version from my overlay (::GuillaumeSeren).
```
$ echo '=dev-vcs/git-extras-9999::GuillaumeSeren' >>  /etc/portage/package.unmask/git-extras
```

Now you can install it
```
$ emerge -av dev-vcs/git-extras
These are the packages that would be merged, in order:

Calculating dependencies... done!
[ebuild   R   #] dev-vcs/git-extras-9999::GuillaumeSeren  USE="-savedconfig" 0 KiB

Total: 1 package (1 reinstall), Size of downloads: 0 KiB

Would you like to merge these packages? [Yes/No]
```

## CONTENT
Here the links for stuff that are packaged here.

Software                                | DESCRIPTION
----------------------------------------|------------
[cockatrice][cockatrice]                | A cross-platform virtual tabletop for multiplayer card games
[alot][alot]                            | A commandline MUA using notmuch and urwid
[git-extras][git-extras]                | GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
[composer][composer]                    | Dependency Manager for PHP
[phpunit][phpunit]                      | The PHP Unit Testing framework
[bedup][bedup]                          | Btrfs deduplication
[mixxx][mixxx]                          | Mixxx is Free DJ software that gives you everything you need to perform live mixes
[winetricks][winetricks]                | Winetricks is an easy way to work around problems in Wine
[nodejs][nodejs]                        | Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine
[wine][wine]                            | Free implementation of Windows(tm) on Unix.
[fedora-autoloader][fedora-autoloader]  | Static PSR-4, PSR-0, and classmap autoloader.
[json-schema][json-schema]              | PHP implementation of JSON schema
[ca-bundle][ca-bundle]                  | Lets you find a path to the system CA bundle, and includes a fallback to the Mozilla CA bundle
[semver][semver]                        | Semantic versioning utilities with the addition of version constraints parsing and checking
[spdx-licenses][spdx-licenses]          | Tools for working with the SPDX license list and validating licenses
[jsonlint][jsonlint]                    | JSON Lint for PHP
[symfony-finder][symfony-finder]        | Symfony Finder Component
[symfony-filesystem][symfony-filesystem] | Symfony Filesystem Component
[phar-utils][phar-utils]                | PHAR file format utilities, for when PHP phars you up
[cli-prompt][cli-prompt]                | Allows you to prompt for user input on the command line, and optionally hide the characters they type
[recursion-context][recursion-context]  | Provides functionality to recursively process PHP variables
[exporter][exporter]                    | Provides the functionality to export PHP variables for visualization
[colors.php][colors.php]                | An easy way to add colors in your CLI scripts
[pimple][pimple]                        | A small PHP 5.3 dependency injection container
[diff][diff]                            | Diff implementation
[comparator][comparator]                | Provides the functionality to compare PHP values for equality
[environment][environment]              | Provides functionality to handle HHVM/PHP environments
[global-state][global-state]            | Snapshotting of global state, factored out of PHPUnit into a stand-alone component
[resource-operation][resource-operation]  | Provides a list of PHP built-in functions that operate on resources
[verion][version]                       | Library that helps with managing the version number of Git-hosted PHP projects
[doctrine-collection][doctrine-collection]  | Collections Abstraction Library
[myclabs-deep-copy][myclabs-deep-copy]  | Create deep copies (clones) of your objects
[notmuch][notmuch]                      | Index local mail for fast, tag-based, search
[zetacomponents-UnitTest][zetacomponents-UnitTest] | zetacomponents-unit-test Component
[zetacomponents-base][zetacomponents-base] | The Base package provides the basic infrastructure that all packages rely on
[zetacomponents-ConsoleTools][zetacomponents-ConsoleTools] | A set of classes to do different actions with the console
[theseer-DirectoryScanner][theseer-DirectoryScanner]  | PHP File Scanner
[theseer-Autoload][theseer-Autoload]  | A lightweight php namespace aware autoload generator and phar archive builder
[php-timer][php-timer]	| Utility class for timing
[php-file-iterator][php-file-iterator] | FilterIterator implementation that filters files based on a list of suffixes, prefixes, and other exclusion criteria
[php-token-stream][php-token-stream] | Wrapper around PHP's tokenizer extension
[code-unit-reverse-lookup][code-unit-reverse-lookup] | Looks up which function or method a line of code belongs to
[php-code-coverage][php-code-coverage]  | Library that provides collection, processing, and rendering functionality for PHP code coverage information
[php-codesniffer][php-codesniffer]  |  Detects violations of a defined set of coding standards
[guzzle][guzzle]                    | Guzzle, an extensible PHP HTTP client
[symfony-stopwatch][symfony-stopwatch] | Symfony Stopwatch Component
[symfony-polyfill-mbstring][symfony-polyfill-mbstring] | Partial, native PHP implementation for the Mbstring extension
[docker-machine][docker-machine] | Machine management for a container-centric world
[symfony-debug][symfony-debug] | Symfony Debug Component
[symfony-polyfill-apcu][symfony-polyfill-apcu] | Symfony polyfill backporting apcu functions
[symfony-http-foundation][symfony-http-foundation] | Symfony HttpFoundation Component
[symfony-kernel][symfony-kernel] | Subtree split of the Symfony HttpKernel Component
[psr-cache][psr-cache] | This repository holds all interfaces defined by PSR-6
[symfony-cache][symfony-cache] | Symfony Cache Component
[symfony-event-dispatcher][symfony-event-dispatcher] | Symfony EventDispatcher Component
[doctrine-instanciator][doctrine-instanciator] | Avoiding usage of constructors when instantiating PHP classes
[phpunit-mock-objects][phpunit-mock-objects] | Mock Object library for PHPUnit






## PARTICIPATE
If find any bugs or problem related to those ebuild I suggest that you fill a __Issue__.
If you fix something and want to share back you can open a __Pull Request__.

[cockatrice]: https://github.com/Cockatrice/Cockatrice
[alot]: https://github.com/pazz/alot
[git-extras]: https://github.com/tj/git-extras
[composer]: https://getcomposer.org
[phpunit]: https://github.com/sebastianbergmann/phpunit
[bedup]: https://github.com/g2p/bedup
[mixxx]: http://mixxx.org
[winetricks]: https://github.com/Winetricks/winetricks
[nodejs]: https://nodejs.org
[wine]: https://www.winehq.org/
[fedora-autoloader]: https://github.com/php-fedora/autoloader
[json-schema]: https://github.com/justinrainbow/json-schema
[ca-bundle]: https://github.com/composer/ca-bundle
[semver]: https://github.com/composer/semver
[spdx-licenses]: https://github.com/composer/spdx-licenses
[jsonlint]: https://github.com/Seldaek/jsonlint
[symfony-finder]: https://github.com/symfony/finder
[symfony-filesystem]: https://github.com/symfony/filesystem
[phar-utils]: https://github.com/Seldaek/phar-utils
[cli-prompt]: https://github.com/Seldaek/cli-prompt
[recursion-context]: https://github.com/sebastianbergmann/recursion-context
[exporter]: https://github.com/sebastianbergmann/exporter
[colors.php]: https://github.com/kevinlebrun/colors.php
[pimple]: https://github.com/silexphp/Pimple
[diff]: https://github.com/sebastianbergmann/diff
[comparator]: https://github.com/sebastianbergmann/comparator
[environment]: https://github.com/sebastianbergmann/environment
[global-state]: https://github.com/sebastianbergmann/global-state
[resource-operation]: https://github.com/sebastianbergmann/resource-operations
[version]: https://github.com/sebastianbergmann/version
[doctrine-collection]: https://github.com/doctrine/collections
[myclabs-deep-copy]: https://github.com/myclabs/DeepCopy
[notmuch]: https://notmuchmail.org/
[zetacomponents-UnitTest]: https://github.com/zetacomponents/UnitTest
[zetacomponents-base]: https://github.com/zetacomponents/Base
[zetacomponents-ConsoleTools]: https://github.com/zetacomponents/ConsoleTools
[theseer-DirectoryScanner]: https://github.com/theseer/DirectoryScanner
[theseer-Autoload]: https://github.com/theseer/Autoload
[php-timer]: https://github.com/sebastianbergmann/php-timer
[php-file-iterator]: https://github.com/sebastianbergmann/php-file-iterator
[php-token-stream]: https://github.com/sebastianbergmann/php-token-stream
[code-unit-reverse-lookup]: https://github.com/sebastianbergmann/code-unit-reverse-lookup
[php-code-coverage]: https://github.com/sebastianbergmann/php-code-coverage
[php-codesniffer]: https://github.com/squizlabs/PHP_CodeSniffer
[guzzle]: https://github.com/guzzle/guzzle3
[symfony-stopwatch]: https://github.com/symfony/stopwatch
[symfony-polyfill-mbstring]: https://github.com/symfony/polyfill-mbstring
[docker-machine]: https://github.com/docker/machine
[symfony-debug]: https://github.com/symfony/debug
[symfony-polyfill-apcu]: https://packagist.org/packages/symfony/polyfill-apcu
[symfony-http-foundation]: https://github.com/symfony/http-foundation
[symfony-kernel]: https://github.com/symfony/http-kernel
[psr-cache]: https://github.com/php-fig/cache
[symfony-cache]: https://github.com/symfony/cache
[symfony-event-dispatcher]: https://github.com/symfony/event-dispatcher
[doctrine-instanciator]: https://github.com/doctrine/instantiator
[phpunit-mock-objects]: https://github.com/sebastianbergmann/phpunit-mock-objects
