package com.bookha.model;


public class ModelChangeProfile {
	public ModelChangeProfile() {
		
	}
	
	public String getAchieveStart() {
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append("<div class='card h-100' style='flex-direction: column;'>");
		sbHtml.append("<div class='card-body'>");


		return sbHtml.toString();
	}
	public String getAchieveAttendance(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<div style='display:flex; justify-content:space-around; align-items:center;'>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center; justify-content:space-around;' >");
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
			sbHtml.append(".png' style='width:80px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='flower_1.png'>");
				}
			} else if(index == 2) {
				if(count < 20) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='flower_2.png'>");
				}
			} else if(index == 3) {
				if(count < 50) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='flower_3.png'>");
				}
			} else if(index == 4) {
				if(count < 100) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='flower_4.png'>");
				}
			} else if(index == 5) {
				if(count < 200) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='flower_5.png'>");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append("</div>");
		
		return sbHtml.toString();
	}
	
	public String getAchieveReview(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<div style='display:flex; justify-content:space-around; align-items:center;'>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center; justify-content:space-around;' >");
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
			sbHtml.append(".png' style='width:80px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='animal_1.png'>");
				}
			} else if(index == 2) {
				if(count < 5) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='animal_2.png'>");
				}
			} else if(index == 3) {
				if(count < 10) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='animal_3.png'>");
				}
			} else if(index == 4) {
				if(count < 20) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='animal_4.png'>");
				}
			} else if(index == 5) {
				if(count < 50) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='animal_5.png'>");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append("</div>");
		
		return sbHtml.toString();
	}
	
	public String getAchieveAlbum(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<div style='display:flex; justify-content:space-around; align-items:center;'>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center; justify-content:space-around;' >");
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
			sbHtml.append(".png' style='width:80px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='food_1.png'>");
				}
			} else if(index == 2) {
				if(count < 10) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='food_2.png'>");
				}
			} else if(index == 3) {
				if(count < 20) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='food_3.png'>");
				}
			} else if(index == 4) {
				if(count < 50) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='food_4.png'>");
				}
			} else if(index == 5) {
				if(count < 100) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='food_5.png'>");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append("</div>");
		
		return sbHtml.toString();
	}
	
	public String getAchieveShare(int count) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<div style='display:flex; justify-content:space-around; align-items:center;'>");
		
		for(int index = 1; index<=5; index++){
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center; justify-content:space-around;' >");
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
			sbHtml.append(".png' style='width:80px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>");
			if(index == 1) {
				if(count < 1) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='fruit_1.png'>");
				}
			} else if(index == 2) {
				if(count < 5) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='fruit_2.png'>");
				}
			} else if(index == 3) {
				if(count < 10) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='fruit_3.png'>");
				}
			} else if(index == 4) {
				if(count < 20) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='fruit_4.png'>");
				}
			} else if(index == 5) {
				if(count < 50) {
					sbHtml.append("<input type='radio' name='profile' disabled>");
				} else {
					sbHtml.append("<input type='radio' name='profile' value='fruit_5.png'>");
				}
			}
			sbHtml.append("</P>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append("</div>");
		return sbHtml.toString();
	}
	
	public String getAchieveEnd() {
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append("</div>");
		sbHtml.append("</div><br />");
		
		return sbHtml.toString();
	}
	
	
	
}
