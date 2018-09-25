package com.deepdraw.deepsearch.service.impl;

import com.deepdraw.deepsearch.dao.SHUserDao;
import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class SHUserServiceImpl implements SHUserService {

    @Autowired
    private SHUserDao shUserDao;


    @Override
    public List<SHUser> selectUser() {
        return shUserDao.selectUser();
    }

    @Override
    public Map<String, Object> selectUser(String id , String password) {

        Map<String,Object> map =   new HashMap<>();
        SHUser shUser = shUserDao.selectUserById(id);
        if(shUser==null){
            map.put("message","查询失败，没有该用户");
            return map;
        }else {
            String passwords = MD5Util.inputPassToDbPass(password,shUser.getSalt());
            if (passwords.equals(shUser.getPassword())) {
                map.put("message","查询成功，返回客户信息");
                map.put("shUser",shUser);
                return map;
            }else{
                map.put("message","查询失败，密码错误");
                return map;
            }
        }
    }

    @Transactional(value="mysqlTransactionManager")
    @Override
    public String addUser(SHUser user) {

        SHUser shUser = shUserDao.selectUserById(user.getId());
        if(shUser==null) {
            try {
                shUserDao.addUser(user);
                String message = "恭喜您注册成功，返回登录页面进行登录";
                return message;
            } catch (Throwable throwable) {
                String message = "很遗憾注册失败，因为其他原因";
                return message;
            }
        }else{
            String message = "很遗憾注册失败，手机用户已经被注册了";
            return message;
        }
    }

    @Transactional(value="mysqlTransactionManager")
    @Override
    public String updateUser(SHUser user, String passwordAgain) {

        SHUser shUser = shUserDao.selectUserById(user.getId());
        if(shUser==null){
            return "修改失败，请从新校验对应的账号是否已经注册";
        }else {
            if (user.getPassword().equals(shUser.getPassword())) {
                try {
            /*进行账号密码的修改*/
                    String passwords = MD5Util.inputPassToDbPass(passwordAgain,shUser.getSalt());
                    shUser.setPassword(passwords);
                    Integer y =  shUserDao.updateUser(shUser);
                    if(y!=0){
                        return "您的密码修改成功";}else{
                        return "您的密码修改失败，可能信息被删除了";
                    }
                }catch(Throwable throwable){
                    String message = "很遗憾密码修改失败，请重新进行修改处理";
                    return message;
                }
            }else{
                return "修改失败，请从新校验对应的密码是否正确";
            }
        }
    }


}
