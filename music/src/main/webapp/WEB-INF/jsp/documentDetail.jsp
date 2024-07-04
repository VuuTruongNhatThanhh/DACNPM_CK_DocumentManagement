<%@ page import="com.boot.music.entity.Document" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--

  Created by IntelliJ IDEA.
  User: HP
  Date: 3/7/2024
  Time: 9:12 pm
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Chi tiết công văn</title>
</head>
<%@ include file="header.jsp" %>
<body >
<div style="height: 400px">
<%  Document document = (Document) request.getAttribute("document");;

   %>
<h1 style="text-align: center">${document.title}</h1>
<p style="padding-left: 116px;font-size: 15px; padding-top: 15px">${document.sumary}</p>
</div>
<div class="footer">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr>
            <td>
                <div class="UIFooterControl">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="head">
                                <div>
                                    <h2>
                                        <span>Cổng Thông tin điện tử Chính phủ </span>
                                    </h2>
                                    <p>Tổng Giám đốc: <strong> Nguyễn Hồng Sâm </strong>
                                    </p>
                                </div>
                            </div>
                            <p>Trụ sở: 16 Lê Hồng Phong - Ba Đình - Hà Nội.</p>
                            <p>Điện thoại: Văn phòng: 080 43162; Fax: 080.48924</p>
                        </div>
                        <div class="col-sm-6">
                            <%--                      <p>Nội dung...</p>--%>
                            <%--                      <p>Nội dung...</p>--%>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center">
                            <p>Copyright © 2024. </p>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
