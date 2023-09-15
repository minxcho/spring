<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"></jsp:include>
	  <h2>Spring MVC03</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
			<form action="">
			
				<input type="hidden" name="memPassword" id="memPassword" value="">
			
				<table style="text-align: center; border: 1px solid #dddddd" class="table table-bordered">
					<tr>
						<td style="width: 110px; vertical-align: middle;">아이디</td>
						<td><input type="text" name="memID" id="memID" class="form-control" maxlength="20" placeholder="아이디를 입력하세요."></td>						
						<td style="width: 110px;"><button type="button" onclick="registerCheck()" class="btn btn-sm btn-primary">중복확인</button></td>
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">비밀번호</td>
						<td colspan="2"><input onkeyup="passwordCheck()" type="password" name="memPassword1" id="memPassword1" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요."></td>						
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">비밀번호확인</td>
						<td colspan="2"><input onkeyup="passwordCheck()" type="password" name="memPassword2" id="memPassword2" class="form-control" maxlength="20" placeholder="비밀번호를 확인하세요."></td>						
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">사용자이름</td>
						<td colspan="2"><input type="text" name="memName" id="memName" class="form-control" maxlength="20" placeholder="이름을 입력하세요."></td>						
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">나이</td>
						<td colspan="2"><input type="number" name="memAge" id="memAge" class="form-control" maxlength="20" placeholder="나이를 입력하세요."></td>						
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">성별</td>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin: 0 auto;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" value="남자" id="memGender" name="memGender" autocomplete="off" checked="checked"> 남자
									</label>								
									<label class="btn btn-primary">
										<input type="radio" value="여자" id="memGender" name="memGender" autocomplete="off"> 여자
									</label>
								</div>
							</div> 
						</td>						
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">이메일</td>
						<td colspan="2"><input type="email" name="memEmail" id="memEmail" class="form-control" maxlength="20" placeholder="이메일을 입력하세요."></td>
					</tr>
					<tr>
						<td colspan="3">
							<span id="passMessage" style="color: red;"></span>
							<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록">
							<input type="reset" class="btn btn-primary btn-sm pull-right" value="취소">
						</td>
					</tr>
				</table>			
			</form>
	    </div>
	    <div class="panel-footer">스프링게시판 - 손민초</div>
	  </div>
	</div>

	<!-- Modal -->
     <div class="modal fade" id="myModal" role="dialog">
       <div class="modal-dialog">
       
         <!-- Modal content-->
         <div id="checkType" class="modal-content">
           <div class="modal-header panel-heading">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title">메세지 확인</h4>
           </div>
           <div class="modal-body">
             <p id="checkMessage"></p>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           </div>
         </div>
         
       </div>
     </div>

	<script type="text/javascript">
	   function registerCheck(){
	         var memID = $("#memID").val();
	         
	         $.ajax({
	            // 자바스크립트 안에서 자바코드는 사용 할 수 없지만
	            // 표현식은 사용가능하다!
	            // EL은 자바 언어가 아니다
	            url : "${contextPath}/registerCheck.do",
	            type : "get",
	            data : {"memID" : memID},
	            success : function(data){
	               // 중복유무 확인 -->(data=1 사용가능, data=0 사용불가능)
	               if(data == 1){
	                  $("#checkMessage").text("사용할 수 있는 아이디 입니다.");
	                  $("#checkType").attr("class", "modal-content panel-success");
	               }else{
	                  $("#checkMessage").text("사용할 수 없는 아이디 입니다.");
	                  $("#checkType").attr("class", "modal-content panel-warning");
	               }
	               
	               $("#myModal").modal("show");
	            },
	            error : function(){alert("error");}
	         });
	      }

		function passwordCheck() {
			
			var memPassword1 = $("#memPassword1").val();
			var memPassword2 = $("#memPassword2").val();
				
			if(memPassword1 != memPassword2) {
				$("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
			} else {
				$("#memPassword").val(memPassword1);
				$("#passMessage").html("");
			}
		}
	</script>
	
</body>
</html>


