/**
 * 제품관리
 */

(	
	parts = function(){
		$('.left').load('parts/parts_input.jsp');
		$('.right').load('parts.do');
		let oldPos=-1;
	}
)() //()=즉시 실행되는 코드

parts.select = function(){
	let frm = $('#frm_parts_list')[0];
	frm.nowPage.value = 1;
	var param = $('#frm_parts_list').serializeArray();
	$('.right').load('parts.do?job=select',param);
}

parts.movePage = function(page){
	let frm = $('#frm_parts_list')[0];
	frm.nowPage.value = page;
	var param = $('#frm_parts_list').serializeArray();
	$('.right').load('parts.do?job=select',param);
}

parts.view = function(pos,code){
	let frm = $('#frm_parts_list')[0];
	let array = $('.item').toArray();
	let param;
	
	//현재 선택된 행 
	$(array[pos]).css('background-color','#fea676');
	
	//이전에 선택된 행
	if(parts.oldPos != -1){
	$(array[parts.oldpos]).css('background-color','');
	}
	
	parts.oldpos=pos;
	
	frm.code.value = code;
	param = $(frm).serializeArray();
	
	$('.left').load('parts.do?job=view', param, function(){
		$('.btnInsert').attr('disabled', true); //저장버튼 비활성화
		$('.btnUpdate').attr('disabled', false); //수정버튼 활성화
		$('.btnDelete').attr('disabled', false); //삭제버튼 활성화
		$('#frm_parts_input input[name=code]').attr('readonly',true);
		})
}
	
parts.update = function(){
	let yn = confirm('정말??');
	if(!yn) return;
		
	//$() = jquery ${} jsql
	let param = $('#frm_parts_input').serialize();
	$('.left').load('parts.do?job=update',param,function(resp,status,xhr){
		param = $('#frm_parts_list').serialize();
		$('.right').load('parts.do?job=select',param,function(){
			let array = $('.item').toArray();
			$(array[parts.oldpos]).css('background-color','#fea676');	
		});
	})
}

parts.delete = function(){
	let yn = confirm('정말 삭제할꺼??');
	if(!yn) return;
	
	let param = $('#frm_parts_input').serializeArray();
	$('.left').load('parts.do?job=delete',param,function(){
		param = $('#frm_parts_list').serializeArray();
		$('.right').load('parts.do?job=select',param);
		//parts.oldpos = -1.
	});
}

parts.insert = function(){
	let param = $('#frm_parts_input').serialize();
	$('.left').load('parts.do?job=insert',param,function(){
		param = $('#frm_parts_list').serializeArray();
		$('.right').load('parts.do?job=select',param);
		
	});
}

parts.cancel = function(){
	let array = $('.item').toArray();
	if(parts.oldPos != -1){
	$(array[parts.oldpos]).css('background-color','');
	}
	
	$('.btnInsert').attr('disabled', false); 
	$('.btnUpdate').attr('disabled', true); 
	$('.btnDelete').attr('disabled', true); 
	
	let frm = document.frm_parts_input;
	$('#frm_part_input input[name=code]').attr('readonly',false);
	
	frm.code.value = "";
	frm.codeName.value = "";
	frm.spec.value = "";
	frm.price.value = "";
}


