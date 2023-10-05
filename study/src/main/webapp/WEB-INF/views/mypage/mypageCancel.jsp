<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>STUDY</title>
        <style>
            .cancelbtn {
                width: 100px;
                margin-right: 15px;

            }
        </style>
    </head>

    <body>

        <h3>회원탈퇴 하시겠습니까</h3>
        <br>
        <table style="border: none;">
            <tr>
                <td>
                    <a class="btn btn-secondary btn-icon-split cancelbtn" type="button" href="mypagemain.do"
                        id="cancelcancel">
                        <span class="text">아니오</span>
                    </a>
                </td>
                <td>
                    <a class="btn btn-danger btn-icon-split cancelbtn" id="cancelsub" onclick="memberCancel()">
                        <span class="text ">예</span>
                    </a>
                </td>
            </tr>
        </table>
        <script>
            function memberCancel() {
                alert("계정이 삭제되었습니다");


                location.href="membercancel.do"
            }
        </script>
        <script>
            let lgck = `${loginId}`;
            if (lgck = null) {
                alert("로그인을 해주세요")
                location.href = "home.do"
            }
        </script>
    </body>

    </html>