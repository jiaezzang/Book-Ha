package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTO_Album_Board;

@Mapper
@Repository
public interface Mapper_Album {
	// Board
	ArrayList<DTO_Album_Board> album_list();
	
	int album_write(DTO_Album_Board dto);
	
	int album_delete(int al_seq);
	
	int album_modify(DTO_Album_Board dto);

}
	