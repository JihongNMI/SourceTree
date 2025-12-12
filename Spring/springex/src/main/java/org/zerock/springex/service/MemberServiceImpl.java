package org.zerock.springex.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.zerock.springex.dto.MemberDTO;
import org.zerock.springex.mappers.MemberMapper;
import org.zerock.springex.vo.MemberVO;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberMapper memberMapper;

    public MemberDTO login(MemberDTO param){
        // mapper에서 사용하기 위해 dto를 vo로 변환
        MemberVO vo = param.convertVO();
        // DB에서 id와 pw로 조회
        MemberVO loginVO = memberMapper.login(vo);
        // 조회 결과가 없을때
        if(loginVO == null || loginVO.getId() == null){
            return null;
        }
        // 조회 결과를 VO에 DTO로 변환
        MemberDTO loginDTO = new MemberDTO(loginVO);
        // 반환 실행
        return loginDTO;
    }

    public boolean register(MemberDTO param) {
        // DTO를 VO로 변환
        MemberVO vo = param.convertVO();

        // 아이디 중복 체크
        MemberVO existingMember = memberMapper.findById(vo.getId());  // DB에서 아이디로 회원 조회

        // 아이디가 이미 존재하면 회원가입 불가
        if (existingMember != null) {
            return false;  // 아이디 중복
        }

        // 새 회원 정보 DB에 저장
        memberMapper.insertMember(vo);

        return true;  // 회원가입 성공
    }


}









