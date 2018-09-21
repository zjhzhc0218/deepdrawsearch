package com.deepdraw.deepsearch.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间的工具类
 */
public class DateUtils {
	
	public static Date strToDate(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}
	public static Date strToDateHour(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}
	public static Date strToDateTime(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	public static String dateToStr(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(dateDate);
		return dateString;
	}
	
	public static String dateToStrHour(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateString = formatter.format(dateDate);
		return dateString;
	}
	
	public static String dateToStrTime(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(dateDate);
		return dateString;
	}
	
	public static String dateToTime(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		String dateString = formatter.format(dateDate);
		return dateString;
	}
	
	public static String dateToStrByFormate(Date dateDate,String fm) {
		SimpleDateFormat formatter = new SimpleDateFormat(fm);
		String dateString = formatter.format(dateDate);
		return dateString;
	}
	
	
	public static Date getForwardWeekByDate(Date dateDate,int daynum) {
	     Calendar   calendar   =   Calendar.getInstance(); 
	     calendar.setTime(dateDate); 
	     calendar.add(Calendar.DATE,daynum);//把日期往后增加一天.整数往后推,负数往前移动 
	     dateDate=calendar.getTime();   //这个时间就是日期往后推一天的结果 
	     return dateDate;
	}
	
	public static Date getForwardMonthByDate(Date dateDate,int monthnum) {
		 Calendar calendar = Calendar.getInstance();//日历对象
		 calendar.setTime(dateDate);//设置当前日期
		 calendar.add(Calendar.MONTH, -1);//月份减一
		 dateDate=calendar.getTime();   //这个时间就是日期往后推一天的结果 
	     return dateDate;
	}
	
	//对参数时间进行加减的分钟数
	public static Date getForwardTimeMin(Date dateDate,int min) {
	     Date rtn = null;  
		 Calendar cal = Calendar.getInstance();
	     cal.setTime(dateDate);  
	     cal.add(12, min);  
	     rtn = cal.getTime();  
	   return rtn;
	}
	
	//与当前时间偏差分钟数
	public static long getSysDateDeviate(Date dateDate) {
	   long num = (dateDate.getTime()-(new Date()).getTime())/60000;
	   return num;
	}
	
	/*
	 * 取系统当前时间
	 */
	public static Timestamp gettimestamp() {
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = df.format(dt);
		Timestamp buydate = Timestamp.valueOf(nowTime);
		return buydate;
	}
	
	/**
	 * @Title: compareDateStr
	 * @Description: 比较两个字符串时间的大小
	 * @param date1
	 * @param date2
	 * @return
	 * @throws
	 */
	public static int compareDateStr(String date1,String date2) {
		Date d1 = strToDateTime(date1);
		Date d2 = strToDateTime(date2);
        if (d1.getTime() > d2.getTime()) {
            return 1;
        } else if (d1.getTime() < d2.getTime()) {
            return -1;
        } else {
            return 0;
        }
	}

	/**
	 * 两个时间相差距离多少天多少小时多少分多少秒
	 */
	public static Long getDistanceSec(Date one,Date two) {
		long sec = 0;
		long time1 = one.getTime();
		long time2 = two.getTime();
		long diff ;
		if(time1<time2) {
			diff = time2 - time1;
		}else {
			diff = time1 - time2;
		}
		sec = diff / 1000;
		return sec;
	}
	
	/**
     * 比较验证码的时间
	 * 大于60s返回false否则返回true
	 * @param one
     * @param two
     * @return
     */
	public  static  boolean  CompareValidateTime(Date one,Date two){

		Long sec=getDistanceSec(one,two);
		long time=60;//60s
		if(sec.longValue()>time){
			return false;
		}else{
			return true;
		}
	}

	/**
	 * 获取当前日期 日期转换为字符串
	 * 
	 * @param date
	 *            日期
	 * @param format
	 *            日期格式
	 * @return 字符串
	 */
	public static String getDate(String format) {
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
	
}
