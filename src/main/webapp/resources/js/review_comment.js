// 삭제 모달
$(function() {
    const deleteModal = document.getElementById('deleteCommentModal')
    const deleteInput = document.getElementById('deleteCommentInput')

    deleteModal.addEventListener('shown.bs.modal', (e) => {
        deleteInput.focus();
        let commentNo = $(e.relatedTarget).data('no');
        let path = $(e.relatedTarget).data('path');
        let userId = $(e.relatedTarget).data('user');
        let reviewNo = $(e.relatedTarget).data('reviewno');
        
        $('#deleteCommentFunction').on("click", function() {
            commentDelete(commentNo, path, userId, reviewNo);
        });
    });
});

//comment delete
function commentDelete(commentNo, path, userId, reviewNo) {  
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/review_comment_delete?comment_commentno=" + commentNo,
      data : {
          comment_commentno : commentNo
      },
      dataType : "text",
      success : function(check) {
          if(check > 0){
              commentTable(userId, reviewNo, path);
              commentCount(reviewNo, path);
              $('#deleteCommentModal').modal('hide');
              $('.modal-backdrop').hide();
          }
      },
      error : function(e) {
          alert("Error : "+e.status);
      } 
  });
}

//comment 수 count
function commentCount(reviewNo, path) {
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/review_comment_count",
      data : {
          review_no : reviewNo
      },
      dataType : "text",
      success : function(commentCount) {
          $("#comment-count").text(commentCount);
      },
      error : function(e) {
          alert("Error : "+e.status);
      } 
  });
}

//comment 테이블 생성
function commentTable(userId, reviewNo, path) {
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/review_comment_list",
      data : {
          review_no : reviewNo
      },
      dataType : "json",
      beforeSend: function(xhr, settings){
          let aloading = "<tr class=\"comment-loading\"><td colspan=\"4\"><img src=\"resources/loading/Loading.gif\" style=\"padding: 50px 0;\" /></td></tr>";
          $("#comment-table tbody").append(aloading);
      },
      success : function(commentList) {
      
          $("#comment-table caption").remove();      
          $("#comment-table thead").remove();
          $("#comment-table tbody").remove();
          let comment = "";
          if(commentList.length > 0) {
              comment += '<caption>등록된 댓글</caption>';
              comment += '<thead><tr>';
              comment += '<th class="col-1">작성자</th>';
              comment += '<th class="col-8">댓글내용</th>';
              comment += '<th class="col-2">작성시간</th>';
              comment += '<th class="col-1">삭제</th>';
              comment += '</tr></thead><tbody>';
              for (let i=0; i<commentList.length; i++) {
                  if(commentList[i].comment_id.includes('admin')) {                  
                    comment += '<tr><td style=\"vertical-align:middle; color:red;\"><a>' + commentList[i].comment_id + '</a></td>';
                  }else {
                    comment += '<tr><td style=\"vertical-align:middle;\"><a>' + commentList[i].comment_id + '</a></td>';
                  }  
                  comment += '<td class=\"comment-content\"><div style=\"min-height:2rem\">' + commentList[i].comment_content + '</div></td>';
                  comment += '<td><small>' + commentList[i].comment_regdate + '</small></td>';
                  comment += '<td style=\"vertical-align:middle;\">';
                  if(userId.includes('admin')) {
                       comment += '<button type=\"button\" class=\"btn btn-outline-danger btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteCommentModal\" data-no='+commentList[i].comment_commentno+' data-path='+path+' data-user='+commentList[i].comment_id+' data-reviewno='+reviewNo+'>삭제</button>';
                  }else {
                      if(userId == commentList[i].comment_id) {
                          comment += '<button type=\"button\" class=\"btn btn-outline-danger btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteCommentModal\" data-no='+commentList[i].comment_commentno+' data-path='+path+' data-user='+commentList[i].comment_id+' data-reviewno='+reviewNo+'>삭제</button>';
                      }
                  }
                  comment += '</td></tr>';
              }
              comment += '</tbody>';
              $("#comment-table").append(comment);
          }
      },
      error : function(e) {
          alert("Error : "+e.status);
      } 
  });
}

//comment 저장
function commentSave(userId, reviewNo, path) {   
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/review_comment_insert_ok",
      data : {
          user_id : userId,
          review_no : reviewNo,
          comment_content : $("#comment_content").val()
      },
      dataType : "text",
      success : function(check) {
          console.log(check);   
          if(check > 0){
              alert('댓글이 성공적으로 등록되었습니다.');            
              commentTable(userId, reviewNo, path);
              commentCount(reviewNo, path);
              $("#comment_content").val('');
          }else {
              alert('댓글 등록 실패');
          }
      },
      error : function(e) {
          alert("Error : "+e.status);
      }                   
  });          
};