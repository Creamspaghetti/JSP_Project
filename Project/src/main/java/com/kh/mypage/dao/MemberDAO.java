package com.kh.mypage.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public MemberDAO() {
		session = factory.openSession(true);
	}

	public MemberDTO getMemberById(String user_id) {
		return (MemberDTO)session.selectOne("Member.getMemberById",user_id);
	}

	public boolean updateMember(MemberDTO member) {
	    boolean result = false;
	    HashMap<String, Object> datas = new HashMap<>();
	    
	    // MemberDTO의 데이터를 HashMap에 저장
	    datas.put("userId", member.getUser_id());
	    datas.put("userName", member.getUser_name());
	    datas.put("userPw", member.getUser_pw());
	    datas.put("userAddress", member.getUser_address());
	    datas.put("userPhone", member.getUser_phone());
	    datas.put("userGender", member.getUser_gender());
	    
	    // SQL 쿼리 실행 및 영향을 받은 행 수 확인
	    if (session.update("Member.updateMember", datas) == 1) {
	        result = true; // 성공적으로 업데이트된 경우
	    }
	    
	    return result; // 결과 반환
	}
}
