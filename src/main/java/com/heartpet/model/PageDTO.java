package com.heartpet.model;

import lombok.Data;

@Data
public class PageDTO {

    // 페이징 처리 관련 멤버 선언
    private int page;           // 현재 페이지
    private int rowsize;        // 한 페이지당 보여질 게시물의 수
    private int totalRecord;    // 전체 게시물의 수
    private int startNo;        // 해당 페이지에서 시작 글 번호
    private int endNo;          // 해당 페이지에서 끝 글 번호
    private int startBlock;     // 해당 페이지의 시작 블럭
    private int endBlock;       // 해당 페이지의 끝 블럭
    private int allPage;        // 전체 페이지 수
    private int block = 3;      // 아래에 보여질 최대 페이지 수

    // 검색 관련 멤버 선언
    private String field;
    private String keyword;

    // 기본 생성자
    public PageDTO() {
    }

    // 검색 페이징 처리 인자 생성자
    public PageDTO(int page, int rowsize, int totalRecord, String field, String keyword) {

        this.page = page;
        this.rowsize = rowsize;
        this.totalRecord = totalRecord;
        this.field = field;
        this.keyword = keyword;

        // 해당 페이지에서 시작 글 번호
        this.startNo = (this.page * this.rowsize) - (this.rowsize - 1);

        // 해당 페이지에서 끝 글 번호
        this.endNo = (this.page * this.rowsize);

        // 해당 페이지에서 시작 블럭
        this.startBlock = (((this.page - 1) / block) * block) + 1;

        // 해당 페이지에서 끝 블럭
        this.endBlock = (((this.page - 1) / block) * block) + block;

        // 전체 페이지 수 얻어오는 과정
        this.allPage = (int) Math.ceil(this.totalRecord / (double) this.rowsize);
        if (this.endBlock > this.allPage)
            this.endBlock = this.allPage;
    }
    
    // 검색 페이징 처리 인자 생성자
    public PageDTO(int page, int rowsize, int totalRecord) {

        this.page = page;
        this.rowsize = rowsize;
        this.totalRecord = totalRecord;

        // 해당 페이지에서 시작 글 번호
        this.startNo = (this.page * this.rowsize) - (this.rowsize - 1);

        // 해당 페이지에서 끝 글 번호
        this.endNo = (this.page * this.rowsize);

        // 해당 페이지에서 시작 블럭
        this.startBlock = (((this.page - 1) / block) * block) + 1;

        // 해당 페이지에서 끝 블럭
        this.endBlock = (((this.page - 1) / block) * block) + block;

        // 전체 페이지 수 얻어오는 과정
        this.allPage = (int) Math.ceil(this.totalRecord / (double) this.rowsize);
        if (this.endBlock > this.allPage)
            this.endBlock = this.allPage;
    }


}
