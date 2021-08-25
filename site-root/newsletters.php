<?php

// get address newsletter
if (!$newsletterDate = array_shift(Site::$pathStack)) {
    RequestHandler::throwInvalidRequestError('Newsletter must be specified in path');
}


// build path to newsletter
$path = ['newsletters', $newsletterDate];


// force trailing slash
if (!count(Site::$pathStack)) {
    array_push($path, '');
    Site::redirectPermanent($path);
}


// handle request for newsletter markup
if (empty(Site::$pathStack[0])) {
    array_push($path, 'index.mjml');

    // get asset node
    if (!$mjmlNode = Site::resolvePath($path)) {
        RequestHandler::throwNotFoundError('Newsletter markup not found');
    }

    // fetch HTML
    $cacheKey = "newsletters:{$mjmlNode->ID}";
    
    if (!$html = Cache::fetch($cacheKey)) {
        $html = shell_exec('hab pkg exec jarvus/mjml mjml -r '.escapeshellarg($mjmlNode->RealPath));

        $url = Emergence\Util\Url::buildAbsolute(['newsletters', $newsletterDate, '']);
        $html = str_replace('[[SHORT_PERMALINK]]', $url, $html);
        Cache::store($cacheKey, $html);
    }

    // output HTML
    header('Content-Type: text/html');
    print($html);
    exit();
}


// handle request for newsletter asset
$path = array_merge($path, Site::$pathStack);

if (!$assetNode = Site::resolvePath($path)) {
    RequestHandler::throwNotFoundError('Newsletter asset not found');
}

$assetNode->outputAsResponse();
