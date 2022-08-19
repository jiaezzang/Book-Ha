package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOUser;

public class ModelMyAchievements {
	public ModelMyAchievements() {
		
	}
	
	public String getAchieveStart() {
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append("<div class='card h-100'>");
		sbHtml.append("<div class='card-body' style='height:220px; display:flex; justify-content:space-around; align-items:center;'>");
		sbHtml.append("<div class='rankingtitle' style='display:inline-block;' >");


		return sbHtml.toString();
	}
	public String getAchieveAttendance(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append(getAchieveStart());
		sbHtml.append("<h5>출석왕</h5>");
		sbHtml.append("</div>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center;' >");
			sbHtml.append("<div>");
			sbHtml.append("<img class='mb-sm-0 mb-2 h-auto' src='../assets/img/achievements/");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("none");
				} else {
					sbHtml.append("flower_1");
				}
			} else if(index == 2) {
				if(count < 20) {
					sbHtml.append("none");
				} else {
					sbHtml.append("flower_2");
				}
			} else if(index == 3) {
				if(count < 50) {
					sbHtml.append("none");
				} else {
					sbHtml.append("flower_3");
				}
			} else if(index == 4) {
				if(count < 100) {
					sbHtml.append("none");
				} else {
					sbHtml.append("flower_4");
				}
			} else if(index == 5) {
				if(count < 200) {
					sbHtml.append("none");
				} else {
					sbHtml.append("flower_5");
				}
			}
			sbHtml.append(".png' style='width:110px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append( count + "/1");
				} else {
					sbHtml.append( 1 + "/1");
				}
			} else if(index == 2) {
				if(count < 20) {
					sbHtml.append( count + "/20");
				} else {
					sbHtml.append( 20 + "/20");
				}
			} else if(index == 3) {
				if(count < 50) {
					sbHtml.append( count + "/50");
				} else {
					sbHtml.append( 50 + "/50");
				}
			} else if(index == 4) {
				if(count < 100) {
					sbHtml.append( count + "/100");
				} else {
					sbHtml.append( 100 + "/100");
				}
			} else if(index == 5) {
				if(count < 200) {
					sbHtml.append( count + "/200");
				} else {
					sbHtml.append( 200 + "/200");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append(getAchieveEnd());
		
		return sbHtml.toString();
	}
	
	public String getAchieveReview(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append(getAchieveStart());
		sbHtml.append("<h5>리뷰왕</h5>");
		sbHtml.append("</div>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center;' >");
			sbHtml.append("<div>");
			sbHtml.append("<img class='mb-sm-0 mb-2 h-auto' src='../assets/img/achievements/");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("none");
				} else {
					sbHtml.append("animal_1");
				}
			} else if(index == 2) {
				if(count < 5) {
					sbHtml.append("none");
				} else {
					sbHtml.append("animal_2");
				}
			} else if(index == 3) {
				if(count < 10) {
					sbHtml.append("none");
				} else {
					sbHtml.append("animal_3");
				}
			} else if(index == 4) {
				if(count < 20) {
					sbHtml.append("none");
				} else {
					sbHtml.append("animal_4");
				}
			} else if(index == 5) {
				if(count < 50) {
					sbHtml.append("none");
				} else {
					sbHtml.append("animal_5");
				}
			}
			sbHtml.append(".png' style='width:110px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append( count + "/1");
				} else {
					sbHtml.append( 1 + "/1");
				}
			} else if(index == 2) {
				if(count < 5) {
					sbHtml.append( count + "/5");
				} else {
					sbHtml.append( 5 + "/5");
				}
			} else if(index == 3) {
				if(count < 10) {
					sbHtml.append( count + "/10");
				} else {
					sbHtml.append( 10 + "/10");
				}
			} else if(index == 4) {
				if(count < 20) {
					sbHtml.append( count + "/20");
				} else {
					sbHtml.append( 20 + "/20");
				}
			} else if(index == 5) {
				if(count < 50) {
					sbHtml.append( count + "/50");
				} else {
					sbHtml.append( 50 + "/50");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append(getAchieveEnd());
		
		return sbHtml.toString();
	}
	
	public String getAchieveAlbum(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append(getAchieveStart());
		sbHtml.append("<h5>인증왕</h5>");
		sbHtml.append("</div>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center;' >");
			sbHtml.append("<div>");
			sbHtml.append("<img class='mb-sm-0 mb-2 h-auto' src='../assets/img/achievements/");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("none");
				} else {
					sbHtml.append("food_1");
				}
			} else if(index == 2) {
				if(count < 10) {
					sbHtml.append("none");
				} else {
					sbHtml.append("food_2");
				}
			} else if(index == 3) {
				if(count < 20) {
					sbHtml.append("none");
				} else {
					sbHtml.append("food_3");
				}
			} else if(index == 4) {
				if(count < 50) {
					sbHtml.append("none");
				} else {
					sbHtml.append("food_4");
				}
			} else if(index == 5) {
				if(count < 100) {
					sbHtml.append("none");
				} else {
					sbHtml.append("food_5");
				}
			}
			sbHtml.append(".png' style='width:110px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append( count + "/1");
				} else {
					sbHtml.append( 1 + "/1");
				}
			} else if(index == 2) {
				if(count < 10) {
					sbHtml.append( count + "/10");
				} else {
					sbHtml.append( 10 + "/10");
				}
			} else if(index == 3) {
				if(count < 20) {
					sbHtml.append( count + "/20");
				} else {
					sbHtml.append( 20 + "/20");
				}
			} else if(index == 4) {
				if(count < 50) {
					sbHtml.append( count + "/50");
				} else {
					sbHtml.append( 50 + "/50");
				}
			} else if(index == 5) {
				if(count < 100) {
					sbHtml.append( count + "/100");
				} else {
					sbHtml.append( 100 + "/100");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append(getAchieveEnd());
		
		return sbHtml.toString();
	}
	
	public String getAchieveShare(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append(getAchieveStart());
		sbHtml.append("<h5>공유왕</h5>");
		sbHtml.append("</div>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center;' >");
			sbHtml.append("<div>");
			sbHtml.append("<img class='mb-sm-0 mb-2 h-auto' src='../assets/img/achievements/");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("none");
				} else {
					sbHtml.append("fruit_1");
				}
			} else if(index == 2) {
				if(count < 5) {
					sbHtml.append("none");
				} else {
					sbHtml.append("fruit_2");
				}
			} else if(index == 3) {
				if(count < 10) {
					sbHtml.append("none");
				} else {
					sbHtml.append("fruit_3");
				}
			} else if(index == 4) {
				if(count < 20) {
					sbHtml.append("none");
				} else {
					sbHtml.append("fruit_4");
				}
			} else if(index == 5) {
				if(count < 50) {
					sbHtml.append("none");
				} else {
					sbHtml.append("fruit_5");
				}
			}
			sbHtml.append(".png' style='width:110px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append( count + "/1");
				} else {
					sbHtml.append( 1 + "/1");
				}
			} else if(index == 2) {
				if(count < 5) {
					sbHtml.append( count + "/5");
				} else {
					sbHtml.append( 5 + "/5");
				}
			} else if(index == 3) {
				if(count < 50) {
					sbHtml.append( count + "/10");
				} else {
					sbHtml.append( 10 + "/10");
				}
			} else if(index == 4) {
				if(count < 20) {
					sbHtml.append( count + "/20");
				} else {
					sbHtml.append( 20 + "/20");
				}
			} else if(index == 5) {
				if(count < 50) {
					sbHtml.append( count + "/50");
				} else {
					sbHtml.append( 50 + "/50");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append(getAchieveEnd());
		
		return sbHtml.toString();
	}
	
	public String getAchieveEnd() {
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append("</div>");
		sbHtml.append("</div><br />");
		
		return sbHtml.toString();
	}
	
	
	
}
