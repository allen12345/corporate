<?php if (false and $fields['field_image_fid']->content) { ?><div class="icon"><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'block_thumb', $fields['field_image_fid']->content, '', '');?></a></div><?php } ?>
<h3><?php print $fields['title']->content; ?></h3>
<p><?php print $fields['body']->content; ?></p>
<p class="small-feature"><a href="<?php print $fields['path']->content; ?>"><?php print t('Learn more &rarr;'); ?></a></p>