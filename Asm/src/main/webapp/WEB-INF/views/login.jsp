<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Modal -->
<div class="modal fade align-items-center justify-content-center" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content p-3">
                <div class="modal-header border-dark border-3">
                    <h5 class="modal-title fw-bold" id="loginModalLabel">LOGIN</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/account/login" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" value="${cookie.username.value}" placeholder="Username">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" value="${cookie.password.value}" placeholder="Password">
                        </div>
                        <div class="mb-3 form-check">
                            <c:choose>
                                <c:when test="${cookie.remember == null}">
                                    <input type="checkbox" class="form-check-input" id="remember" name="remember" value="true">
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" class="form-check-input" id="remember" checked name="remember" value="true">
                                </c:otherwise>
                            </c:choose>
                            <label class="form-check-label" for="remember">Remember me?</label>
                        </div>
                        <button type="submit" class="btn btn-dark w-100 mt-2">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#loginModal').modal('show');

            <% if (request.getAttribute("message") != null) { %>
                let alertType = "<%= request.getAttribute("alertType") %>";
                let message = "<%= request.getAttribute("message") %>";
                let alertDiv = '<div class="alert alert-' + alertType + ' alert-dismissible fade show" role="alert">' +
                    message +
                    '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                    '</div>';
                $('body').prepend(alertDiv);
            <% } %>
        });
    </script>
</body>
</html>
