<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
<head>
<?php print $head; ?>
<title><?php print $head_title; ?></title>
<?php print $styles; ?>
<?php print $scripts; ?>
</head>

<body class="homebody">

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


<!--Begin Slider Area-->
	<?php if ($slide_show) { print $slide_show; } ?>
<!--End Slider Area-->

<!--Begin Wrapper-->
<div id="wrapper">

<!--Begin Information area-->
	<div class="buzz-area">
    	<?php if ($home_top_first) { print $home_top_first; } ?>
        <!--Begin Features-->
        <div class="features">
        	<div class="features-1">
            	<?php if ($home_quarter_first) { print $home_quarter_first; } ?>
            </div>
            <div class="features-2">
            	<?php if ($home_quarter_second) { print $home_quarter_second; } ?>
            </div>
            <div class="features-3">
            	<?php if ($home_quarter_third) { print $home_quarter_third; } ?>
            </div>
            <div class="features-4">
            	<?php if ($home_quarter_fourth) { print $home_quarter_fourth; } ?>
            </div>
        </div>
        <!--End Features-->
    </div>
<!--End Information area-->    
    
    <!--Begin Blog News-->
    <div id="blog-news">
    
    	<div class="homepost">
			<?php if ($home_bottom_first) { print $home_bottom_first; } ?>
        </div>
        
        <div class="home-news">
        	<?php if ($home_bottom_second) { print $home_bottom_second; } ?>
		</div>
        
        <div id="social-home">
			<?php if ($home_bottom_third) { print $home_bottom_third; } ?>
        </div>
              
    </div>
    <!--End Blog News--> 

    
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
    <p class="copyright"><?php print $footer_message; ?></p>
    
    </div>
</div>
<!--End footer wrapper-->

<script type="text/javascript"> Cufon.now(); </script>
<?php print $closure; ?>
</body>
</html>