package com.mxt.service;

import com.mxt.dao.StationsMapper;
import com.mxt.entity.Stations;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class StationService {
    @Autowired
    StationsMapper stationsMapper;

    public int deleteByPrimaryKey(Integer stationId){
        return stationsMapper.deleteByPrimaryKey(stationId);
    }

    public int insert(Stations record){
        return stationsMapper.insert(record);
    }

    public int insertSelective(Stations record){
        return stationsMapper.insertSelective(record);
    }

    public Stations selectByPrimaryKey(Integer stationId){
        return stationsMapper.selectByPrimaryKey(stationId);
    }

    public int updateByPrimaryKeySelective(Stations record){
        return stationsMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Stations record){
        return stationsMapper.updateByPrimaryKey(record);
    }

    public ArrayList<Stations> selectStationByNum(@Param("num")int num ,@Param("rows")int rows){
        return stationsMapper.selectStationByNum(num, rows);
    }

    public int getCount(){
        return stationsMapper.getCount();
    }
}
