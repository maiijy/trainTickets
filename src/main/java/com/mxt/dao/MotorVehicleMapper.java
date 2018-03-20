package com.mxt.dao;

import com.mxt.entity.MotorVehicle;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
@Repository
public interface MotorVehicleMapper {
    int deleteByPrimaryKey(Integer motorId);

    int insert(MotorVehicle record);

    int insertSelective(MotorVehicle record);

    MotorVehicle selectByPrimaryKey(Integer motorId);

    int updateByPrimaryKeySelective(MotorVehicle record);

    int updateByPrimaryKey(MotorVehicle record);

    ArrayList<MotorVehicle> selectAll();

    ArrayList<MotorVehicle> selectByStartAndEnd(String startName,String endName);

    ArrayList<MotorVehicle> selectMotorsByNum(@Param("num")int num , @Param("rows")int rows);

    int getCount();
}