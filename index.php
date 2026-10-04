<?php
// Front controller for Core2 web mode
try {
    // Define document root constants
    if (!defined('DOC_ROOT')) define('DOC_ROOT', __DIR__ . '/');
    if (!defined('DOC_PATH')) define('DOC_PATH', substr(DOC_ROOT, strlen(rtrim($_SERVER['DOCUMENT_ROOT'], '/'))) ? : '/');

    // Set include path: inc/classes for relative requires, DOC_ROOT for core2/ paths
    set_include_path(
        get_include_path()
        . PATH_SEPARATOR . __DIR__ . '/inc/classes'
        . PATH_SEPARATOR . DOC_ROOT
    );

    // Load Error handler first (for exception catching)
    require_once __DIR__ . '/inc/classes/Error.php';

    // Load composer autoloader and Init
    require_once __DIR__ . '/vendor/autoload.php';
    require_once __DIR__ . '/inc/classes/Init.php';

    $init = new \Init();
    $init->checkAuth();
    echo $init->dispatch();
} catch (\Exception $e) {
    \Core2\Error::catchException($e);
} catch (\Error $e) {
    \Core2\Error::Exception($e->getMessage(), 500);
}
