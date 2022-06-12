/**
 *  생산관리에 필요한 스크립트
 */

(
	product = function(){
		$('.left').load('product/product_input.jsp',function(){
			let frm = $('#frm_product_input')[0];
			frm.nal.valueAsDate = new Date();
		});
		
		$('.right').load('product.do');
		let oldPos = -1; //사용자가 선택한 행 위치
	}
)()

//제품코드 조회
product.findCode = function(){
	let frm = $('#frm_product_input')[0];
	let code = frm.code.value;
	let win = window.open('./product/product_find_code.jsp?code='+code, 
						  'win','width=400, height=500');
}

//금액계산 
product.compute = function(frm){
	let ea = Number(frm.ea.value);
	let price = Number(frm.price.value);
	let amt = (ea * price).toLocaleString('ko');
	frm.amt.value = amt;
}

//CRUD
product.select = function(frm){
	frm.nowPage.value = 1;
	var param = $(frm).serializeArray();
	$('.right').load('product.do?job=select',param)
}

product.insert = function(){
	let param = $('#frm_product_input').serialize();
	//$.post('product.do?job=insert', param, function(){
	$('.left').load('product.do?job=insert',param, function(){
		//let frm=$('#frm_product_list')[0];
		//product.select(frm);
		var btnLast = document.getElementById('btnLast');
		btnLast.click();
	})
}

product.update = function(){
	//1) 정말 수정할 것인지 묻기
	let yn = confirm('정말???')
	if(!yn) return;
	
	//2) 입력폼 안에 있는 정보들을 param로 만들기
	let param = $('#frm_product_input').serialize();
	
	//3) $.post를 사용하여 job=update 파라메터와 함께 product.do를 실행
	//$.post('product.do?job=update',param, function(){
	$('.left').load('product.do?job=update',param, function(){
		let param2 = $('#frm_product_list').serialize();
		$('.right').load('product.do?job=select',param2,function(){
			let array = $('.item').toArray();
			$(array[product.oldPos]).css('background-color','#fea676');	
		})
	});
}

product.delete = function(){
	// 삭제여부 -> param -> $.post()
	let yn = confirm("정말??");
	if(!yn) return;
	
	let param = $('#frm_product_input').serialize();
//	$.post('product.do?job=delete', param,function(){
	$('.left').load('product.do?job=delete', param,function(){
		let param2 = $('#frm_product_list').serialize();
		$('.right').load('product.do?job=select',param2);
		})
}

product.cancel = function(){
	let frm = $('#frm_product_input')[0];
	frm.sno.value='';
	frm.code.value='';
	frm.codeName.value='';
	frm.ea.value='';
	frm.price.value='';
	frm.amt.value='';
	$('.btnInsert').attr('disabled',false);
	$('.btnUpdate').attr('disabled',true);
	$('.btnDelete').attr('disabled',true);
}

//list에서 선택
product.view = function(index, sno){
	// 하이라이트 기능(for css)
	let array = $('.item').toArray();
	$(array[index]).css('background-color', '#fea676')
	
	if(product.oldPos >= 0){
		$(array[product.oldPos]).css('background-color', '');
	}
	product.oldPos = index;
	
	//선택시 left에 정보 띄우기
	let frm = $('#frm_product_list')[0];
	frm.sno.value = sno;
	let param = $(frm).serialize();
	$('.left').load('product.do?job=view',param, function(){
		$('.btnUpdate').attr('disabled',false);
		$('.btnDelete').attr('disabled',false);
		$('.btnInsert').attr('disabled',true);
	});
	
}


//페이징
product.movePage = function(page){
	let frm = $('#frm_product_list')[0];
	frm.nowPage.value = page;
	let param = $('#frm_product_list').serialize();
	$('.right').load('product.do?job=select',param);
}
