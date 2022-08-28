package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewTotal;

public class ModelReviewList {
	public ModelReviewList() {
		// TODO Auto-generated constructor stub
	}
	
	public String getReviewList(ArrayList<DTOReviewBoard> lists) {
		
		String model= "";
		for(DTOReviewBoard list : lists) {
			model+= "<tr>";
			model+= "<td><i class='fab fa-angular fa-lg text-danger me-2'></i>";
			if(list.getWgap().equals("0")) {
				model+= "<span class='badge bg-info rounded-pill'>New</span>&nbsp;&nbsp;";
			} else {
				model+= "<span class='badge bg-info rounded-pill' style='visibility: hidden;'>New</span>&nbsp;&nbsp;";
			}
			model+= "<a href='./review_view.do?seq=" + list.getSeq() + "' style='color: gray'> <strong>[책 리뷰]&nbsp;&nbsp;</strong>" + list.getSubject() + "</a> &nbsp;&nbsp;";
			model+= "<span class='badge rounded-pill badge-center h-px-20 w-px-20 bg-danger'>" + list.getCmt_cnt() + "</span>";
			model+= "</td>";
			model+= "<td>";
			model+= "<ul class='list-unstyled users-list m-0 d-flex align-items-center'>";
			model+= "<div data-bs-toggle='tooltip' data-bs-placement='top' style='margin: auto; text-align: center;' data-bs-html='true' title=\"<img src='" + list.getBook_img_url() + "' />\">";
			model+= list.getBook_title() + "</div>";
			model+= "</ul>";
			model+= "</td>";
			model+= "<td style='margin: auto; text-align: center;'>";
			model+= "<button type='button' class='btn rounded-pill btn-outline-primary'>" + list.getHash_tag() + "</button>";
			model+= "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getHit() + "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getUser_name() + "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getWdate() + "</td>";
			model+= "</tr>";
		}
		
		return model;
	}
	
	public String myReviewList(ArrayList<DTOReviewBoard> myreviewLists) {
		
		String model= "";
		for(DTOReviewBoard list : myreviewLists) {
			model+= "<tr>";
			model+= "<td><i class='fab fa-angular fa-lg text-danger me-2'></i>";
			if(list.getWgap().equals("0")) {
				model+= "<span class='badge bg-info rounded-pill'>New</span>&nbsp;&nbsp;";
			} else {
				model+= "<span class='badge bg-info rounded-pill' style='visibility: hidden;'>New</span>&nbsp;&nbsp;";
			}
			model+= "<a href='./review_view.do?seq=" + list.getSeq() + "' style='color: gray'> <strong>[책 리뷰]&nbsp;&nbsp;</strong>" + list.getSubject() + "</a> &nbsp;&nbsp;";
			model+= "<span class='badge rounded-pill badge-center h-px-20 w-px-20 bg-danger'>" + list.getCmt_cnt() + "</span>";
			model+= "</td>";
			model+= "<td>";
			model+= "<ul class='list-unstyled users-list m-0 d-flex align-items-center'>";
			model+= "<div data-bs-toggle='tooltip' data-bs-placement='top' style='margin: auto; text-align: center;' data-bs-html='true' title=\"<img src='" + list.getBook_img_url() + "' />\">";
			model+= list.getBook_title() + "</div>";
			model+= "</ul>";
			model+= "</td>";
			model+= "<td style='margin: auto; text-align: center;'>";
			model+= "<button type='button' class='btn rounded-pill btn-outline-primary'>" + list.getHash_tag() + "</button>";
			model+= "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getHit() + "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getUser_name() + "</td>";
			model+= "<td style='margin: auto; text-align: center;'>" + list.getWdate() + "</td>";
			model+= "</tr>";
		}
		
		return model;
	}
}
