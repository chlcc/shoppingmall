<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    
<tags:layout>
  <!-- /.intro section -->
        <div id="intro">
            <div class="container">
                   <table class="table table-striped table-hover">
                   <thead>
                    	<tr>
                    		<th width="5%;">No</th>
                    		<th width="70%;">Title</th>
                    		<th width="10%">Author</th>
                    		<th width="10%">Date</th>
                    		<th width="5%">View</th>
                    	</tr>
                   	</thead>
                   	<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>        
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>       
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>       
                   	</tbody>
                   </table>
			  <a href="/board/write" class="btn-default">Write</a>
              </div>	
         </div>
		 <hr>
		 <div class="text-center">
		 	<ul class="pagination">
		 	
		 		<li><a href="#">1</a></li>
		 		<li><a href="#">2</a></li>
		 		<li><a href="#">3</a></li>
		 		<li><a href="#">4</a></li>
		 		<li><a href="#">5</a></li>
		 	</ul>
		 </div>         
	
	<script src="//code.jquery.com/jquery.min.js"></script> 
	
	<script type="text/javascript">
	
	function getList(page) {

		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/board/list/" + page,
			method : 'get',
			contentType : 'json',
			success : function (data) {
				console.log(data);
			}			
		});
		
	}
	
	$(document).ready(function () {
		
		getList(1);
		
	});
	</script>


</tags:layout>