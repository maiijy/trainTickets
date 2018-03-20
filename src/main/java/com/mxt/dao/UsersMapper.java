package com.mxt.dao;

import com.mxt.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface UsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

    int getCount();

    ArrayList<Users> selectSelective(Users record);

    ArrayList<Users> selectUsersByNum(@Param("num")int num, @Param("rows")int rows);
}