<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>회원가입!</title>

        <!-- Custom fonts for this template-->
        <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <style>
            .small {
                color: #727272;
            }

            .btn {
                background-color: #999999;
                border-color: #999999;
                color: #fff;

            }

            .bg-gradient-primary {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100dvh;
                background-color: #f1f0ff;
                background-image: none;
            }

            .btmagin4 {
                margin-bottom: 4px;
            }

            .col-lg-7 {
                flex: none;
                max-width: 75%;
                margin: 0 auto;
            }

            input[type="number"]::-webkit-outer-spin-button,
            input[type="number"]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>

    <body class="bg-gradient-primary">

        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">

                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">회원가입!</h1>
                                </div>

                                <form class="user" method="post" action="memberRegist.do" onsubmit="return formCheck()"
                                    id="frm">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0 ">
                                            <input type="text" class="form-control form-control-user btmagin4"
                                                id="memberId" name="memberId" placeholder="ID" maxlength="20"
                                                spellcheck="false">
                                            <button type="button" class="small btn btn-primary btn-user" id="doubleCheck" value="No"
                                                style="float: right;">중복확인</button>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user" id="memberName"
                                                name="memberName" placeholder="Name" maxlength="10" spellcheck="false">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user"
                                                name="memberPassword" id="memberPassword" placeholder="Password"
                                                maxlength="50">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user" id="checkPass"
                                                placeholder="Repeat Password" maxlength="50">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                            id="exampleInputEmail" name="memberEmail" placeholder="Email Address"
                                            maxlength="70">
                                    </div>
                                    <div class="form-group">
                                        <input type="number" class="form-control form-control-user" id="exampleInputEmail"
                                            name="memberTel" placeholder="Phon Number" maxlength="20">
                                    </div>
                                    <div class="form-group">

                                        <div class="form-group">
                                            <label class="font-weight-bold">주소</label><br>
                                            <input type="text" id="sample6_postcode" class="form-control mb-2"
                                                style="display: inline; width: 50%;" placeholder="우편번호" readonly
                                                required>
                                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                                                class="small btn btn-primary btn-user"><br>
                                            <input type="text" id="sample6_address" class="form-control mb-2"
                                                style="width: 100%; display: inline;" name="address1" placeholder="주소"
                                                required readonly>
                                            <div class="row mb-2" style="width: 101%; margin-left: 0;">
                                                <input type="text" id="sample6_detailAddress"
                                                    class="form-control col-lg-6" style="width: 50%; display: inline;"
                                                    name="address2" placeholder="상세주소" required maxlength="30"><!--
                                            --><input type="text" id="sample6_extraAddress"
                                                    class="form-control col-lg-6" style="width: 50%; display: inline;"
                                                    name="address3" placeholder="참고항목" maxlength="30">
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-primary btn-user btn-block">
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

            //중복체크 버튼 클릭시 서블릿에 id체크
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
                        console.log("err");
                    }
                })
            }
            )


            //submit 버튼 작동시 중복체크 실행 여부 
            //패스워드 불일치 여부 확인
            function formCheck() {
                let form = document.getElementById("frm");

                if (form.idCheck.value == 'No') {
                    alert("아이디 중복체크를 하세요.");
                    return false;
                }

                if (form.memberPassword.value != form.checkPass.value) {
                    alert("입력한 패스워드가 일치하지 않습니다.");
                    form.memberPassword.value = '';
                    form.checkPass.value = '';
                    form.memberPassword.focus();
                    return false;
                }
            }
        </script>

    </body>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>


        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    </html>