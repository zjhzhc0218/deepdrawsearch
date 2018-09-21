package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.Zyw;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author
 * @create 2018-09-18 17:34
 **/
@Service
public interface ZywService {

    Map<String,Object> selectZyw(String name, String password);

    String addZyw(Zyw zyw);

    String updateZyw(Zyw zyw,String passwordAgain);
}
