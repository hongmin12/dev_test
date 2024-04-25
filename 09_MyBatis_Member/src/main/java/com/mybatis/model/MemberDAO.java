package com.mybatis.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
	
	// 회원 전체 리스트를 호출하는 추상 메서드.
	List<Member> getMemberList();
	
	// 회원을 추가하는 추상 메서드.
	int insertMember(Member dto);
	
	// 한 회원의 정보를 호출하는 추상 메서드.
	Member getMember(int num);
	
	// 한 회원의 정보를 수정하는 추상 메서드.
	int updateMember(Member dto);
	
	// 한 회원의 정보를 삭제하는 추상 메서드.
	int deleteMember(int num);
	
	// 회원 번호를 재작업 하는 추상 메서드.
	void updateSequence(int num);
	
	// 검색하는 추상 메서드.
	List<Member> searchMemberList(Map<String, String> map);
	
}
