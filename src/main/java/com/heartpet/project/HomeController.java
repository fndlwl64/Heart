package com.heartpet.project;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * Simply selects the home view to render by returning its name.
     * 
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(HttpSession session, Model model) throws UnsupportedEncodingException {

        // 애플리케이션 클라이언트 아이디값
        /*
         * String clientId = "fw7rzSQL46p95xisWWtm"; String redirectURI =
         * URLEncoder.encode("/project/naver_login", "UTF-8"); SecureRandom random = new
         * SecureRandom(); String state = new BigInteger(130, random).toString(); String
         * apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code" +
         * "&client_id=" + clientId + "&redirect_uri=" + redirectURI + "&state=" +
         * state; session.setAttribute("state", state);
         */

        return "index";
    }

}
