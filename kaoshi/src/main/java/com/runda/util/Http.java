package com.runda.util;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class Http {

	public static String doGet(String httpurl) {
        HttpURLConnection connection = null;
        InputStream is = null;
        BufferedReader br = null;
        String result = null;// 返回结果字符串
        try {
            // 创建远程url连接对象
            URL url = new URL(httpurl);
            // 通过远程url连接对象打开一个连接，强转成httpURLConnection类
            connection = (HttpURLConnection) url.openConnection();
            // 设置连接方式：get
            connection.setRequestMethod("GET");
            // 设置连接主机服务器的超时时间：15000毫秒
            connection.setConnectTimeout(15000);
            // 设置读取远程返回的数据时间：60000毫秒
            connection.setReadTimeout(60000);
            // 发送请求
            connection.connect();
            // 通过connection连接，获取输入流
            if (connection.getResponseCode() == 200) {
                is = connection.getInputStream();
                // 封装输入流is，并指定字符集
                br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                // 存放数据
                StringBuffer sbf = new StringBuffer();
                String temp = null;
                while ((temp = br.readLine()) != null) {
                    sbf.append(temp);
                    sbf.append("\r\n");
                }
                result = sbf.toString();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            if (null != br) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
 
            if (null != is) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
 
            connection.disconnect();// 关闭远程连接
        }
 
        return result;
	}
	
//	public static Map<String , List<String>> get(String url) throws IOException {
//		StringBuilder builder = new StringBuilder();
//
//        URL Url  = new URL(url);
//        URLConnection conn =  Url.openConnection();
//        // 设置代理
//        //URLConnection conn = Url.openConnection(setProxy(proxyHost, proxyPort));
//        // 如果需要设置代理账号密码则添加下面一行
//        //conn.setRequestProperty("Proxy-Authorization", "Basic "+Base64.encode("account:password".getBytes()));
//
//        //发送数据包(可以直接抓取浏览器数据包然后复制)
//        conn.setRequestProperty("accept", "*/*" );
//        conn.setRequestProperty("Connection", "Keep-Alive" );
//        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36");
//
//		conn.connect();
//
//        //接收响应的数据包
//        Map<String , List<String>> map = conn.getHeaderFields();
//
//        System.out.println(map.toString());
//        Set<String> set = map.keySet();
//        for(String k : set ){
//            String v = conn.getHeaderField(k);
//            System.out.println(k + ":" + v  );
//        }
//
//        return map;
//	}
	
}
