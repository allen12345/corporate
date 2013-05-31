<div class="commentlist">
	<div class="comment even thread-even depth-1" id="li-comment-3">
		<div id="comment-3">
			<div class="comment-container">
			<div class="avatarbg">
				<div class="avatar">
					<?php print $picture ?>
				</div>
				<span class="reply col-right">
					<?php print $links ?>
				</span>
			</div>
      
			<div class="comment-right">  
				<div class="comment-head">
					<span class="name col-left"><?php print $author ?></span>
					<span class="date col-right"><?php print format_date($comment->timestamp); ?></span>         
				</div>       

				<div class="comment-entry">
      				<?php print $content ?>
				</div>
      
			</div>   
			</div>
		</div>
	</div>
</div>

<?php //print '<pre>'. check_plain(print_r($comment, 1)) .'</pre>' ?>