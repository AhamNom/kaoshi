package com.runda.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.runda.util.JsonUtils;
import com.runda.util.Upload;

@RequestMapping("/admin")
@RestController
public class UploadController {

	/**
     * 处理图片上传
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/upload" ,produces="text/html;charset=utf-8" )
    public String upload(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response)throws Exception{
        System.out.println("开始处理");
        System.out.println(file);
        String fileName = Upload.fileUpload(file, request);
        //定义前台访问路径
//        ResourceBundle resource = ResourceBundle.getBundle("config");
//        String path = resource.getString("imageUrl");
        Map<String,Object> result = new HashMap<>();
		result.put("imgUrl", "http://localhost:8080/images/"+fileName);
		result.put("img", fileName);
		String json = JsonUtils.objectToJson(result);
		return json;
    }
}
