<?php if ($fields['field_image_fid']->content) { ?><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'slide_show_'.theme_get_setting('tm_slideshow'), $fields['field_image_fid']->content, $fields['title']->content, $fields['title']->content);?></a><?php } ?>