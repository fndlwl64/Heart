// comment 테이블 생성
function commentTable(boardNo, path) {
    $.ajax({
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        type: "post",
        url: path + "/user_comment_list",
        data : {
            board_no : boardNo
        },
        dataType : "json",
        success : function(commentList) {
            console.log(commentList);
            $("#comment-table tr:gt(0)").remove();
            let comment = "";
            console.log(commentList.length);
            for (let i=0; i<commentList.length; i++) {
                let deleteAddr = path + "/user_comment_delete?comment_commentno=" + commentList[i].comment_commentno;
                console.log("여기 들어오나 "+deleteAddr);
                comment += '<tr><td><a>' + commentList[i].comment_id + '</a></td>';
                comment += '<td>' + commentList[i].comment_content + '</td>';
                comment += '<td>' + commentList[i].comment_regdate + '</td>';
                comment += '<td><button type="button" class="btn btn-outline-danger btn-sm comment-delete" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id=deleteAddr> 삭제</button></td></tr>';
            }
            console.log(comment);
            $("#comment-table").append(comment);
        },
        error : function(e) {
            alert("Error : "+e.status);
        } 
    });
}

// comment 저장
function commentSave(userId, boardNo, path) {   
    $.ajax({
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        type: "post",
        url: path + "/user_comment_insert_ok",
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
                commentTable(boardNo, path)
            }else {
                alert('댓글 등록 실패')
            }
        },
        error : function(e) {
            alert("Error : "+e.status);
        }                   
    });          
};