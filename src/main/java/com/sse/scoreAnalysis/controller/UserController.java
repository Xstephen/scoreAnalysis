package com.sse.scoreAnalysis.controller;

import com.sse.scoreAnalysis.model.User;
import com.sse.scoreAnalysis.service.UserService;
import com.sse.scoreAnalysis.utils.Message;
import com.sse.scoreAnalysis.utils.RSAUtils;
import com.sse.scoreAnalysis.utils.VerifyCodeUtil;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/")

public class UserController {
    @Autowired
    private UserService userService;
    //默认首页
    @RequestMapping("/")
    public String index(HttpSession session){
        User user= (User) session.getAttribute("user");
        if(user!=null){
            //已经登录
            return "forward:/main";
        }
        return "login";
    }

    //正常访问login页面
    @RequestMapping("/login")
    public String login(HttpSession session){
        if(session.getAttribute("user")!=null){
            //已经登录
            return "forward:/main";
        }
        return "login";
    }

    //表单提交过来的路径
    @RequestMapping(value = "/checkLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> checkLogin(HttpServletRequest request,HttpSession session,User formUser){
        Map<String, Object> resultMap = new HashMap<>();
        //获取用户输入的验证码
        String verifyCode= (String) request.getParameter("verifyCode");
        //从session获取验证码
        String sessionVerifyCode= (String) session.getAttribute("verifyCodeValue");
        if(!verifyCode.equalsIgnoreCase(sessionVerifyCode)){
            //直接返回不做下面的验证
            resultMap.put("success",false);
            resultMap.put("msg","验证码错误！");
            return resultMap;
        }
        //解密
        User decryptUser=new User();
        decryptUser.setUserId(RSAUtils.decryptBase64(formUser.getUserId()));
        decryptUser.setUserPassword(RSAUtils.decryptBase64(formUser.getUserPassword()));
        //调用service方法
        User loginUser=userService.checkLogin(decryptUser.getUserId());
        //如果有user添加到model里并跳转到主页面
        if(loginUser!=null){
            if(loginUser.getUserPassword().equals(decryptUser.getUserPassword())){
                session.setAttribute("user",loginUser);
                resultMap.put("success",true);
            }
            else {
                resultMap.put("success",false);
                resultMap.put("msg","密码错误！");
            }
        }else {
            resultMap.put("success",false);
            resultMap.put("msg","不存在该用户！");
        }
        return resultMap;
    }

    //跳转到主页面
    @RequestMapping("/main")
    public String mainPage(HttpServletRequest request,HttpSession session){
        //获取用户信息，判断应该跳转的页面
        User user=(User) session.getAttribute("user");
        String info= (String) request.getAttribute("info");
        if(info!=null){
            session.setAttribute("info",info);
        }
        int role=user.getRole();
        switch (role){
            case 0:
                //教务长
                return "redirect:/admin/";
            case 1:
                //辅导员
                return "redirect:/counselor/";
            case 2:
                //学生
                return "redirect:/student/";
        }
        return null;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session,SessionStatus sessionStatus){
        //通过session.invalidate方法注销当前session
        session.removeAttribute("user");
        session.invalidate();
        sessionStatus.setComplete();
        return "redirect:/";
    }

    /*
    获取验证码
     */
    @RequestMapping("/getVerifyCode")
    public void getVerifyCode(HttpServletResponse response,HttpSession session){
        ByteArrayOutputStream output=new ByteArrayOutputStream();
        String verifyCodeValue= VerifyCodeUtil.drawImg(output);
        //将验证码保存到session中
        session.setAttribute("verifyCodeValue",verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    获取公钥
     */
    @RequestMapping(value="/getPublic",method=RequestMethod.POST)
    @ResponseBody
    public Message getPublic() {
        String publicKey = RSAUtils.generateBase64PublicKey();
        Message result = null;
        if (publicKey == null) {
            result = Message.fail("获取公钥失败，请重试！");
        } else {
            result = Message.success().add("publicKey", publicKey);
        }
        return result;
    }
}
