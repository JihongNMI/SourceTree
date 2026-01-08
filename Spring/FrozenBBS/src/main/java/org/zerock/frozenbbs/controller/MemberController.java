package org.zerock.frozenbbs.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.frozenbbs.dto.MemberDTO;
import org.zerock.frozenbbs.service.MemberService;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/login")
    public String login(){
        return "member/login";
    }

    @PostMapping("/login")
    public String login(MemberDTO param, HttpSession session
        , HttpServletRequest request, HttpServletResponse response){
        MemberDTO loginData = memberService.login(param);
        if(loginData == null){
            return "redirect:/member/login?msg=error";
        }
        session.setAttribute("loginData", loginData);
        return "redirect:/todo/list";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        // loginData만 삭제
        session.removeAttribute("loginData");
        // 세션의 모든 데이터 삭제
        session.invalidate();
        return "redirect:/member/login";
    }

    @GetMapping("/join")
    public String join(){
        return "member/join";
    }



    @PostMapping("/join")
    public String join(MemberDTO memberDTO) {
        // 회원가입 서비스 호출
        boolean result = memberService.register(memberDTO);

        if (result) {

            return "redirect:/member/login";  // 회원가입 성공 시 로그인 페이지로 리다이렉트
        } else {

            return "member/join";  // 실패 시 회원가입 페이지로 돌아가며, 메시지 표시
        }
    }
}










