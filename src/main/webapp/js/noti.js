/**
 * 공지사항
 */
(
noti = function(){
	noti.nowPage = 1;
	
	noti.socket = new WebSocket("ws://localhost:5555/web_project2/noti");
	let frm = $('.frm_input')[0];
	frm.nal.valueAsDate = new Date();
	
	noti.socket.onopen = function(){
		//console.log('socket open.....');
	}
	noti.socket.onclose = function(){}
	noti.socket.onmessage = function(resp){
		//console.log(resp.data);
		
		let jsonStr = resp.data;
		let jsonObj = JSON.parse(jsonStr);
		
		switch(jsonObj.command){
			case "init":
				noti.init(jsonObj);
				break;
			case "insert":
				noti.insert(jsonObj);
				break;
			case "update":
				noti.update(jsonObj);
				break;
			case "delete":
				noti.delete(jsonObj);
				break;
			case "select":
				noti.select(jsonObj);
				break;
		}
		
		/* 테스트용 샘플
		console.log('command : '    , jsonObj.command);
		console.log('totPage : '    , jsonObj.totPage);
		console.log('list length : ', jsonObj.list.length);shtu
		console.log('first data.....');
		console.log('sno :'     , jsonObj.list[0].sno);
		console.log('subject ; ', jsonObj.list[0].subject);
		console.log('nal :'     , jsonObj.list[0].nal);
		console.log('doc :'     , jsonObj.list[0].doc);
		console.log('id :'      , jsonObj.list[0].id);
		*/
	}
}
)() // 즉시 실행


// init
noti.init = function(jsonObj){
	// 버튼 제어
	if(noti.nowPage == 1){
		$('.btnPrev').attr('disabled', true);
	}else{
		$('.btnPrev').attr('disabled', false);
	}
	
	if(noti.nowPage == jsonObj.totPage){
		$('.btnNext').attr('disabled', true);
	}else{
		$('.btnNext').attr('disabled', false);
	}
	
	// init 코드
	let items = $('.items');
	for(var vo of jsonObj.list){
		let temp = document.querySelector('.temp'); // = $('.temp');
		// temp 객체안에 있는 content를 자식태그들과 함께(true) / false = 자식태그들 함께 X
		let clone = document.importNode(temp.content, true);
		let frm = clone.querySelector('.frm_list');
		
		//btnUpDel
		let upDel = clone.querySelector('.btnUpDel');
		
		if(sessionID == vo.id){
			$(upDel).css('visibility','visible');
		}else{
			$(upDel).css('visibility','hidden');
		}
		
		
		frm.nal.value     = vo.nal;
		frm.id.value      = vo.id;
		frm.subject.value = vo.subject;
		frm.doc.value     = vo.doc;
		frm.sno.value     = vo.sno;
		
		$(items).append(clone);
	}
}


//setTimeout 외부에 따로 만들어주기
sto1 = function(frm){
	$(frm).css('border-color','#ffc414');
	setTimeout(function(){
		$(frm).css('border-color','#fe620d');
	}, 3000);
}

sto2 = function(msg){
	$('.msg').css('animation','blink-info 1s step-end infinite');
	$('.msg').css('background-color','#ffc414');
	setTimeout(function(){
		$('.msg').css('animation','');
		$('.msg').css('background-color','#fe620d');
		}, 3000);
}


// sendInsert
noti.sendInsert = function(frm){
	// frm의 정보를 jsonObj로 생성
	let vo = {};
	vo.id      = frm.id.value;
	vo.nal     = frm.nal.value;
	vo.subject = frm.subject.value;
	vo.doc     = frm.doc.value;
	
	let jsonObj = {};
	jsonObj.command = "insert";
	jsonObj.message = "새로운 공지 사항이 추가되었습니다:)";
	jsonObj.vo = vo;
	
	console.log('jsonObj : ', jsonObj);
	
	// jsonObj -> jsonStr로 변환
	let jsonStr = JSON.stringify(jsonObj);
	
	// jsonStr을 전송
	console.log('jsonStr : ', jsonStr);
	noti.socket.send(jsonStr);
}


// insert
noti.insert = function(jsonObj){
	let vo = jsonObj.vo;
	let items = $('.items');
	
	let temp = document.querySelector('.temp');
	let clone = document.importNode(temp.content, true);
	let frm = clone.querySelector('.frm_list');
	frm.nal.value = vo.nal;
	frm.id.value = vo.id;
	frm.subject.value = vo.subject;
	frm.doc.value = vo.doc;
	frm.sno.value = vo.sno;
	
	$(items).prepend(clone);
	
	sto2();
	
	
	$('.msg').html(jsonObj.message);
	
}

// sendUpdate = update 정보를 전송하는 것 
noti.sendUpdate = function(frm){
	let yn = confirm('공지사항을 수정하시겠습니까?');
	if(!yn) returnn;
	
	let jsonObj = {};
	let vo = {};
	let jsonStr; // 전송을 위해 필요
	
	vo.nal 	   = frm.nal.value;
	vo.id 	   = frm.id.value;
	vo.subject = frm.subject.value;
	vo.doc     = frm.doc.value;
	vo.sno 	   = frm.sno.value; //sno를 기준으로 하기 때문에 update에는 필요
	
	jsonObj.command = 'update';
	jsonObj.message = '수정된 공지사항이 있습니다!';
	//obj -> 문자열 -> 전송
	jsonObj.vo = vo; //vo에 때려넣기
	
	jsonStr = JSON.stringify(jsonObj); //jsonObj를 사용해서 문자열 만들기
	
	noti.socket.send(jsonStr); //전송
}


// update = 서버에서 정보를 받아오는 것
noti.update = function(jsonObj){
	//list 를 배열로 가져오기
	let frms = $('.frm_list').toArray();
	let vo = jsonObj.vo;
	
	if(jsonObj.result == 'reject'){ //수정중 오류발생
		
	}else{
		sto2();
		$('.msg').html(jsonObj.message);
		for(frm of frms){ //toArray로 가져온것들을 하나씩 form으로 만들기
			if(frm.sno.value == vo.sno){ 
				frm.id.value 	  = vo.id;
				frm.nal.value 	  = vo.nal;
				frm.subject.value = vo.subject;
				frm.doc.value 	  = vo.doc;
				frm.sno.value	  = vo.sno;
				
				sto1(frm);
				break;
			}
		}
	}
	
}


// sendDelete
noti.sendDelete = function(frm){
	let yn = confirm('공지사항을 삭제하시겠습니까?');
	if(!yn) returnn;
	
	
	let jsonObj = {};
	let jsonStr = "";
	let vo = {};
	
	vo.sno = frm.sno.value;
	
	jsonObj.command = "delete";
	jsonObj.message = "삭제된 공지사항이 있습니다!";
	jsonObj.vo = vo;
	
	jsonStr = JSON.stringify(jsonObj);
	noti.socket.send(jsonStr);
}


// delete
noti.delete = function(jsonObj){
	//list 를 배열로 가져오기
	let frms = $('.frm_list').toArray();
	let vo = jsonObj.vo;
	
	if(jsonObj.result == 'reject'){
		alert(jsonObj.message);
	} else{
		sto2();
		$('.msg').html(jsonObj.message);
		for(frm of frms){
			if(frm.sno.value == vo.sno){
				$('.items').find(frm).remove();
				break;
			}
		}
	}
}


// find
noti.find = function(frm){
	noti.nowPage = 1;
	let jsonStr = "";
	let jsonObj = {};
	jsonObj.command = "select";
	jsonObj.findStr = frm.findStr.value;
	jsonObj.nowPage = noti.nowPage;
	
	jsonStr = JSON.stringify(jsonObj);
	noti.socket.send(jsonStr);
}


//select
noti.select = function(jsonObj){
	//버튼 제어
	if(noti.nowPage == 1){
		$('.btnPrev').attr('disabled', true);
	}else{
		$('.btnPrev').attr('disabled', false);
	}
	
	if(noti.nowPage == jsonObj.totPage){
		$('.btnNext').attr('disabled', true);
	}else{
		$('.btnNext').attr('disabled', false);
	}
	
	// select 코드
	let items = $('.items');
	$(items).empty();
	let temp = document.querySelector('.temp');
	for(vo of jsonObj.list){
		let clone = document.importNode(temp.content,true);
		let frm = clone.querySelector('.frm_list');
		
		//btnUpDel
		let upDel = clone.querySelector('.btnUpDel');
		
		if(sessionID == vo.id){
			$(upDel).css('visibility','visible');
		}else{
			$(upDel).css('visibility','hidden');
		}
		
		frm.nal.value 	  = vo.nal;
		frm.id.value	  = vo.id;
		frm.subject.value = vo.subject;
		frm.doc.value 	  = vo.doc;
		frm.sno.value	  = vo.sno;
		
		$(items).append(clone);
		
		
	}
	
	
}


//movePage
noti.movePage = function(page){
	let jsonObj = {};
	let jsonStr;
	
	noti.nowPage += page;
	if(noti.nowPage<1) noti.nowPage =1;
	jsonObj.command = 'select';
	jsonObj.nowPage = noti.nowPage;
	jsonObj.findStr = $('#findStr').val();
	
	jsonStr = JSON.stringify(jsonObj);
	noti.socket.send(jsonStr);	
	
}


// showInput
noti.showInputForm = function(){
	if(sessionID == null || sessionID == ''){
		alert('!공지사항 작성은 로그인 plz')
		window.location = 'index.jsp?inc=./student/form_login.jsp';
	}else{
	$('.frm_input').slideToggle();
	}
}


