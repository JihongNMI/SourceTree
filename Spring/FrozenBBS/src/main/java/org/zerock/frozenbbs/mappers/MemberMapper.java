package org.zerock.frozenbbs.mappers;

import org.zerock.frozenbbs.vo.MemberVO;

public interface MemberMapper {
    MemberVO login(MemberVO vo);


    // 아이디 중복 확인
    MemberVO findById(String id);

    // 회원 정보 삽입 (회원가입)
    void insertMember(MemberVO vo);

}
