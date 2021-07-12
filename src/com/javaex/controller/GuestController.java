package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestBookDao;
import com.javaex.vo.GuestBookVo;


@WebServlet("/gbc")
public class GuestController extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러");  //잘 실행되는지 확인
		
		
		//파라미터 Action 값을 읽어온다.
		String action = request.getParameter("action"); 
		System.out.println(action);
		
		
		if("addList".equals(action)) {
			
			
			//리스트업무
			System.out.println("[리스트 출력 확인OK]");
			
			//리스트
			GuestBookDao gBookDao = new GuestBookDao();
			List<GuestBookVo> guestList = gBookDao.getGuestList();
			
			System.out.println("=================Controller 실행 확인OK=================");
			System.out.println(guestList);
			
			//데이터를 어트리뷰트(속성)에 넣어줘야한다.
			request.setAttribute("gList", guestList); 	//게스트리스트를 "gList"라는 이름으로
			
			
			//html 작업한것을 jsp에게 시킨다. forward한다.
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/addList.jsp"); //WEB-INF에 넣는이유는 아무나 링크로 들어가지못하게!!
			rd.forward(request, response);
			
			
		} else if("add".equals(action)) {
			System.out.println("[게스트리스트 추가확인OK]");
			
			
			//파라미터를 꺼내오기
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			
			//Vo 생성자로 묶어주기
			GuestBookVo gBookVo = new  GuestBookVo(name, password, content);
			
			//등록해주기 위해 Dao 열고 넣어주기
			GuestBookDao gBookDao = new  GuestBookDao();
			gBookDao.guestInsert(gBookVo);
			
			//넣어준거 바로 보기위해 리다이렉트
			response.sendRedirect("/guestbook2/gbc?action=addList");
			
			
		} else if("dForm".equals(action)) {
			System.out.println("[게스트삭제폼 확인OK]");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/deleteForm.jsp");
			rd.forward(request, response);
			
			
		} else if("delete".equals(action)) {
			System.out.println("[게스트삭제 액션확인OK]");
			
			//받아온 파라미터 꺼내기
			int no = Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");
			
			//Delete 메소드에 담기위해 다오공간 열어주기
			GuestBookDao gBookDao = new GuestBookDao();
			gBookDao.goodDelete(no, password);
			
			//Delete한것 삭제됐는지 화면으로 보기위해 리다이렉트
			response.sendRedirect("/guestbook2/gbc?action=addList");
		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
