<?php

// use ActiveRecord caching in production
ActiveRecord::$useCache = Site::$production;
