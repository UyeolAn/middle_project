<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="client/css/community.css" type="text/css">
    <style type="text/css">
      input[type=text] {
        color: #333;
      }

      .input__file__btn {
        margin-top: 0 !important;
        margin-right: 1%;
        padding: 6px 15px;
        color: white;
        background: #88bdee;
        cursor: pointer;
        border-radius: 8px;
      }

      .input__file__btn:hover {
        background: #3188DB;
      }

      .active__input__file__btn {
        margin-top: 1%;
        padding: 6px 25px;
        color: white;
        background: #3188DB;
        cursor: pointer;
      }

      .active__input__file__btn:hover {
        background: #88bdee;
      }

      .small-btn {
        padding: 9px 20px;
      }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="client/js/jquery-3.3.1.min.js"></script>
  </head>

  <body>
    <div class="col-lg-12 container">
      <div class="contact__form">
        <form id="insertForm" action="boardinsert.do" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-lg-9">
              <input type="text" id="boardTitle" name="boardTitle" maxlength='99' placeholder="제목을 입력하세요..">
            </div>
            <div class="col-lg-12">
              <label class="input__file__btn"
                style="margin-top: 3%; border-radius: 8px; font-size: medium; font-weight: 900;">
                <i class="bi bi-image"></i>&nbsp;IMG
              </label>
              <input type="file" id="boardImg" name="boardImg" style="display: none;">
            </div>
            <div class="col-lg-12">
              <textarea id="boardContent" name="boardContent" maxlength="511" placeholder="내용을 입력하세요..."
                style="color: #333;"></textarea>
              <div class="col-lg-12 row">
                <button type="reset" class="site-btn"
                  style="padding: 5px 6px 5px 9px; background: #B7B7B7; border-radius: 8px; font-size: small;"><i
                    class="bi bi-arrow-repeat" style="font-size: x-large !important;"></i></button>
                <button type="button" class="site-btn small-btn" onclick="insertBoard()"
                  style="margin-left: 1%; padding: 9px 15px; background: #333; border-radius: 8px; font-size: small;"><i
                    class="bi bi-pencil"></i>&nbsp;등록</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
    <script>

      setInputFileBtn();

      // 게시글 등록 함수
      function insertBoard() {
        let insertData = convertToObject($("#insertForm").serializeArray());
        console.log(insertData.selectCourse);
        if (insertData.boardTitle != '' && insertData.boardContent != '') {
          $("#insertForm").submit();
        } else if (insertData.boardTitle == '') {
          alert('제목을 입력해주세요!!');
        } else if (insertData.boardContent == '') {
          alert('내용을 입력해주세요!!');
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
          $('#boardImg').click();
        });
        $('#boardImg').on('change', function () {
          if ($(this).parent().find('label').attr('class') == 'input__file__btn') {
            $(this).parent().find('label').attr('class', 'active__input__file__btn');
          } else if ($(this).parent().find('label').attr('class') == 'active__input__file__btn') {
            $(this).parent().find('label').attr('class', 'input__file__btn');
          }
        });
        $('.active__input__file__btn').on('click', function () {
          $('#boardImg').val('');
        });
      }

    </script>
  </body>

  </html>