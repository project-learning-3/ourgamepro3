<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.game.common.Utility"%>
<%@page import="com.game.game.model.GameVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int d_no = (int)session.getAttribute("d_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="gv" class="com.game.game.model.GameVO" scope="page"></jsp:useBean>
<jsp:useBean id="gs" class="com.game.game.model.GameService" scope="session"></jsp:useBean>
<%
	//이미지 업로드
	String saveDir = application.getRealPath(Utility.UPLOAD_PATH);
	System.out.println(saveDir);
	int maxSize=2*1024*1024;  //업로드파일의 최대 크기, 2M
	String encoding="utf-8";
	
	System.out.println(saveDir);
	
	String msg = "등록실패", url = "gameInsert_before.jsp";
	try{
		//업로드
		MultipartRequest mr
		=new MultipartRequest(request, saveDir, maxSize, encoding,
				new DefaultFileRenamePolicy());
		System.out.println("업로드 완료!");
		//업로드파일정보
		String fileName=mr.getFilesystemName("src");
		long fileSize=0;
		String originalFName="";
		if(fileName!=null){  //파일이 첨부된 경우만
			File file=mr.getFile("src");
			fileSize=file.length();
			
			originalFName=mr.getOriginalFileName("src");
		}
		
		//요청파라미터 읽어오기
		String gname = mr.getParameter("gname");
		String price = mr.getParameter("price");
		String gtext = mr.getParameter("gtext");
		String c_no = mr.getParameter("c_no");
		String src = fileName;
		
		System.out.println(gname+" "+price+" "+gtext+" "+c_no+" "+src);
		
		//db
		gv.setD_no(d_no);
		gv.setGname(gname);
		gv.setGtext(gtext);
		gv.setPrice(Integer.parseInt(price));
		gv.setC_no(Integer.parseInt(c_no));
		gv.setSrc(src);
		int result = gs.insertGame(gv);
		
		if(result > 0){
			msg = "게임등록성공";
			url = "../html/home.jsp";
		}
	} catch(SQLException e){
		e.printStackTrace();
	} catch(IOException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>