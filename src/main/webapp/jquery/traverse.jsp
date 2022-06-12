<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>traverse</title>
		<script src='../lib/jquery-3.6.0.min.js'></script>
		<script>
			$(function(){ 	// == $(document).read(function(){})
				$('div').filter(
					function(index){
						var b= false;
						let ele = $('div').eq(index);
						//console.log(ele.text());
						var v = $(ele).attr('v'); //동적기능 
						if(v>=500) b=true;
						return b;
					}
				).css('color','#f00');
			
				console.log('length',$('div').length);
				// console.log('size', $('div').size); => 사라짐. 사용 되지 않음 
			});
		</script>
	</head>
		
	<body>
		<h1>traverse</h1>
		<div v='1000'>1000</div>
		<div v='500'>500</div>
		<div v='1500'>1500</div>
		<div v='100'>100</div>
		<div v='200'>200</div>
	</body>
</html>