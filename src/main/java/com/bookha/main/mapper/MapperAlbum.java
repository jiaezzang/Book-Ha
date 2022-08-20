package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAlbumTotal;

@Mapper
@Repository
public interface MapperAlbum {
	// Board
	ArrayList<DTOAlbumBoard> albumList(DTOAlbumTotal dto);
	
	int albumWrite(DTOAlbumBoard dto);
	
	int albumDelete(int al_seq);
	
	int albumModify(DTOAlbumBoard dto);
	
	int countBoard();

}
	