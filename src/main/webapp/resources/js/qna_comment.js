//comment delete
function commentDelete(commentNo, path, userId, boardNo) {  
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/qna_comment_delete?comment_commentno=" + commentNo,
      data : {
          comment_commentno : commentNo
      },
      dataType : "text",
      success : function(check) {
          console.log(check);
          if(check > 0){
              commentTable(userId, boardNo, path);
              commentCount(boardNo, path);
              $('#deleteModal').modal('hide');
              $('.modal-backdrop').hide();
          }
      },
      error : function(e) {
          alert("Error : "+e.status);
      } 
  });
}

//comment 수 count
function commentCount(boardNo, path) {
  console.log(1, boardNo);
  console.log(2, path);
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/qna_comment_count",
      data : {
          board_no : boardNo
      },
      dataType : "text",
      success : function(commentCount) {
          console.log(commentCount);
          $("#comment-count").text(commentCount);
      },
      error : function(e) {
          alert("Error : "+e.status);
      } 
  });
}

//comment 테이블 생성
function commentTable(userId, boardNo, path) {
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/qna_comment_list",
      data : {
          board_no : boardNo
      },
      dataType : "json",
      beforeSend: function(xhr, settings){
          let aloading = "<tr class=\"comment-loading\"><td colspan=\"4\"><img src=\"resources/loading/Loading.gif\" style=\"padding: 50px 0;\" /></td></tr>";
          $("#comment-table tbody").append(aloading);
      },
      success : function(commentList) {
          $("#comment-table thead").remove();
          $("#comment-table tbody").remove();
          let comment = "";
          if(commentList.length > 0) {
              comment += '<thead><tr>';
              comment += '<th class="col-1">작성자</th>';
              comment += '<th class="col-5">댓글내용</th>';
              comment += '<th class="col-1">작성시간</th>';
              comment += '<th class="col-1">삭제</th>';
              comment += '</tr></thead><tbody>';
              console.log(commentList.length);
              for (let i=0; i<commentList.length; i++) {
                  comment += '<tr><td><a>' + commentList[i].comment_id + '</a></td>';
                  comment += '<td style=\"text-align:left\">' + commentList[i].comment_content + '</td>';
                  comment += '<td><small>' + commentList[i].comment_regdate + '</small></td>';
                  comment += '<td>';
                  if(userId == 'admin') {
                       comment += '<button type=\"button\" class=\"btn btn-outline-danger btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteModal\" data-no='+commentList[i].comment_commentno+' data-path='+path+' data-user='+commentList[i].comment_id+' data-boardno='+boardNo+'>삭제</button>';
                  }else {
                      if(userId == commentList[i].comment_id) {
                          comment += '<button type=\"button\" class=\"btn btn-outline-danger btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteModal\" data-no='+commentList[i].comment_commentno+' data-path='+path+' data-user='+commentList[i].comment_id+' data-boardno='+boardNo+'>삭제</button>';
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
function commentSave(userId, boardNo, path) {   
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/qna_comment_insert_ok",
      data : {
          user_id : userId,
          board_no : boardNo,
          comment_content : $("#comment_content").val()
      },
      dataType : "text",
      success : function(check) {
          console.log(check);   
          if(check > 0){
              alert('댓글이 성공적으로 등록되었습니다.');            
              commentTable(userId, boardNo, path);
              commentCount(boardNo, path);
              $("#comment_content").val('');
          }else {
              alert('댓글 등록 실패')
          }
      },
      error : function(e) {
          alert("Error : "+e.status);
      }                   
  });          
};