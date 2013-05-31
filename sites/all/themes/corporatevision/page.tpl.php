<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
<head>
<?php print $head; ?>
<title><?php print $head_title; ?></title>
<?php print $styles; ?>
<?php print $scripts; ?>
</head>
<?php 
$nn = corporatevision_get_node_style(); 
if ($nn != 'n') {
	$ss = $nn;
} else {
	$ss = theme_get_setting('tm_page');
}
?>
<body>

<div id="header">
	<div id="logo">
		<?php if ($logo) { ?><a href="<?php print check_url($front_page); ?>"><img src="<?php print check_url($logo); ?>" alt="<?php print $site_title; ?>" /></a><? } ?>
    </div>
<!--  BEGIN PAGE MENU  -->
	<?php print corporatevision_tree_top() ?>
<!--  END PAGE MENU  -->

</div>
<!--End Header-->

<div class="clear"></div>


<!--Begin Wrapper-->
<div id="wrapper">

<!--Begin portfolio row-->
<?php if (arg(0) != 'portfolio' and ($ss == 0 or arg(0) != 'node')) { ?>
	<div id="main" class="col-left">
<?php } elseif (theme_get_setting('tm_portfolio') == 0 and arg(0) == 'portfolio') { ?>
	<div id="mainp" class="col-left">
<?php } elseif ($ss > 0 and arg(0) == 'node') { ?>
	<div class="wide">
<?php } else { ?>
	<div>
<?php } ?>

	<?php if ($mission): print '<div id="mission">'. $mission .'</div>'; endif; ?>
	<?php if ($title and arg(0) != 'portfolio' and ($ss == 0 or arg(0) != 'node')){ print '<h1 class="headline">'. $title .'</h1>'; } elseif ($title){ print '<h1 class="portfolio-headline">'. $title .'</h1>'; } ?>
	<p class="breadcrumbs"><?php print $breadcrumb; ?></p>
	<?php if ($tabs): print ''. $tabs .'<div class="clear"></div>'; endif; ?>
	<?php if ($tabs2): print ''. $tabs2 .'<div class="clear"></div>'; endif; ?>
	<?php if ($show_messages && $messages): print $messages; endif; ?>
	<?php print $help; ?>

		<?php print $content ?>            

    <!--End Post-->
</div>

<?php if ((arg(0) != 'portfolio' or theme_get_setting('tm_portfolio') == 0) and ($ss == 0 or arg(0) != 'node')) { ?>
<div id="sidebar" class="col-right">
	<?php if ($sidebar_right_first) { ?><?php print $sidebar_right_first; ?><?php } ?> 
</div>
<?php } ?> 
    
</div>
<!--End Wrapper-->

<!--Begin footer wrapper-->
<div id="footer-wrap">
	<div id="footer">
    
    <div class="footer-widget">
        <?php if ($footer_first) { ?><?php print $footer_first; ?><?php } ?>
    </div>
    
    <div class="footer-widget">
    	<?php if ($footer_second) { ?><?php print $footer_second; ?><?php } ?>
    </div>
    
    <div class="footer-widget">
    	<?php if ($footer_third) { ?><?php print $footer_third; ?><?php } ?>
    </div>
    
    <div class="footer-widget-last">
    	<?php if ($footer_fourth) { ?><?php print $footer_fourth; ?><?php } ?>
    </div>
    
    <div class="clear"></div>
    
    <a href="<?php print check_url($front_page); ?>"><img class="footer-logo" src="<?php print $GLOBALS['base_url'].'/'.drupal_get_path('theme', 'corporatevision') ?>/logo-tiny.png" alt="<?php print $site_title; ?>" /></a>
    <p class="copyright"><?php print $footer_message; ?> | <a href="http://www.themesnap.com">Designed by ThemeSnap.com</a></p>
    
    </div>
</div>
<!--End footer wrapper-->
<?php print $closure; ?>
<script type="text/javascript"> Cufon.now(); </script>
<script type="text/javascript" charset="utf-8">$(document).ready(function(){$("a[rel^='prettyPhoto']").prettyPhoto({theme:'facebook'});});</script>
</body>
</html>