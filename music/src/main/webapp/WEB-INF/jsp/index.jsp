<%@ page import="com.boot.music.entity.Document" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
      <div class="content">
        <div class="row">
          <div class="col-sm-6">
<%--            <h3>Column 1</h3>--%>
    <% List<Document> documents = (List<Document>) request.getAttribute("documents");
        for (Document document : documents) { %>
    <%if(document.getStatus()==3){%>
    <p><a href="<%= request.getContextPath() + "/documents/" + document.getId() %>"><%= document.getTitle() %></a></p>

              <%}}%>
          </div>
<%--          <div class="col-sm-6">--%>
<%--&lt;%&ndash;            <h3>Column 2</h3>&ndash;%&gt;--%>
<%--            <p>Nội dung...</p>--%>
<%--            <p>Nội dung...</p>--%>
<%--            <p>Nội dung...</p>--%>
<%--            <p>Nội dung...</p>--%>
<%--            <p>Nội dung...</p>--%>
<%--            <p>Nội dung...</p>--%>
<%--          </div>--%>
        </div>
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

    </div>
  </body>
</html>