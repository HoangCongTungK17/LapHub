<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Dự án laptopshop" />

                <title> User</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({
                                "display": "block"
                            });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">

                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>User</h3>
                                        <hr />
                                        <form:form method="post" action="/account-management" modelAttribute="newUser"
                                            class="row" enctype="multipart/form-data">
                                            <div class="mb-3" style="display: none;">
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                            <input type="hidden" name="email" value="${newUser.email}" />
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorEmail">
                                                    <form:errors path="email" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Email:</label>
                                                <form:input type="email"
                                                    class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                    path="email" disabled="true" />
                                                ${errorEmail}
                                            </div>
                                            <input type="hidden" name="password" value="${newUser.password}" />
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Phone number:</label>
                                                <form:input type="text" class="form-control" path="phone" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorFullName">
                                                    <form:errors path="fullName" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Full Name:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                    path="fullName" />
                                                ${errorFullName}
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label class="form-label">Address:</label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Role:</label>
                                                <form:select class="form-select" path="role.name">
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="hoangtungFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>
                                            <div class="col-12 mb-5">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </form:form>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </main>

                </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous">
                    </script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>