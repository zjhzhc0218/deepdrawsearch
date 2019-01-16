package com.deepdraw.deepsearch.controller;/**
 * Created by hasee on 2019/1/16.
 */

import com.deepdraw.deepsearch.entity.Announcement;
import com.deepdraw.deepsearch.entity.ArticleInformation;
import com.deepdraw.deepsearch.service.AnnouncementService;
import com.deepdraw.deepsearch.service.FileDownloadService;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 公告controller
 * @author
 * @create 2019-01-16 9:32
 **/
@Controller
@RequestMapping("/Announcement")
public class AnnouncementController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private AnnouncementService announcementService;

    /**
     * 新增公告
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "addAnnouncement")
    public Object addAnnouncement(HttpServletRequest request) throws IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String synopsis = request.getParameter("synopsis");
        String specificContent = request.getParameter("specificContent");

        Announcement announcement = new Announcement();
        announcement.setTitle(title);
        announcement.setAuthor(author);
        announcement.setSynopsis(synopsis);
        announcement.setSpecificContent(specificContent);
        announcementService.insertSelective(announcement);

        return JsonUtil.object2Json(ResultUtil.success("新增成功"));

    }

    /**
     * 删除公告 【单条或者多条】
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "delectAnnouncement")
    public Object delectAnnouncement(HttpServletRequest request) throws IOException {
        String ids = request.getParameter("ids");
        List list = JsonUtil.json2Object(ids,List.class);
        if(list.size()>0){  //如果id存在 就认为是修改，那么删除原先的，再新增一个新的
            for(Integer y=0;y<list.size();y++){
                Integer z = (Integer) (list.get(y));
                announcementService.deleteByPrimaryKey(z);
            }
            return JsonUtil.object2Json(ResultUtil.success("删除成功"));
        }else{
            return JsonUtil.object2Json(ResultUtil.error(2,"没有对应id"));
        }
    }

    /**
     * 查询公告 (查询全部 或者是按标题查询)
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "selectAnnouncement")
    public String selectAnnouncement(HttpServletRequest request) throws IOException {
        String title = request.getParameter("title");
        Map<String,Object> maps = new HashMap<>();
      List<Announcement> list = announcementService.selectBytitleS(title);
       maps.put("list",list);
       return JsonUtil.object2Json(ResultUtil.success(maps));

    }


    /**
     * 查询公告单个
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "getAnById")
    public Object getAnnouncementById(HttpServletRequest request,Integer id) throws IOException {
        Announcement announcement = announcementService.selectByPrimaryKey(id);
        return JsonUtil.object2Json(ResultUtil.success(announcement));
    }


    /*公告Announcement 单个以及它的前一个跟后一个 连续的*/
    @RequestMapping("/getAnByIdContinuous")
    @ResponseBody
    public Object getAnnouncementByIdContinuous(HttpServletRequest request,Integer id) throws IOException {
        Map<Integer,Announcement> map =  new HashMap<>();
        List<Announcement> list = announcementService.selectBytitleS(null);
        if(list.size()==0){
            return JsonUtil.object2Json(ResultUtil.error(2,"数据库没数据"));
        }
        Integer x = -1;
        Integer y = 0;
        for(Announcement listNew:list){
            if((listNew.getId()).equals(id)){
                x = y;
            }
            map.put(y,listNew);
            y++;
        }

        if(x.equals(-1)){
            return JsonUtil.object2Json(ResultUtil.error(3,"数据库没匹配该数据"));
        }

        Map<String,Announcement> maplist =  new HashMap<>();
        if(x==0){
            maplist.put("shang",null);
            maplist.put("now",map.get(x));
            if(y==0){
                maplist.put("xia",null);
            }else{
                maplist.put("xia",map.get(x+1));
            }
        }
        if(x>0){
            if(x.equals(y)){
                maplist.put("shang",map.get(x-1));
                maplist.put("now",map.get(x));
                maplist.put("xia",null);
            }else{
                maplist.put("shang",map.get(x-1));
                maplist.put("now",map.get(x));
                maplist.put("xia",map.get(x+1));
            }
        }

        Map<String,Object> maplistN =  new HashMap<>();
        if(maplist.get("shang")==null){
            maplistN.put("shang","null");
        }else{
            Map<String,String> maplistShang =  new HashMap<>();
            maplistShang.put("serialNumber",maplist.get("shang").getId().toString());
            maplistShang.put("title",maplist.get("shang").getTitle());
            maplistN.put("shang",maplistShang);
        }
        maplistN.put("now",maplist.get("now"));

        if(maplist.get("xia")==null){
            maplistN.put("xia","null");
        }else{
            Map<String,String> maplistXia =  new HashMap<>();
            maplistXia.put("serialNumber",maplist.get("xia").getId().toString());
            maplistXia.put("title",maplist.get("xia").getTitle());
            maplistN.put("xia",maplistXia);
        }
        return JsonUtil.object2Json(ResultUtil.success(maplistN));
    }

}
