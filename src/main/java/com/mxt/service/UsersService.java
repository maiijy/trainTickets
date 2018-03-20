package com.mxt.service;

import com.mxt.dao.UsersMapper;
import com.mxt.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UsersService {
    @Autowired
    private UsersMapper usersMapper;

    public int insert(Users Users) {
        return usersMapper.insertSelective(Users);
    }

    public int deleteByPrimaryKey(Integer UsersId){
        return usersMapper.deleteByPrimaryKey(UsersId);
    }

    Users selectByPrimaryKey(Integer UsersId){
        return usersMapper.selectByPrimaryKey(UsersId);
    }

    public int updateByPrimaryKeySelective(Users record){
        return usersMapper.updateByPrimaryKeySelective(record);
    }

    int updateByPrimaryKey(Users record){
        return usersMapper.updateByPrimaryKey(record);
    }

    public int getCount(){
        return usersMapper.getCount();
    }

    public ArrayList<Users> selectSelective(Users record){
        return usersMapper.selectSelective(record);
    }


    public ArrayList<Users> selectUsersByNum(@Param("num")int num, @Param("rows")int rows){
        return usersMapper.selectUsersByNum(num, rows);
    }
}
