<div class="home-news">
<h3><?php print t('News'); ?> <span class="headline-reg">&#125; <?php print t('Stay informed'); ?></span></h3>
<?php 
foreach ($rows as $id => $row) {
print $row;
}
?>
<h4><a href="<?php print url('news'); ?>"><?php print t('More news and stuff &rarr;'); ?></a></h4>
</div>