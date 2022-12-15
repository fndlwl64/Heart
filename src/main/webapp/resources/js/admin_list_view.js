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

});
