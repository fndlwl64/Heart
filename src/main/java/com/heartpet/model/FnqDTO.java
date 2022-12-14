package com.heartpet.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class FnqDTO {

    private int fnq_no;
    private String fnq_category;

    @NotBlank(message = "question")
    private String fnq_question;

    @NotBlank(message = "answer")
    private String fnq_answer;

}
