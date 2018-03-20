package com.mxt.dao;

import com.mxt.entity.Trainline;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface TrainlineMapper {
    int deleteByPrimaryKey(Integer tlId);

    int insert(Trainline record);

    int insertSelective(Trainline record);

    Trainline selectByPrimaryKey(Integer tlId);

    int updateByPrimaryKeySelective(Trainline record);

    int updateByPrimaryKey(Trainline record);

    ArrayList<Trainline> selectByMotorName(String motorName);
}