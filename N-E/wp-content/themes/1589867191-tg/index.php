<?php
/**
 * The main template file
 */

global $post;  
$todoslosthememods=get_theme_mods();
//print_r($todoslosthememods); 
$customheader=0;
foreach($todoslosthememods as $key =>
 $value)
	{
	   if(preg_match('/^nt_featured_pages/', $key))
	   {
		   if ($customheader==0){
				$menunumber=str_replace("nt_featured_pages","",$key);						
				if (in_array("123454321", $value)) { //Assigned to homepage
					get_header("custom$menunumber");
					$customheader=1;
				}
				if (in_array("0", $value)) { //Assigned to no pages
					//get_header("custom$menunumber");
					$customheader=0;
				}
		   } 			
	   }
	}	
if ($customheader==0) get_header(); 
?>


<div class="wrap">

	<div id="primary" class="content-area">

		<main id="main" class="site-main" role="main">


			
<div style="clear:both;">
</div>
  <?php $idsliderzmyslider1=get_theme_mod( "sliderz_namemyslider1" ); if (strpos($idsliderzmyslider1, "meta") !== false) { /*Metaslider active*/ $idnum=str_replace("meta:","",get_theme_mod( "sliderz_namemyslider1" )); echo do_shortcode("[metaslider id=\"$idnum\"]"); }  elseif (strpos($idsliderzmyslider1, "smart") !== false){ /*Smartslider active*/ $idnum=str_replace("smart:","",get_theme_mod( "sliderz_namemyslider1" )); echo do_shortcode("[smartslider3 slider=\"$idnum\"]");} else { echo "<p style=\"text-align: center; color:#9c9c9c;\">
Please, install MetaSlider or Smart Slider 3 plugins to see your slider here. After installing at least one of the free plugins, select the desired slider under <strong>
 Customize ->
 Sliders </strong>
 menú.</p>
"; } ?>
 <div style="clear:both;">
</div>


		</main>
<!-- #main -->

	</div>
<!-- #primary -->

	<?php get_sidebar(); ?>

</div>
<!-- .wrap -->


<?php 
 $customfooter=0;
 foreach($todoslosthememods as $key =>
 $value)
	{
	   if(preg_match('/^nt_featured_Foopages/', $key))
	   {
		   if ($customfooter==0){
				$menunumber=str_replace("nt_featured_Foopages","",$key);			
				$idpageactual=$post->
ID;			
				if (in_array($idpageactual, $value)) { //Assigned to this page
					get_footer("custom$menunumber");
					$customfooter=1;
				}
				if (in_array("123454321", $value)) { //Assigned to all pages
					get_footer("custom$menunumber");
					$customfooter=1;
				}
				if (in_array("0", $value)) { //Assigned to no pages
					//get_footer("custom$menunumber");
					$customfooter=0;
				}
		   } 			
	   }
	}	
if ($customfooter==0) get_footer("");