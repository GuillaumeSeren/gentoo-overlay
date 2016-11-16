<?php
/* Autoloader for composer/ca-bundle and its dependencies */

/* $vendorDir = '/usr/share/php'; */
if (!class_exists('Fedora\\Autoloader\\Autoload', false)) {
    require_once '/usr/share/php/Fedora/Autoloader/autoload.php';
}

\Fedora\Autoloader\Autoload::addPsr4('Symfony\\Component\\Yaml\\', __DIR__);

// Dependencies
/* \Fedora\Autoloader\Dependencies::required(array( */
/* 	$vendorDir . '/Symfony/Yaml/Yaml.php', */
/* )); */