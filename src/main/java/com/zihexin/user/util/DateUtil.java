/** 
 * <pre>项目名称:mongo-02 
 * 文件名称:DateUtil.java 
 * 包名:common.util 
 * 创建日期:2017年3月25日上午10:28:59 
 * Copyright (c) 2017, chenjh123@gmail.com All Rights Reserved.</pre> 
 */  
package com.zihexin.user.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.SimpleTimeZone;


public class DateUtil {

	/**
	 * <pre>parseDateToGMT(格式化日期为东八区日期)   
	 *
	 *
	 *
	 *
	 * 修改备注： 
	 * @param date
	 * @param pattern
	 * @return</pre>
	 */
	public static Date parseDateToGMT(Date date, String pattern) {
		Date parse = null;
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String format = sdf.format(date);
		//设置时区（东八区）
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.setTimeZone(new SimpleTimeZone(0, "GMT"));
		sdf.setCalendar(gregorianCalendar);
		try {
			parse = sdf.parse(format);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return parse;
	}

	public static String formatDateToString(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String format = sdf.format(date);
		return format;
	}

	public static int getCurrentMonthLastDay(Date date) {
		Calendar a = Calendar.getInstance();
		a.setTime(date);
		a.set(Calendar.DATE, 1);//把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天
		int maxDate = a.get(Calendar.DATE);
		return maxDate;
	}
}
