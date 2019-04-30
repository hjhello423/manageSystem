package com.manage.app.member.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

//public interface MemberRepository   {
public interface MemberRepository extends JpaRepository<Member, String> {

	public Member findOne(String id);

	public List<Member> findAll(Sort sort);

	public Member findByMemIdAndMemPw(String id, String pw);
	
	public Member findByMemId(String id);

	@Modifying
	@Query(value = "insert into member (id, pwd) values(?1, ?2)", nativeQuery = true)
//	@Query(value = "select * from member where id=?1 or pwd=?2", nativeQuery = true)
	public void memberInsert(String memId, String memPw);

}
