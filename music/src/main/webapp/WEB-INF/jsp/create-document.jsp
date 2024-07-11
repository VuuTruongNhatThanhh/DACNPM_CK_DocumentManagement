<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="admin-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tạo tài liệu</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Tạo tài liệu</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Tạo tài liệu</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-outline card-info">
                    <div class="card-header">
<%--                        <h3 class="card-title">Văn bản</h3>--%>
                    </div>
                    <div class="card-body">
                        <div class="container">
                            <form id="document-form">
<%--                                <div class="document-filter">--%>
<%--                                    <label for="document-type">Loại tài liệu:</label>--%>
<%--                                    <select id="document-type" name="document-type" class="form-control">--%>
<%--                                        <option value="all">All</option>--%>
<%--                                        <option value="pdf">PDF</option>--%>
<%--                                        <option value="doc">DOC</option>--%>
<%--                                        <option value="txt">TXT</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="government-filter">--%>
<%--                                    <label for="government">Chính phủ:</label>--%>
<%--                                    <select id="government" name="government" class="form-control">--%>
<%--                                        <option value="all">All</option>--%>
<%--                                        <option value="local">Local</option>--%>
<%--                                        <option value="state">State</option>--%>
<%--                                        <option value="federal">Federal</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <label for="title">Tiêu đề:</label>
                                    <input type="text" id="title" name="title" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="summary">Nội dung:</label>
                                    <textarea id="summary" name="summary" class="form-control" rows="4" required></textarea>
                                </div>
                                <div class="form-group btn-group">
                                    <button id="cancel-document-button" type="reset" class="btn btn-secondary">Cancel</button>
                                    <button id="create-document-button" type="submit" class="btn btn-primary">Confirm</button>
                                </div>
                                <div id="success-message" style="display: none;" class="alert alert-success">Tạo tài liệu thành công!</div>
                            </form>
                        </div>
                    </div>
<%--                    <div class="card-footer">Hướng dẫn sử dụng</div>--%>
                </div>
            </div>
        </div>
    </section>
</div>
</body>

<jsp:include page="footer.jsp"/>

<aside class="control-sidebar control-sidebar-dark"></aside>
<script src="../plugins/jquery/jquery.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../js/adminlte.min.js"></script>
<script src="../plugins/summernote/summernote-bs4.min.js"></script>
<script src="../plugins/codemirror/codemirror.js"></script>
<script src="../plugins/codemirror/mode/css/css.js"></script>
<script src="../plugins/codemirror/mode/xml/xml.js"></script>
<script src="../plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    $(document).ready(function() {
        $('#document-form').submit(function(event) {
            event.preventDefault(); // Ngăn chặn gửi form mặc định

            var title = $('#title').val();
            var summary = $('#summary').val();

            $.ajax({
                type: 'POST',
                url: '/createDocument',
                data: {
                    title: title,
                    summary: summary
                },
                success: function(response) {
                    $('#success-message').html('Tạo tài liệu thành công!').fadeIn().delay(3000).fadeOut(); // Hiển thị thông báo thành công và ẩn đi sau 3 giây
                    $('#document-form')[0].reset(); // Xóa nội dung form sau khi gửi thành công

                    // Chuyển hướng sang trang /documents
                    window.location.href = '/mydocuments';
                },
                error: function(xhr, status, error) {
                    console.error('Lỗi:', error);
                }
            });
        });

        $('#cancel-document-button').click(function() {
            $('#document-form')[0].reset(); // Xóa nội dung form khi bấm nút Hủy
        });
    });
</script>
</html>
