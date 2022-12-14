$(document).ready(function () {

    // 삭제 모달
    const myModal = document.getElementById('exampleModal')
    const myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', (e) => {
        myInput.focus();
        let dataNo = $(e.relatedTarget).data('id');
        
        $('#deleteFunction').on("click", function() {
           location.href = dataNo;        
        });
    });

});
