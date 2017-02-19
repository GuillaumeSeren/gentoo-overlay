<?php
/* Autoloader for php-coveralls and its dependencies */

$vendorDir = '/usr/share/php';
if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addPsr4('Satooshi\\', __DIR__);

// Dependencies
\Fedora\Autoloader\Dependencies::required(array(
	$vendorDir . '/Guzzle/autoload.php',
	$vendorDir . '/Psr/Log/autoload.php',
	$vendorDir . '/Symfony/Component/Config/autoload.php',
	$vendorDir . '/Symfony/Component/Console/autoload.php',
	$vendorDir . '/Symfony/Component/Stopwatch/autoload.php',
	$vendorDir . '/Symfony/Component/Yaml/autoload.php',
));
