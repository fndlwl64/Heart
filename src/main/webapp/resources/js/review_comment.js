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
          console.log(check);
          if(check > 0){
              commentTable(userId, reviewNo, path);
              commentCount(reviewNo, path);
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
function commentCount(reviewNo, path) {
  console.log(1, reviewNo);
  console.log(2, path);
  $.ajax({
      contentType : "application/x-www-form-urlencoded;charset=UTF-8",
      type: "post",
      url: path + "/review_comment_count",
      data : {
          review_no : reviewNo
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
          $("#comment-table tr:gt(0)").remove();
          let comment = "";
          console.log(commentList.length);
          for (let i=0; i<commentList.length; i++) {
              comment += '<tr><td><a>' + commentList[i].comment_id + '</a></td>';
              comment += '<td style=\"text-align:left\">' + commentList[i].comment_content + '</td>';
              comment += '<td><small>' + commentList[i].comment_regdate + '</small></td>';
              comment += '<td>';
              if(userId == 'admin') {
                   comment += '<button type=\"button\" class=\"btn btn-outline-danger btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteModal\" data-no='+commentList[i].comment_commentno+' data-path='+path+' data-user='+commentList[i].comment_id+' data-reviewno='+reviewNo+'>삭제</button>';
              }else {
                  if(userId == commentList[i].comment_id) {
                      comment += '<button type=\"button\" class=\"btn btn-outline-danger btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteModal\" data-no='+commentList[i].comment_commentno+' data-path='+path+' data-user='+commentList[i].comment_id+' data-reviewno='+reviewNo+'>삭제</button>';
                  }
              }
              comment += '</td></tr>';
          }
          $("#comment-table tbody").append(comment);
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
              alert('댓글 등록 실패')
          }
      },
      error : function(e) {
          alert("Error : "+e.status);
      }                   
  });          
};