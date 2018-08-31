<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>


<script src="/resources/js/swiper.min.js"></script>
<style>

.swiper-container {
    width: 100%;  
    height: 600px;
}

.underline {
	border-bottom: 1.5px solid #bbb;
}

.content {
	padding: 0 50px 0 50px;;
}


</style>




<tags:layout>
        <div id="intro">
            <div class="container">
                <div class="row">
                <table style="width: 100%; height: 500px;">
                	<tr>
                		<td width="40%" align="center">
                			<img src="${goods.imageUrl}" style="width: 400px; height: 600px;">
                		</td>
                		<td align="center">
               				<input type="hidden" id="gno" value="${goods.gno}">
                			<table style="width: 80%; height: 100%;" > 
                				<tr>
                					<td height="60px;" width="50%" style="font-size: 40px;" colspan="2">
                						<span class="underline">${goods.name}</span> 
                					</td>
                				</tr>
                				<tr>
                					<td height="5%" width="50%">
                						판매가 :
                					</td>
                					<td>
                						<span id="price">${goods.price}</span>원
                					</td>
                				</tr>
                				<tr>
                					<td height="5%" width="50%">
                						색상 :
                					</td>
                					<td>
                						${goods.goodsInfo.color}
                					</td>
                				</tr>
                				<tr>
                					<td height="5%" width="50%">
                						수량 :
                					</td>
                					<td>
                						<input id="count" type="number" class="count form-control" value="1" min="1"
                						max="${goods.goodsInfo.count}" onchange="numberChange(this)"/>
                					</td>
                				</tr>
                				<tr>
                					<td height="15%" width="50%" style="font-weight: bold; font-size: 20px;">
                						총구매가 : 
                					</td>
                					<td id="totalPrice" height="15%" width="50%" style="font-weight: bold; font-size: 20px;">
                						${goods.price}원
                					</td>
                				</tr>
               					<tr>
			         				<td height="15%" width="50%" style="font-weight: bold; font-size: 20px;">
			         					<a id="addCart" href="#" class="btn-default">Cart</a>
			         				</td>
			         				<td height="15%" width="50%" style="font-weight: bold; font-size: 20px;">
			         					<a href="#" class="btn-default">Buy</a>
			         				</td>
			       				</tr>
                			</table>
                		</td>
                	</tr>
                </table>
                 
                <hr/>
                
                <div class="content">
                	${goods.content}
                </div>
                
				</div>
            </div>
        </div>
         
        
 <div class="modal fade" id="loginPopup" tabindex="-1" role="dialog" aria-labelledby="deleteCheckModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<h4 class="modal-title"></h4>
      	<hr> 
      	로그인 하시겠습니까?
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/login'">OK</button> 
      </div> 
    </div>
  </div>
</div>

 <div class="modal fade" id="cartCheck" tabindex="-1" role="dialog" aria-labelledby="deleteCheckModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<h4 class="modal-title"></h4>
      	<hr> 
      	장바구니에 등록되었습니다. 확인하시겠습니까?
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/user/mypage/tab2'">OK</button> 
      </div> 
    </div>
  </div>
</div>
        
        
	<script type="text/javascript">
		 
		 
		function numberChange(element) {
			var value = parseInt(element.value);
			if(value < 1) {
				element.value = 1;
			} 
			if(element.max < value) {
				element.value = element.max;
			}
			
		 	var price = uncomma($("#price").text()) * element.value;
		 	$("#totalPrice").text(comma(price) + "원");
		} 
		
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		function uncomma(str) {
		    str = String(str); 
		    return str.replace(/[^\d]+/g, '');
		}
		
		$("#addCart").click(function () {
			var cart = {};
			cart.count = $("#count").val();
			cart.gno = $("#gno").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/cart",
				method : "post",
				contentType : 'application/json;charset=utf-8',
				dataType :'json',
				data : JSON.stringify(cart),
				success : function (data) {
					
					console.log(data);
					if(data.result == "failed") {
						$("#loginPopup").modal("show");
						return;
					}else {
						$("#cartCheck").modal("show");
					}
				},
				error : function (data) {
					console.log(data);
				}
			});
			
		});
		
		  
	</script>
</tags:layout>