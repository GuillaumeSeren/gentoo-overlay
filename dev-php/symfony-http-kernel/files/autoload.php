<?php
/* Autoloader for dev-php/symfony-debug and its dependencies */

if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addPsr4('Symfony\\Component\\HttpKernel\\', __DIR__);

$vendorDir = '/usr/share/php';

// symfony/event-dispatcher: ~2.8|~3.0
// symfony/http-foundation: ~2.8.13|~3.1.6|~3.2
// symfony/debug: ~2.8|~3.0
// psr/log: ~1.0

// Dependencies
\Fedora\Autoloader\Dependencies::required(array(
	$vendorDir . '/Symfony/Component/EventDispatcher/autoload.php',
	$vendorDir . '/Symfony/Component/HttpFoundation/autoload.php',
	$vendorDir . '/Symfony/Component/Debug/autoload.php',
	$vendorDir . '/Psr/Log/autoload.php',
));
