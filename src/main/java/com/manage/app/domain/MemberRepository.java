package com.manage.app.domain;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

//public interface MemberRepository   {
public interface MemberRepository extends JpaRepository<Member, String> {

	public Member findOne(String id);

	public List<Member> findAll(Sort sort);

}
