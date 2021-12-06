<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<style>
#video {
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>
</head>
<body>
<div>
<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="https://www.youtube.com/embed/c0i88t0Kacs">
</video>
</div>
</body>
</html>