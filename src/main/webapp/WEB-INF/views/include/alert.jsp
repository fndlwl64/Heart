<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
    var msg = "<c:out value='${msg}'/>";
    var url = "<c:out value='${url}'/>";
    /* alert(msg);
    location.href = url; */
    $(document).ready(function() {
    	$(".modal-body-cancel").append(msg);
    	$("#cautionModal").modal("show");
    	
    	const cautionModal = document.getElementById('cautionModal')
        const cautionInput = document.getElementById('cautionInput')

        cautionModal.addEventListener('shown.bs.modal', (e) => {
        	cautionInput.focus();
            $('#cautionFunction').on("click", function() {
              	if(url === 'back'){
              		history.back();
              	}else{
              		location.href = url;
              	}
            });
        });
    });
    


</script>
</head>
<body>
<div class="modal fade" id="cautionModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div id="cautionInput" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="cautionModalLabel">Caution</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body modal-body-cancel"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal"  id="cautionFunction">Close</button>
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>