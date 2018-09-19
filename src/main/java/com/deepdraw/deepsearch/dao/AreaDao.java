package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.Area;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AreaDao {
    List<Area> queryArea();
}
