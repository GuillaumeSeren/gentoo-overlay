<?php
/* Autoloader for sebastianbergman-object-enumerator its dependencies */

$vendorDir = '/usr/share/php';

if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addPsr4('SebastianBergmann\\ObjectEnumerator\\', __DIR__);

// Dependencies
\Fedora\Autoloader\Dependencies::required(array(
	$vendorDir . '/SebastianBergmann/GlobalState/autoload.php',
));
