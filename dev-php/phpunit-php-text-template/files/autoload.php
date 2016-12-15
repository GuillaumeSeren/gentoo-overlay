<?php
/* Autoloader for symfony-console and its dependencies */

$vendorDir = '/usr/share/php';
if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

// It has no namespace in the upstream !
// As packagist reference it as phpunit/phpunit/php-text-template
// but the upstream project name it sebastianbergmann/php-text-template
// *and* /usr/share/php/phpunit/ is actually (2016-12-12) used byt the phar
// version of phpunit, so it can be changed later, with the source only version.
\Fedora\Autoloader\Autoload::addPsr4('SebastianBergmann\\TextTemplate\\', __DIR__);
