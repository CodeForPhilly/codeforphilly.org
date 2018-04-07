{* Optimized Clicky loader (uncomment and change the below occurence of XXXXXXXX to your site's clicky ID) *}
{$clickySiteId = "100554785"}
<script type="text/javascript">
{if $.User}
	var clicky_custom = {
		session: {
			username: '{$.User->Username}'
			,email: '{$.User->Email}'
			,full_name: '{$.User->FullName}'
		}
	};
{/if}

var clicky_site_ids = clicky_site_ids || [];
clicky_site_ids.push({$clickySiteId});
(function() {
	var s = document.createElement('script');
	s.type = 'text/javascript';
	s.async = true;
	s.src = '//static.getclicky.com/js';
	( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
})();
</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/{$clickySiteId}ns.gif" /></p></noscript>

{literal}
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-52VJRX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-52VJRX');</script>
<!-- End Google Tag Manager -->
{/literal}