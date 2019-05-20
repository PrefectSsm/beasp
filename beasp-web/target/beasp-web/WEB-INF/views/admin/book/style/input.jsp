<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>书籍样式添加与修改界面-书籍交换与分享平台</title>

    <!-- Bootstrap -->
    <link href="<%=cssPath %>/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cssPath %>/font-awesome.min.css" rel="stylesheet">
	<link href="<%=cssPath %>/admin/common.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/adminNav.jsp"></jsp:include>
	
	<!-- 内容开始 -->
	
	<section class="content-wrap">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="/WEB-INF/views/common/asideNav.jsp"></jsp:include>
				<div class="col-md-10 main-content">
				
					<c:set value="${pageContext.request.contextPath }/admin/book/style" var="url"></c:set>
					<c:if test="${!empty style.id }">
						<c:set value="${pageContext.request.contextPath }/admin/book/style/${style.id}" var="url"></c:set>
					</c:if>
					
					<h3 class="page-header">书籍样式<c:if test="${!empty style.id }">修改</c:if><c:if test="${empty style.id }">添加</c:if></h3>
					<div class="jumbotron">
						<form:form action="${url }" method="POST" modelAttribute="style" 
							class="form-horizontal" id="form" enctype="multipart/form-data">
							
							<input type="hidden" name="bookId" value="${bookId }"/>
							
							<c:if test="${!empty style.id }">
								<form:hidden path="id"/>
								<!-- <input type="hidden" name="_method" value="PUT"/> -->
								<form:hidden path="book.id"/>
							</c:if>
							
							<div class="form-group">
								<label for="imageName" class="col-sm-2 control-label">书籍样式图片</label>
								<div class="col-sm-5">
									<input type="file" name="image" id="imageName" placeholder="书籍样式图片" required="required"/>
								</div>
								<label>${imageErrorMsg }</label>
							</div>
							
							<c:if test="${!empty style.id}">
								<div class="form-group">
									<div class="col-sm-5 col-sm-offset-2">
										<img alt="" src="<%=beaspPath %>${style.imageFullPath }" width="50px">
									</div>
									<label>${imageErrorMsg }</label>
								</div>
							</c:if>
							
							<%-- <div class="form-group">
								<label for="share" class="col-sm-2 control-label">样式是否选中</label>
								<div class="col-sm-5">
									<form:radiobutton path="choice" id="share" value="true" />是
									<form:radiobutton path="choice" value="false" />否
								</div>
							</div> --%>
 							
							<div class="form-group">
	    						<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" value="添加"/>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 内容结束 -->
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="<%=jsPath %>/jquery-2.1.4.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="<%=jsPath %>/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=jsPath %>/core/jquery.beasp.core.js"></script>
	<script type="text/javascript" src="<%=jsPath %>/admin/common.js"></script>
</body>
</html>