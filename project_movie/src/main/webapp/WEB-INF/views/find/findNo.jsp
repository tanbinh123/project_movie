<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
	<link rel="stylesheet" href="/css/index_include.css" />
    <link rel="stylesheet" href="/css/find.css" />
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	
	<div class="container">
		<jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
     	<div class="wrap">
            <div class="main">
                <div class="main_component">
                    <div id="sub_list">
                    
                    
                    	<h1>Results for ""</h1>
                    
                  
                    	
                        
                        <div class="findSection">
                            <h3 class="findSectionHeader">Titles</h3>
                            <table class="findList">
                            
                            
                            </table>
                            
                        </div>
                        <div class="findSection">
                            <h3 class="findSectionHeader">Names</h3>
                            <table class="findList">
                                 
                            </table>
                        </div>
                        
                    </div>
                    
                </div>

            </div>
            
        </div>
        <jsp:include page="../include/index_include/index_footer.jsp"></jsp:include>
       
	</div>
    <script
      src="https://kit.fontawesome.com/a04df2c0ca.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/header.js"></script>
</body>
</html>