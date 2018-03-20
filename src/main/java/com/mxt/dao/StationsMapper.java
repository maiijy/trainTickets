package com.mxt.dao;

import com.mxt.entity.Stations;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface StationsMapper {
    int deleteByPrimaryKey(Integer stationId);

    int insert(Stations record);

    int insertSelective(Stations record);

    Stations selectByPrimaryKey(Integer stationId);

    int updateByPrimaryKeySelective(Stations record);

    int updateByPrimaryKey(Stations record);

    ArrayList<Stations> selectStationByNum(@Param("num")int num, @Param("rows")int rows);

    int getCount();
}