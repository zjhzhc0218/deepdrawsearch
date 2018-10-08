package com.deepdraw.deepsearch.service.impl;

import com.deepdraw.deepsearch.dao.SHUserDao;
import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.exception.GlobalException;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.CodeMsg;
import com.deepdraw.deepsearch.util.DateUtils;
import com.deepdraw.deepsearch.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.sql.Timestamp;

@Component
public class SHUserServiceImpl implements SHUserService {

    @Autowired
    private SHUserDao shUserDao;


    @Override
    public List<SHUser> selectUser() {
        return shUserDao.selectUser();
    }

    @Override
    public Map<String, Object> selectUser(Long id , String password) {

        Map<String,Object> map =   new HashMap<>();
        SHUser shUser = shUserDao.selectUserById(id);
        if(shUser==null){
            throw new GlobalException(CodeMsg.USER_NULL_ERROR);
        }else {
            if(shUser.getBan()==2){
                throw new GlobalException(CodeMsg.USER_BAN_ERROR);
            }
            String passwords = MD5Util.inputPassToDbPass(password,shUser.getSalt());
            if (passwords.equals(shUser.getPassword())) {
//                修改登录时间跟登录次数
                Integer y =  shUserDao.updateUser(shUser);
                map.put("message","查询成功，返回客户信息");
                map.put("shUser",shUser);
                return map;
            }else{
                throw new GlobalException(CodeMsg.USER_PASSWORD_ERROR);
            }
        }
    }


    @Override
    public Map<String, Object> selectUsermessage(Long id ) {
        Map<String,Object> map =   new HashMap<>();
        SHUser shUser = shUserDao.selectUserById(id);
        if(shUser==null){
            throw new GlobalException(CodeMsg.USER_NULL_ERROR);
        }else {
//                修改登录时间跟登录次数
                Integer y =  shUserDao.updateUser(shUser);
                map.put("message","查询成功，返回客户信息");
                map.put("shUser",shUser);
                return map;
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
            throw new GlobalException(CodeMsg.USER_ADD_ERROR);
        }
    }

    @Transactional(value="mysqlTransactionManager")
    @Override
    public String updateUser(SHUser user, String passwordAgain) {

        SHUser shUser = shUserDao.selectUserById(user.getId());
        if(shUser==null){
            throw new GlobalException(CodeMsg.USER_CHANGE_NULL_ERROR);
        }else {
            if (user.getPassword().equals(shUser.getPassword())) {
                try {
            /*进行账号密码的修改*/
                    String passwords = MD5Util.inputPassToDbPass(passwordAgain,shUser.getSalt());
                    shUser.setPassword(passwords);
                    Integer y =  shUserDao.updateUser(shUser);
                    if(y!=0){
                        return "您的密码修改成功";}else{
                        throw new GlobalException(CodeMsg.USER_CHANGE_DELETE_ERROR);
                    }
                }catch(Throwable throwable){
                    String message = "很遗憾密码修改失败，请重新进行修改处理";
                    return message;
                }
            }else{
                throw new GlobalException(CodeMsg.USER_CHANGE_PASSWORD_ERROR);
            }
        }
    }

    /**
     * 查询多少时间内的注册用户数据
     * @param type 类型(1.前端传起始时间跟截止时间，2.当天，3.当周，4.当月，5.当年)
     * @param timeStart 起始时间
     * @param timeEnd 截止时间
     * @return
     */
    @Override
    public List<SHUser> selectUserByTime(Long id,Integer type, Date timeStart, Date timeEnd) {
        List<SHUser> shUserList = new ArrayList<>();
        switch(type){
//            1表示前端传值，自己传起始时间跟截止时间
            case 1:
                shUserList = shUserDao.selectUserByTime(id,timeStart,timeEnd);
                break;
//                2.表示当天的
            case 2:
                Timestamp timeStartD = new java.sql.Timestamp(DateUtils.getDayBegin().getTime());
                Timestamp timeEndD = new java.sql.Timestamp(DateUtils.getDayEnd().getTime());
                shUserList = shUserDao.selectUserByTime(id,timeStartD,timeEndD);
                break;
//                3.表示当周的
            case 3:
                Timestamp timeStartW = new java.sql.Timestamp(DateUtils.getBeginDayOfWeek().getTime());
                Timestamp timeEndW = new java.sql.Timestamp(DateUtils.getEndDayOfWeek().getTime());
                shUserList = shUserDao.selectUserByTime(id,timeStartW,timeEndW);
                break;
//                4.表示当月的
            case 4:
                Timestamp timeStartM = new java.sql.Timestamp(DateUtils.getBeginDayOfMonth().getTime());
                Timestamp timeEndM = new java.sql.Timestamp(DateUtils.getEndDayOfMonth().getTime());
                shUserList = shUserDao.selectUserByTime(id,timeStartM,timeEndM);
                break;
//                5.表示当年的
            case 5:
                Timestamp timeStartY = new java.sql.Timestamp(DateUtils.getBeginDayOfYear().getTime());
                Timestamp timeEndY = new java.sql.Timestamp(DateUtils.getEndDayOfYear().getTime());
                shUserList = shUserDao.selectUserByTime(id,timeStartY,timeEndY);
                break;
            default:
                if(id==null){
                    shUserList =  shUserDao.selectUser();
                }else{
                    shUserList.add(shUserDao.selectUserById(id));
                }
                 break;
        }
        return shUserList;
    }

    @Override
    public String banChange(Long id, Integer type) {
        String message = "";
            Integer y = shUserDao.banChange(id,type);
        if(y!=0){
            message = "用户登录权限修改成功";
        }else{
            throw new GlobalException(CodeMsg.USER_CHANGE_BAN_ERROR);
        }
        return message;
    }

    @Override
    public String resetpassword(Long id, String password, String salt) {
        String message = "";
        Integer y = shUserDao.resetpassword(id, password, salt);
        if(y!=0){
            message = id+"用户密码初始化成功";
            }else{
            throw new GlobalException(CodeMsg.USER_RESET_PASSWORD_ERROR);
        }
        return message;
    }


}
