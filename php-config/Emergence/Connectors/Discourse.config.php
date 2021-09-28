<?php

Emergence\Connectors\Discourse::$host = getenv('DISCOURSE_HOST');
Emergence\Connectors\Discourse::$ssoSecret = getenv('DISCOURSE_SSO_SECRET');
