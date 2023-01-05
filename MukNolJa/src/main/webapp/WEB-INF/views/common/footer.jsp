<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#footerDiv{
		position: absolute;
		width:100%;
		z-index: 9999;
		background: #f1f1f1;
		color: #b9b9b9;
		padding: 50px 0px;
		font-size: 10px;
	}
	.footerCate{
		color: #b9b9b9;
		font-size: 12px;
		text-decoration: none;
		margin: 10px 0px;
	}
	.footerCate:hover{
		color: #6BB6EC;
		cursor: pointer;
	}
	#qa{
		font-size: 14px;
	}
	#qa:hover{
		color: #6BB6EC;
		cursor: pointer;
	}
	#qa_modal{
		display: none;
		width: 350px;
		height: 450px;
		padding: 20px 20px;
		background-color: #fefefe;
		border: 1px solid #888;
		border-radius: 3px;
	}
	.mukButton {
		transition: all 0.3s;
		background: #6BB6EC;
		color:white;
		height:30px;
		border-radius: 8px;
		padding:0px 10px;
		border: 1px solid #6BB6EC;
		cursor:pointer;
	}
	 .mukButton:hover{
	 	background: white;
	 	color: #6BB6EC;
	 	border: 1px solid #6BB6EC;
	}
	#qaContent{
		width: 100%;
		height: 250px;
 		resize: none;
	}
	
</style>
</head>
<body>
	<div id="footerDiv" class="mt-5">
		<div class="container-sm">
			<div class="row">
				<div class="col-6">
					<div class="pb-2 fw-bold" style="font-size:12px;">(주)먹놀자 | 대표자 김민주</div>
					사업자등록번호 : 000-00-0000 | 통신판매업신고번호 : 제0000-서울중구-0000호<br>
					연락처 : 000-0000-0000 | 팩스 : 000-0000-0000| 이메일 : muknolja@naver.com<br>
					주소 : 서울특별시 중구 남대문로 120 대일빌딩 2층, 3층
					<hr>
					Copyright@C1K3
				</div>
				<div class="col-2">
					<div class="pb-2"><a class="footerCate" href="#">Travel</a></div>
					<div class="pb-2"><a class="footerCate" href="#">Hotel</a></div>
					<div class="pb-2"><a class="footerCate" href="#">Party</a></div>
					<div class="pb-2"><a class="footerCate" href="#">Review</a></div>
				</div>
				<div class="col-2">
					<div class="pb-2">이용약관</div>
					<div class="pb-2">개인정보처리방침</div>
				</div>
				<div class="col-2 text-end">
					<b id="qa">문의하기</b>
				</div>
			</div>
		</div>
	</div>
	
	<div id="qa_modal">
		<div class="row">
			<div class="col text-center">
				<label>제목</label><br>
				<input type="text" class="form-control" id="qaTitle">
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col text-center">
				<label>내용</label><br>
				<textarea class="form-control" id="qaContent"></textarea>
			</div>
		</div>
		<div class="row text-center" style="margin-top: 20px;">
			<div class="col">
				<button type="button" class="mukButton" id="qa_btn">문의</button>
				<button type="button" class="mukButton" id="closeBtn">닫기</button>
			</div>
		</div>
	</div>
	
	<script>
		function ModalF(id) {
	        var zIndex = 9999;
	        var modal = document.getElementById(id);
	
	        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	        modal.querySelector('#closeBtn').addEventListener('click', function() {
	            modal.style.display = 'none';
	        });
	
	        modal.setStyle({
	            position: 'fixed',
	            display: 'block',
	            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	            // 시꺼먼 레이어 보다 한칸 위에 보이기
	            zIndex: zIndex + 1,
	
	            // div center 정렬
	            top: '50%',
	            left: '50%',
	            transform: 'translate(-50%, -50%)',
	            msTransform: 'translate(-50%, -50%)',
	            webkitTransform: 'translate(-50%, -50%)'
	        });
	    }
	
	    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	    Element.prototype.setStyle = function(styles) {
	        for (var k in styles) this.style[k] = styles[k];
	        return this;
	    };
	    
	    document.getElementById('qa').addEventListener('click', function(){
	    	ModalF('qa_modal');
	    });
	    
	    document.getElementById('qa_btn').addEventListener('click', function(){
	    	if(${loginUser != null}){
		    	const qaTitle = document.getElementById('qaTitle').value;
		    	const qaContent = document.getElementById('qaContent').value;
		    	
		    	$.ajax({
		    		url: 'insertQA.me',
		    		data: {qaTitle:qaTitle, qaContent,qaContent},
		    		success: (data) => {
		    			document.getElementById('qa_modal').style.display = 'none';
		    			alert('문의 완료');
		    		},
		    		error: (data) => {
		    			console.log(data);
		    		}
		    	});
	    	} else{
	    		alert('로그인 후 이용해주세요');
	    	}
	    });
	</script>
</body>
</html>