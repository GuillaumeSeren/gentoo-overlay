<?php
/* Autoloader for symfony-console and its dependencies */

$vendorDir = '/usr/share/php';
if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

// Dependencies
\Fedora\Autoloader\Dependencies::required(array(
  $vendorDir . '/SebastianBergmann/TextTemplate/autoload.php',
  $vendorDir . '/Doctrine/Instantiator/autoload.php',
  $vendorDir . '/SebastianBergmann/Exporter/autoload.php',
));
