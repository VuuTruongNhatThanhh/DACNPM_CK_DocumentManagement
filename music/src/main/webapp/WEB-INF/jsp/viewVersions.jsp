<%@ page import="com.boot.music.entity.VersionDocument" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Danh sách các phiên bản</title>
  <!-- CSS -->
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f0f0f0;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 1200px;
      margin: 20px auto;
      padding: 0 20px;
    }
    h1 {
      text-align: center;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      background-color: #fff;
      border-collapse: collapse;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
    }
    tr:hover {
      background-color: #f5f5f5;
    }
    /*footer.main-footer {*/
    /*  background-color: #343a40;*/
    /*  color: #fff;*/
    /*  text-align: center;*/
    /*  padding: 10px;*/
    /*  position: fixed;*/
    /*  bottom: 0;*/
    /*  width: 100%;*/
    /*}*/
    .control-sidebar {
      position: fixed;
      right: 0;
      top: 0;
      bottom: 0;
      width: 250px;
      background-color: #343a40;
      color: #fff;
      padding: 15px;
    }
    .control-sidebar h5 {
      color: #fff;
      margin-top: 0;
      border-bottom: 1px solid #ddd;
      padding-bottom: 5px;
    }
    .control-sidebar ul {
      list-style-type: none;
      padding: 0;
    }
    .control-sidebar li {
      margin-bottom: 10px;
    }
    .control-sidebar li a {
      color: #fff;
      text-decoration: none;
      display: block;
    }
    .control-sidebar li a:hover {
      text-decoration: underline;
    }
  </style>
  <!-- End CSS -->

  <!-- Bootstrap 4 -->
  <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <!-- AdminLTE App -->
  <link rel="stylesheet" href="../css/adminlte.min.css">
</head>
<body>
<div class="wrapper">

  <!-- Header -->
  <%@ include file="admin-header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <div class="container">
      <h1 style="font-size: 30px; padding-top: 10px">Danh sách các phiên bản của tài liệu</h1>
      <table class="table">
        <thead>
        <tr>
          <th>Phiên bản</th>
          <th>Tiêu đề</th>
          <th>Tóm tắt</th>
          <th>Thời gian cập nhật</th>
        </tr>
        </thead>
        <tbody>
        <%  DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
          DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("HH:mm:ss dd/MM/yyyy");

          List<VersionDocument> versions = (List<VersionDocument>) request.getAttribute("versions");
          for (int i = versions.size() - 1; i >= 0; i--) {
            VersionDocument version = versions.get(i);
            String formattedUpdatedAt = version.getUpdatedAt().format(outputFormatter);
        %>
        <tr>
          <td><%= version.getVersionName() %></td>
          <td><%= version.getTitle() %></td>
          <td><%= version.getSummary() %></td>
          <td><%= formattedUpdatedAt %></td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Footer -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>DACNPM</b>
    </div>
    <strong>Copyright &copy; 2024 Chinhphu.vn.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <div class="p-3">
      <h5>Thông tin liên hệ</h5>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-envelope"></i> Email: info@chinhphu.vn
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-phone"></i> Điện thoại: 123-456-789
          </a>
        </li>
      </ul>
    </div>
  </aside>
  <!-- /.control-sidebar -->

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../js/adminlte.min.js"></script>
</body>
</html>
