<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style type="text/css">
        input[type=text] {
          color: #333;
        }

        .input__file__btn {
          margin-top: 1%;
          padding: 6px 25px;
          color: white;
          background: #B7B7B7;
          cursor: pointer;
        }

        .input__file__btn:hover {
          background: #A7A7A7;
        }

        .active__input__file__btn {
          margin-top: 1%;
          padding: 6px 25px;
          color: white;
          background: #E53637;
          cursor: pointer;
        }

        .active__input__file__btn:hover {
          background: #ffa9a9;
        }

        .small-btn {
          padding: 9px 20px;
        }

        .list {
          max-height: 200px;
          overflow-y: scroll !important;
        }
      </style>
      <link rel="stylesheet" href="client/css/nice-select.css">
      <script src="client/js/jquery.nice-select.min.js"></script>
      <script src="client/js/jquery-3.3.1.min.js"></script>
    </head>

    <body>
      <div class="col-lg-12 container">
        <div class="contact__form">
          <form id="insertForm" action="questioninsert.do" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="col-lg-9">
                <input type="text" id="questionTitle" name="questionTitle" placeholder="제목을 입력하세요.."
                  style="margin-bottom: 1%;">
              </div>
              <div class="col-lg-9">
                <select name="selectCourse" id="selectCourse">
                  <option value="notSelect">========== 어떤 강의에 대한 질문인가요? ==========</option>
                  <c:if test="${not empty courses}">
                    <c:forEach var="course" items="${courses}">
                      <option value="${course.courseId}">${course.courseName}</option>
                    </c:forEach>
                  </c:if>
                  <option value="etc">기타/홈페이지 질문</option>
                </select>
              </div>
              <div class="col-lg-12">
                <label class="input__file__btn" style="margin-top: 3%; border-radius: 10px; font-size: medium;">
                  IMG
                </label>
                <input type="file" id="questionImg" name="questionImg" style="display: none;">
              </div>
              <div class="col-lg-12">
                <textarea id="questionContent" name="questionContent" placeholder="내용을 입력하세요..."
                  style="color: #333;"></textarea>
                <button type="reset" class="site-btn small-btn"
                  style="font-size: medium; background: #B7B7B7; border-radius: 10px;">취소</button>
                <button type="button" class="site-btn small-btn" onclick="insertQuestion()"
                  style="font-size: medium; border-radius: 10px;">등록</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <script>

        $(document).ready(function () {
          $('select').niceSelect('update');
        });
        setInputFileBtn();

        // 질문 등록 함수
        function insertQuestion() {
          let insertData = convertToObject($("#insertForm").serializeArray());
          console.log(insertData.selectCourse);
          if (insertData.selectCourse != 'notSelect') {
            $("#insertForm").submit();
          } else {
            alert('강의를 선택해주세요!!');
          }
        }

        // Form 데이터 -> Javascript Object 변환 함수
        function convertToObject(arrayData) {
          let object = {};
          for (let i = 0; i < arrayData.length; i++) {
            object[arrayData[i]['name']] = arrayData[i]['value'];
          }
          return object;
        }

        function setInputFileBtn() {

          $('.input__file__btn').on('click', function () {
            $('#questionImg').click();
          });
          $('#questionImg').on('change', function () {
            if ($(this).parent().find('label').attr('class') == 'input__file__btn') {
              $(this).parent().find('label').attr('class', 'active__input__file__btn');
            } else if ($(this).parent().find('label').attr('class') == 'active__input__file__btn') {
              $(this).parent().find('label').attr('class', 'input__file__btn');
            }
          });
          $('.active__input__file__btn').on('click', function () {
            $('#questionImg').val('');
          });
        }

      </script>
    </body>

    </html>