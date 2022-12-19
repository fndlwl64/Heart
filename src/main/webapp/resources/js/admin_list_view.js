$(document).ready(function () {

    // 삭제 모달
    const deleteModal = document.getElementById('deleteModal')
    const deleteInput = document.getElementById('deleteInput')

    deleteModal.addEventListener('shown.bs.modal', (e) => {
        deleteInput.focus();
        let dataNo = $(e.relatedTarget).data('id');
        
        $('#deleteFunction').on("click", function() {
           location.href = dataNo;        
        });
    });
	
	$("#fieldSelect").change(function() {
		
		var selected = $("#fieldSelect").val();
		
		if(selected === "grade") {
			$("#gradeSearch").css({
				'display' : 'block'
			});
			$("#keywordSearch").css({
				'display' : 'none'
			});
			$("#expSearch").css({
				'display' : 'none'
			});
		}else if(selected === "animalexp") {
			$("#gradeSearch").css({
				'display' : 'none'
			});
			$("#keywordSearch").css({
				'display' : 'none'
			});
			$("#expSearch").css({
				'display' : 'block'
			});
		}else {
			$("#gradeSearch").css({
				'display' : 'none'
			});
			$("#keywordSearch").css({
				'display' : 'block'
			});
			$("#expSearch").css({
				'display' : 'none'
			});
		}
	});
	
	
});
