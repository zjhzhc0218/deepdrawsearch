package com.deepdraw.deepsearch.serviceImpl;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.dao.ZywDao;
import com.deepdraw.deepsearch.entity.Zyw;
import com.deepdraw.deepsearch.service.ZywService;
import jnr.ffi.annotations.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * @author
 * @create 2018-09-18 17:35
 **/
@Component
public class ZywServiceImpl implements ZywService{

    @Autowired
    private ZywDao zywDao;

    @Override
    public String selectZyw(String name, String password) {
        Zyw zyw = zywDao.selectZywForname(name, password);
        if(zyw==null){
            return "查询失败，没有该用户啊";
        }else{
            return "运气不错，查有此人";
        }
    }

    @Override
    public String addZyw(Zyw zyw) {
        try {
            Integer num = zywDao.addZyw(zyw);
            Integer id = zyw.getId();
            String message = "恭喜您注册成功，您是第"+(id+2018)+"个用户";
            return message;
        }catch(Throwable throwable){
            String message = "很遗憾注册失败，手机用户已经被注册了";
            return message;
        }
    }

    @Override
    public String updateZyw(Zyw zyw, String passwordAgain) {
        Zyw zywSelect = zywDao.selectZywForname(zyw.getName(), zyw.getPassword());
        if(zyw==null){
            return "查询失败，请从新校验对应的账号密码";
        }else{
            try {
            /*进行账号密码的修改*/
            zywSelect.setLastIp(zyw.getLastIp());
            Integer y =  zywDao.updateZyw(zywSelect);
            if(y!=0){
                return "您的密码修改成功";}else{
                return "您的密码修改失败，可能信息被删除了";
            }
            }catch(Throwable throwable){
                String message = "很遗憾密码修改失败，请重新进行修改处理";
                return message;
            }
        }
    }
}
