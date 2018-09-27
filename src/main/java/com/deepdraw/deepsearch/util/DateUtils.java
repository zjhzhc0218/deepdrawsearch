package com.deepdraw.deepsearch.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 时间的工具类
 * zyw
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
//	 * @param date
//	 *            日期
	 * @param format
	 *            日期格式
	 * @return 字符串
	 */
	public static String getDate(String format) {
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}


	      //获取当天的开始时间
		  public static java.util.Date getDayBegin() {
		         Calendar cal = new GregorianCalendar();
		         cal.set(Calendar.HOUR_OF_DAY, 0);
		         cal.set(Calendar.MINUTE, 0);
		         cal.set(Calendar.SECOND, 0);
		        cal.set(Calendar.MILLISECOND, 0);
		         return cal.getTime();
		     }
      //获取当天的结束时间
		     public static java.util.Date getDayEnd() {
		         Calendar cal = new GregorianCalendar();
		         cal.set(Calendar.HOUR_OF_DAY, 23);
		         cal.set(Calendar.MINUTE, 59);
		         cal.set(Calendar.SECOND, 59);
		         return cal.getTime();
		     }
      //获取昨天的开始时间
		      public static Date getBeginDayOfYesterday() {
		         Calendar cal = new GregorianCalendar();
		         cal.setTime(getDayBegin());
		        cal.add(Calendar.DAY_OF_MONTH, -1);
		         return cal.getTime();
		     }
     //获取昨天的结束时间
		      public static Date getEndDayOfYesterDay() {
		         Calendar cal = new GregorianCalendar();
		         cal.setTime(getDayEnd());
		         cal.add(Calendar.DAY_OF_MONTH, -1);
		         return cal.getTime();
		     }
      //获取明天的开始时间
		      public static Date getBeginDayOfTomorrow() {
		         Calendar cal = new GregorianCalendar();
		        cal.setTime(getDayBegin());
		         cal.add(Calendar.DAY_OF_MONTH, 1);

		         return cal.getTime();
		     }
      //获取明天的结束时间
		      public static Date getEndDayOfTomorrow() {
		         Calendar cal = new GregorianCalendar();
		         cal.setTime(getDayEnd());
		         cal.add(Calendar.DAY_OF_MONTH, 1);
		         return cal.getTime();
		     }
      //获取本周的开始时间
		      public static Date getBeginDayOfWeek() {
		         Date date = new Date();
		         if (date == null) {
			             return null;
			         }
		         Calendar cal = Calendar.getInstance();
		         cal.setTime(date);
		         int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
		         if (dayofweek == 1) {
			             dayofweek += 7;
			        }
		        cal.add(Calendar.DATE, 2 - dayofweek);
		         return getDayStartTime(cal.getTime());
		     }
     //获取本周的结束时间
		      public static Date getEndDayOfWeek(){
		         Calendar cal = Calendar.getInstance();
		        cal.setTime(getBeginDayOfWeek());
		         cal.add(Calendar.DAY_OF_WEEK, 6);
		         Date weekEndSta = cal.getTime();
		         return getDayEndTime(weekEndSta);
		     }
      //获取本月的开始时间
		       public static Date getBeginDayOfMonth() {
		            Calendar calendar = Calendar.getInstance();
		             calendar.set(getNowYear(), getNowMonth() - 1, 1);
		             return getDayStartTime(calendar.getTime());
		         }
     //获取本月的结束时间
		       public static Date getEndDayOfMonth() {
		             Calendar calendar = Calendar.getInstance();
		             calendar.set(getNowYear(), getNowMonth() - 1, 1);
		             int day = calendar.getActualMaximum(5);
		             calendar.set(getNowYear(), getNowMonth() - 1, day);
		             return getDayEndTime(calendar.getTime());
		        }
      //获取本年的开始时间
		       public static java.util.Date getBeginDayOfYear() {
		             Calendar cal = Calendar.getInstance();
		            cal.set(Calendar.YEAR, getNowYear());
		             // cal.set
		             cal.set(Calendar.MONTH, Calendar.JANUARY);
		            cal.set(Calendar.DATE, 1);

		             return getDayStartTime(cal.getTime());
		         }
      //获取本年的结束时间
		      public static java.util.Date getEndDayOfYear() {
		             Calendar cal = Calendar.getInstance();
		            cal.set(Calendar.YEAR, getNowYear());
		             cal.set(Calendar.MONTH, Calendar.DECEMBER);
		             cal.set(Calendar.DATE, 31);
		             return getDayEndTime(cal.getTime());
		         }
    //获取某个日期的开始时间
		     public static Timestamp getDayStartTime(Date d) {
		         Calendar calendar = Calendar.getInstance();
		         if(null != d) calendar.setTime(d);
		        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),    calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		         calendar.set(Calendar.MILLISECOND, 0);
		        return new Timestamp(calendar.getTimeInMillis());
		     }
    //获取某个日期的结束时间
		     public static Timestamp getDayEndTime(Date d) {
		         Calendar calendar = Calendar.getInstance();
		         if(null != d) calendar.setTime(d);
		         calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),    calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
		        calendar.set(Calendar.MILLISECOND, 999);
		         return new Timestamp(calendar.getTimeInMillis());
		     }
     //获取今年是哪一年
		      public static Integer getNowYear() {
		              Date date = new Date();
		            GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
		             gc.setTime(date);
		             return Integer.valueOf(gc.get(1));
		        }
      //获取本月是哪一月
		      public static int getNowMonth() {
		              Date date = new Date();
		             GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
		             gc.setTime(date);
		            return gc.get(2) + 1;
		         }
      //两个日期相减得到的天数
		      public static int getDiffDays(Date beginDate, Date endDate) {

		             if (beginDate == null || endDate == null) {
			                 throw new IllegalArgumentException("getDiffDays param is null!");
			             }

		             long diff = (endDate.getTime() - beginDate.getTime())
		                    / (1000 * 60 * 60 * 24);

		            int days = new Long(diff).intValue();

		             return days;
		         }
     //两个日期相减得到的毫秒数
		      public static long dateDiff(Date beginDate, Date endDate) {
		             long date1ms = beginDate.getTime();
		             long date2ms = endDate.getTime();
		             return date2ms - date1ms;
		         }
      //获取两个日期中的最大日期
		     public static Date max(Date beginDate, Date endDate) {
		             if (beginDate == null) {
			                 return endDate;
			             }
		             if (endDate == null) {
			                return beginDate;
			             }
		             if (beginDate.after(endDate)) {
			                 return beginDate;
			             }
		            return endDate;
		         }
      //获取两个日期中的最小日期
		      public static Date min(Date beginDate, Date endDate) {
		            if (beginDate == null) {
			                 return endDate;
			            }
		             if (endDate == null) {
			                 return beginDate;
			             }
		            if (beginDate.after(endDate)) {
			                 return endDate;
			             }
		            return beginDate;
		         }
      //返回某月该季度的第一个月
		      public static Date getFirstSeasonDate(Date date) {
		              final int[] SEASON = { 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4 };
		             Calendar cal = Calendar.getInstance();
		             cal.setTime(date);
		             int sean = SEASON[cal.get(Calendar.MONTH)];
		             cal.set(Calendar.MONTH, sean * 3 - 3);
		             return cal.getTime();
		         }
      //返回某个日期下几天的日期
		     public static Date getNextDay(Date date, int i) {
		             Calendar cal = new GregorianCalendar();
		            cal.setTime(date);
		             cal.set(Calendar.DATE, cal.get(Calendar.DATE) + i);
		             return cal.getTime();
		        }
     //返回某个日期前几天的日期
		      public static Date getFrontDay(Date date, int i) {
		             Calendar cal = new GregorianCalendar();
		             cal.setTime(date);
		             cal.set(Calendar.DATE, cal.get(Calendar.DATE) - i);
		             return cal.getTime();
		         }
     //获取某年某月到某年某月按天的切片日期集合（间隔天数的日期集合）
		     public static List getTimeList(int beginYear, int beginMonth, int endYear,
											int endMonth, int k) {
		             List list = new ArrayList();
		            if (beginYear == endYear) {
			                 for (int j = beginMonth; j <= endMonth; j++) {
				                     list.add(getTimeList(beginYear, j, k));

				                 }
			            } else {
			                {
				                     for (int j = beginMonth; j < 12; j++) {
					                         list.add(getTimeList(beginYear, j, k));
					                     }

				                     for (int i = beginYear + 1; i < endYear; i++) {
					                         for (int j = 0; j < 12; j++) {
						                             list.add(getTimeList(i, j, k));
						                         }
					                     }
				                    for (int j = 0; j <= endMonth; j++) {
					                         list.add(getTimeList(endYear, j, k));
					                     }
				                 }
			            }
		            return list;
		         }
      //获取某年某月按天切片日期集合（某个月间隔多少天的日期集合）
		      public static List getTimeList(int beginYear, int beginMonth, int k) {
		             List list = new ArrayList();
		             Calendar begincal = new GregorianCalendar(beginYear, beginMonth, 1);
		             int max = begincal.getActualMaximum(Calendar.DATE);
		             for (int i = 1; i < max; i = i + k) {
			                list.add(begincal.getTime());
			                 begincal.add(Calendar.DATE, k);
			            }
		             begincal = new GregorianCalendar(beginYear, beginMonth, max);
		             list.add(begincal.getTime());
		            return list;
		         }
	
}
