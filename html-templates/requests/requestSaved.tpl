{extends '/designs/site.tpl'}

{block 'content'}
{$Request = $data}
    <a href='http://codeforphilly.org/requests'> Back to the Request Board </a> / 
    <a href='http://codeforphilly.org/requests/{$Request->ID}'> Back to {$Request->Title}</a>

{/block}