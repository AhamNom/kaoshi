package com.runda.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
/**
 * 数学工具类
 * @author zj
 * @date   2017年2月8日
 *
 */
public class MathUtils {
	
	
	
	/**
	 * 避免Double精度丢失的乘法
	 * 
	 * @param v1
	 * @param v2
	 * @return
	 */
	public static double mul(double... v) {
		BigDecimal b = new BigDecimal(Double.toString(1));
		for (double temp : v) {
			b = b.multiply(new BigDecimal(Double.toString(temp)));
		}
		return b.doubleValue();
	}

	/**
	 * 避免double精度丢失的加法运算
	 * 
	 * @param v1
	 * @param v2
	 * @return
	 */
	public static double sum(double... v) {
		BigDecimal b = new BigDecimal(Double.toString(0));
		for (double temp : v) {
			b = b.add(new BigDecimal(Double.toString(temp)));
		}
		return b.doubleValue();
	}
	/**
	 * 将double类型的数值保留小数点后两位输出
	 * @param d
	 * @return
	 */
	public static double round(double d) {
		DecimalFormat nf = new DecimalFormat("0.00");
		return Double.parseDouble(nf.format(d));
	}
	/**
	 * 
	 * @param i 几位随机数
	 * @return String类型的
	 */
	public  static String getRandomString(Integer i){
		String num="";
		for(int j=0;j<i;j++){
			Random r=new Random();
			num += r.nextInt(9);
		 }
		 return num;
		}
	/* 人民币大写转换 */
	public static String convertToChineseNumber(double number) {
		StringBuffer chineseNumber = new StringBuffer();
		boolean pand = false;
		String[] num = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
		String[] unit = { "分", "角", "圆", "拾", "佰", "仟", "万", "拾", "佰", "仟",
				"亿", "拾", "佰", "仟", "万" };
		String tempNumber = String.valueOf(Math.round((number * 100)));

		if (tempNumber != null && tempNumber.length() > 1
				&& tempNumber.charAt(0) == '-') {
			pand = true;
			tempNumber = tempNumber.substring(1, tempNumber.length());

		}
		int tempNumberLength = tempNumber.length();
		if ("0".equals(tempNumber)) {
			return "零圆整";
		}
		if (tempNumberLength > 15) {
			// throw new InputException("超出转化范围.");
			System.out.println(("超出转化范围"));
		}
		boolean preReadZero = true; // 前面的字符是否读零
		for (int i = tempNumberLength; i > 0; i--) {
			if ((tempNumberLength - i + 2) % 4 == 0) {
				// 如果在（圆，万，亿，万）位上的四个数都为零,如果标志为未读零，则只读零，如果标志为已读零，则略过这四位
				if (i - 4 >= 0 && "0000".equals(tempNumber.substring(i - 4, i))) {
					if (!preReadZero) {
						chineseNumber.insert(0, "零");
						preReadZero = true;
					}
					i -= 3; // 下面还有一个i--
					continue;
				}
				// 如果当前位在（圆，万，亿，万）位上，则设置标志为已读零（即重置读零标志）
				preReadZero = true;
			}
			Integer digit = Integer.parseInt(tempNumber.substring(i - 1, i));
			if (digit == 0) {
				// 如果当前位是零并且标志为未读零，则读零，并设置标志为已读零
				if (!preReadZero) {
					chineseNumber.insert(0, "零");
					preReadZero = true;
				}
				// 如果当前位是零并且在（圆，万，亿，万）位上，则读出（圆，万，亿，万）
				if ((tempNumberLength - i + 2) % 4 == 0) {
					chineseNumber.insert(0, unit[tempNumberLength - i]);
				}
			}
			// 如果当前位不为零，则读出此位，并且设置标志为未读零
			else {
				chineseNumber
						.insert(0, num[digit] + unit[tempNumberLength - i]);
				preReadZero = false;
			}
		}
		// 如果分角两位上的值都为零，则添加一个“整”字
		if (tempNumberLength - 2 >= 0
				&& "00".equals(tempNumber.substring(tempNumberLength - 2,
						tempNumberLength))) {
			chineseNumber.append("整");
		}
		if (pand)
			chineseNumber.insert(0, "负");
		return chineseNumber.toString();
	}
	/**
	 * 判断是否是数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean pandNumber(String str) {
		int length = str.length();
		int v = 0;

		for (int i = 0; i < length; i++) {
			v = str.charAt(i);
			if (v < 49 || v > 57)
				return false;
		}
		return true;
	}
	/**
	 * 找出数组中最大值
	 * @param args
	 * @return
	 */
	public static int maxIntArray(int[] args) {
		if (args == null)
			return 0;
		int max = 0;
		for (int i = 0; i < args.length; i++) {
			max += args[i];

		}
		return max;
	}
	/**
     * 转换为BigDecimal
     *  
     * @param o
     * @return BigDecimal
     * @author fantasy 
     * @date 2013-8-27
     */
    public static BigDecimal toBig(Object o) {
        if (o == null || o.toString().equals("") || o.toString().equals("NaN")) {
            return new BigDecimal(0);
        }
        return new BigDecimal(o.toString());
    }
	/**
     * 计算比例
     *  
     * @param divisor
     * @param dividend
     * @return String
     * @author fantasy 
     * @date 2013-10-9
     */
    public static String divideNumber(Object divisor, Object dividend){
    	if(divisor == null || dividend == null){
            return "";
        }
    	 BigDecimal a = toBig(divisor);
         BigDecimal b = toBig(dividend);
         if(a.equals(toBig(0)) || b.equals(toBig(0))){
        	 return "0";
         }
         BigDecimal c = a.divide(b, 2, BigDecimal.ROUND_DOWN);
         return c.toString();
    }
    /**
     * 计算百分比
     *  
     * @param divisor
     * @param dividend
     * @return String
     * @author fantasy 
     * @date 2013-8-27
     */
    public static String getPercent(Object divisor, Object dividend){
        if(divisor == null || dividend == null){
            return "";
        }
        NumberFormat percent = NumberFormat.getPercentInstance();   
        //建立百分比格式化引用   
        percent.setMaximumFractionDigits(2);
        BigDecimal a = toBig(divisor);
        BigDecimal b = toBig(dividend);
        if(a.equals(toBig(0)) || b.equals(toBig(0)) || a.equals(toBig(0.0)) || b.equals(toBig(0.0))){
       	 return "0.00%";
        }
        BigDecimal c = a.divide(b, 4, BigDecimal.ROUND_DOWN);
        return percent.format(c);
    }
    

    public static String getDate(){
    	SimpleDateFormat format = (SimpleDateFormat) SimpleDateFormat.getDateTimeInstance();
    	format.applyPattern("yyyy-MM-dd HH:mm:ss");
    	Date currentDate = new Date();
        String currentDateStr = format.format(currentDate);
        return currentDateStr;
    }
    
    /** 
     * 获取精确到秒的时间戳 
     * @param date 
     * @return 
     */
    public static int getSecondTimestampTwo(Date date){ 
      if (null == date) { 
        return 0; 
      } 
      String timestamp = String.valueOf(date.getTime()/1000); 
      return Integer.valueOf(timestamp); 
    } 

    /** 
     * 获取精确到秒的时间戳 
     * @param date 
     * @return 
     */
    public static String currentDateStr(){ 
    	SimpleDateFormat format = (SimpleDateFormat) SimpleDateFormat.getDateTimeInstance();
    	format.applyPattern("yyyy-MM-dd HH:mm:ss");
    	Date currentDate = new Date();
        String currentDateStr = format.format(currentDate);
        return currentDateStr; 
    } 
    
    public static int getTime(String time) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	long t =  0;
    	try {
			t = sdf.parse(time).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String timestamp = String.valueOf(t/1000); 
        return Integer.valueOf(timestamp); 
    }

    public static boolean isNull(String str) {
    	if (str==null||"".equals(str)) {
            return true; 
		}
        return false; 
    }
    
    public static boolean notNull(String str) {
    	if (str!=null&&!"".equals(str)) {
            return true; 
		}
        return false; 
    }
    
    public static int max_min(int max,int min) {
    	if (max>min) {
			return max-min;
		}
    	return min-max;
    }
    
    
}
