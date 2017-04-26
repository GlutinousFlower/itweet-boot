<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
    <title>List</title>
    <jsp:include page="../../tools/style/admin_style.jsp"></jsp:include>
    <link href="<%=basePath%>/style/admin/backstage/css/style.css" rel="stylesheet">
    <script>
        $(function() {
            $('#columnd').chosen({
                no_results_text: '木有找到匹配的项！'
            });
        });
    </script>
</head>
<body>
<div class="formbody">
    <div id="usual1" class="usual">
        <div id="tab2" class="tabson">
            <ul class="seachform">
                <form action="<%=basePath%>/admin/document/select" method="get">
                    <li>
                        <label>栏目查询</label>
                        <select id="columnd" name="columnd" style="width:160px;border-radius: 5px;" class="chosen-select-no-results" tabindex="10">
                            <option value="cover">封面</option>
                            <option value="article">文章</option>
                            <option value="index">首页</option>

                        </select>
                    </li>
                    <li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
                </form>
                <li><label>&nbsp;</label><a href="<%=basePath%>/admin/document/add"><input name="" type="button" class="scbtn" value="上传图片" /></a></li>
            </ul>
            <table class="tablelist">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>栏目</th>
                    <th>图片名称</th>
                    <th>图片别名</th>
                    <th>图片类型</th>
                    <th>上传时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${documentList.content}" var="document">
                    <tr>
                        <td>${document.id}</td>
                        <td>${document.columnd}</td>
                        <td>${document.filename}</td>
                        <td>${document.ruleFilename}</td>
                        <td>${document.type}</td>
                        <td>${document.date}</td>
                        <td>
                            <a href="<%=basePath%>/admin/document/edit/${document.id}" class="tablelink">修改</a>
                            <a href="<%=basePath%>/admin/document/delete/${document.id}" class="tablelink" onclick="return del()"> 删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <jsp:include page="../../tools/page/page2.jsp"></jsp:include>
        </div>
    </div>

</div>
</body>
</html>