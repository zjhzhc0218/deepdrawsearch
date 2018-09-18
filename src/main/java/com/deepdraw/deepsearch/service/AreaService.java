package com.deepdraw.deepsearch.service;

import com.deepdraw.deepsearch.entity.Area;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AreaService {

     List<Area> queryArea();
}
