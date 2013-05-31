<?php if ($fields['field_image_fid']->content) { ?><a href="<?php print $fields['field_image_fid']->content; ?>" rel="prettyPhoto[pp_gal]" class="hover-zoom"><?php print theme('imagecache', 'blog_teaser_1', $fields['field_image_fid']->content, '', '');?></a><?php } ?>
<h2><?php print $fields['title']->content; ?></h2>
<?php print $fields['body']->content; ?>
<p><a href="<?php print $fields['path']->content; ?>"><?php print t('Read more &rarr;'); ?></a></p>