<?php
/* Autoloader for symfony-console and its dependencies */

$vendorDir = '/usr/share/php';
if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addPsr4('Athletic\\', __DIR__);

# Will need more deps to load
#    "require": {
#     "php": ">=5.3.9",
#     "zeptech/annotations": "1.1.*",
#     "nategood/commando": "0.2.1",
#     "pimple/pimple": ">=1.0,<3.0"
#   },
#   "require-dev": {
#     "phpunit/phpunit": "~4.0",
#     "mikey179/vfsStream": "1.2.*",
#     "mockery/mockery": "0.8.*",
#     "satooshi/php-coveralls": "0.6.*"
# },
