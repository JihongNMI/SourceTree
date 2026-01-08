package org.zerock.frozenbbs.service;

import org.zerock.frozenbbs.dto.MemberDTO;

public interface MemberService {
    MemberDTO login(MemberDTO dto);

    boolean register(MemberDTO dto);
}
