<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Register</title>

        <!-- Custom fonts for this template-->
        <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>


    <body class="bg-gradient-primary">

        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>

                                <form class="user" method="post" action="memberRegist.do" onsubmit="return formCheck()"
                                    id="frm">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user" id="memberId"
                                                name="memberId" placeholder="ID">
                                            <button type="button" class="btn" id="doubleCheck" value="No">중복확인</button>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user" id="memberName"
                                                name="memberName" placeholder="Name">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user"
                                                name="memberPassword" id="memberPassword" placeholder="Password">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user" id="checkPass"
                                                placeholder="Repeat Password">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                            id="exampleInputEmail" name="memberEmail" placeholder="Email Address">
                                    </div>
                                    <div class="form-group">

                                        <input type="Address" class="form-control form-control-user"
                                            id="exampleInputEmail" name="memberAddress" placeholder="Address">
                                    </div>

                                    <button href="memberRegist.do" class="btn btn-primary btn-user btn-block"
                                        onclick="">
                                        Register Account
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="passwordsearch.do">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="login.do">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="admin/vendor/jquery/jquery.min.js"></script>
        <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="admin/js/sb-admin-2.min.js"></script>


        <script type="text/javascript">


            $('#doubleCheck').click(function () {

                $.ajax({
                    url: 'ajaxmembercheck.do',
                    method: 'post',
                    data: { memberId: document.getElementById("memberId").value },
                    success: function (data) {
                        var aa = JSON.parse(data);
                        var str = aa.str;
                        console.log(str)
                        //   let str 


                        if (str == "YES") {

                            alert("사용가능한 아이디입니다");
                            document.getElementById("doubleCheck").value = "Yes";
                            document.getElementById("doubleCheck").disabled = true;
                            console.log(str);
                        } else if (str == "NO") {
                            alert("이미 사용중인 아이디입니다");
                            document.getElementById("memberId").value = "";
                            document.getElementById("memberId").focus();
                            console.log(str);
                        }
                    },
                    error: function (result) {
                        console.log("오류났어요");
                    }
                })
            }
            )



            function formCheck() {
                let form = document.getElementById("frm");

                if (form.idCheck.value == 'No') {
                    alert("아이디 중복체크를 하세요.");
                    return false;
                }

                if (form.memberPassword.value != form.checkPass.value) {
                    alert("입력한 패스워드가 일치하지 않습니다.");
                    form.memberPassword.value = "";
                    form.checkPass.value = "";
                    form.memberPassword.focus();
                    return false;
                }

                return true;
            }
        </script>

    </body>

    </html>