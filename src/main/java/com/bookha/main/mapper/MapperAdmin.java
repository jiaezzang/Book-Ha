package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOAdminBoard;
import com.bookha.main.dto.DTOAdminTotal;
import com.bookha.main.dto.DTOAttendance;

@Mapper
@Repository
public interface MapperAdmin {
	
	ArrayList<DTOAdminBoard> list(DTOAdminTotal dto);
	
	int countBoard();
	
	DTOAdminBoard view(int seq);
	
	DTOAdminBoard viewBefore(int rowno);
	
	DTOAdminBoard viewAfter(int rowno);
	
	int writeOk(DTOAdminBoard to);
	
	DTOAdminBoard modify(int seq);
	
	int modifyOk(DTOAdminBoard to);
	
	int deleteOk(DTOAdminBoard to);
	
	ArrayList<DTOAdminBoard> nolist(DTOAdminBoard to);
	
	// chart
	ArrayList<DTOAttendance> countDaily(DTOAttendance cto);
	
	ArrayList<DTOAttendance> countWeekly(DTOAttendance cto);
	
	ArrayList<DTOAttendance> countMonthly(DTOAttendance cto);
}
