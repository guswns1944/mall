<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	//로그인 중에 회원가입 파일을 접근할 경우
	if(session.getAttribute("loginMemberEmail")!=null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		//리턴은 강제로 끝내는 문장
		return;
	}
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	//회원가입이 가능한 이메일인지 확인
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	//member가 비어있지 않는다면 이미 가입된 이메일
	if(member!=null){
		System.out.println("이미 사용중인 이메일 입니다.");
		response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
		return;
	}
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	memberDao.insertMember(paramMember);

	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>