package com.bookha.main.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bookha.main.vo.UserVo;


@Mapper
public interface UserMapper {
    void saveUser(UserVo userVo); // 회원가입

    UserVo getUserAccount(String userId); // 로그인
}
