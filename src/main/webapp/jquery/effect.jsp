<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect</title>
<script src='../lib/jquery-3.6.0.min.js'></script>
<script>
	$(function(){
		$('#here').css({
			'height' : '200px',
			'background-color' : '#aaa'
		})
		//hide
		$('#btnHide1').on('click',function(){
			$('#here').hide();
		})
		$('#btnHide2').on('click',function(){
			$('#here').hide('slow');
		})
		$('#btnHide3').on('click',function(){
			$('#here').hide('fast');
		})
		$('#btnHide4').on('click',function(){
			$('#here').hide(5000);
		})
		
		//show
		$('#btnShow1').on('click',function(){
			$('#here').show();
		})
		$('#btnShow2').on('click',function(){
			$('#here').show('slow');
		})
		$('#btnShow3').on('click',function(){
			$('#here').show('fast');
		})
		$('#btnShow4').on('click',function(){
			$('#here').show(5000);
		})
		
		//slide
		$('#btnSlideUp').on('click',function(){
			$('#here').slideUp('slow');
		})
		$('#btnSlideDown').on('click',function(){
			$('#here').slideDown('slow');
		})
		$('#btnSlideToggle').on('click',function(){
			$('#here').slideToggle('slow');
		})
		
		//fade
		$('#btnFadeIn').on('click',function(){
			$('#here').fadeIn(2000);
		})
		$('#btnFadeOut').on('click',function(){
			$('#here').fadeOut(2000);
		})
	})
</script>
</head>

<body>
	<h1>effect</h1>
	<div id='here'>HERE</div>
	<fieldset>
		<legend>SHOW</legend>
		<button type='button' id='btnShow1'>Default</button>
		<button type='button' id='btnShow2'>Slow</button>
		<button type='button' id='btnShow3'>Fast</button>
		<button type='button' id='btnShow4'>User</button>
	</fieldset>
	<fieldset>
		<legend>HIDE</legend>
		<button type='button' id='btnHide1'>Default</button>
		<button type='button' id='btnHide2'>Slow</button>
		<button type='button' id='btnHide3'>Fast</button>
		<button type='button' id='btnHide4'>User</button>
	</fieldset>
	<fieldset>
		<legend>SLIDE UP / DOWN / TOGGLE</legend>
		<button type='button' id='btnSlideUp'>SLIDE UP</button>
		<button type='button' id='btnSlideDown'>SLIDE DOWN</button>
		<button type='button' id='btnSlideToggle'>SLIDE TOGGLE</button>
	</fieldset>
	<fieldset>
		<legend>FADE IN / OUT</legend>
		<button type='button' id='btnFadeIn'>FADE IN</button>
		<button type='button' id='btnFadeOut'>FADE OUT</button>
	</fieldset>
</body>
</html>