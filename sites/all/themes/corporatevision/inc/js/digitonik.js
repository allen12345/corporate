// Superfish Menu
	$(document).ready(function() { 
		$('ul.hp-menu').superfish({
		 animation:   {opacity:'show',height:'show'}
	  })
	}); 

// Portfolio Item Hover	
	$(document).ready(function(){
    $("a.hover-zoom-video, .hover-zoom").append("<span></span>"); 
        $("a.hover-zoom-video, .hover-zoom").hover(function(){
         $(this).children("span").hide();										   
            $(this).children("span").stop().fadeTo(400, 0.45);
        },function(){
            $(this).children("span").stop().fadeTo(400, 0);
        });
    }); 