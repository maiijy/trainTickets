package com.mxt.service;

import com.mxt.dao.MotorVehicleMapper;
import com.mxt.entity.MotorVehicle;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MotorVehicleService {
    @Autowired
    MotorVehicleMapper motorVehicleMapper;

    public int deleteByPrimaryKey(Integer motorId){
        return motorVehicleMapper.deleteByPrimaryKey(motorId);
    }

    public int insert(MotorVehicle record){
        return motorVehicleMapper.insert(record);
    }

    public int insertSelective(MotorVehicle record){
        return motorVehicleMapper.insertSelective(record);
    }

    public MotorVehicle selectByPrimaryKey(Integer motorId){
        return motorVehicleMapper.selectByPrimaryKey(motorId);
    }

    public int updateByPrimaryKeySelective(MotorVehicle record){
        return motorVehicleMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(MotorVehicle record){
        return motorVehicleMapper.updateByPrimaryKey(record);
    }

    public ArrayList<MotorVehicle> selectAll(){
        return motorVehicleMapper.selectAll();
    }

    public ArrayList<MotorVehicle> selectByStartAndEnd(String startName,String endName){
        return motorVehicleMapper.selectByStartAndEnd(startName, endName);
    }

    public ArrayList<MotorVehicle> selectMotorsByNum(@Param("num")int num , @Param("rows")int rows){
        return motorVehicleMapper.selectMotorsByNum(num, rows);
    }

    public int getCount(){
        return motorVehicleMapper.getCount();
    }

}
