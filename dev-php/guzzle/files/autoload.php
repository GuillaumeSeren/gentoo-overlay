<?php
/* Autoloader for guzzle and its dependencies */

$vendorDir = '/usr/share/php';
if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addPsr4('Guzzle\\', __DIR__);

// Dependencies
\Fedora\Autoloader\Dependencies::required(array(
  $vendorDir . '/Symfony/Component/EventDispatcher',
));
