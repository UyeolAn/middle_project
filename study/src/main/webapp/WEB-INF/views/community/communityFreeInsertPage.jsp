<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    </style>
    <script src="client/js/jquery-3.3.1.min.js"></script>
  </head>

  <body>
    <div class="col-lg-12 container">
      <div class="contact__form">
        <form action="boardinsert.do" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-lg-9">
              <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요..">
            </div>
            <div class="col-lg-12">
              <label class="input__file__btn" style="border-radius: 10px; font-size: medium;">
                IMG
              </label>
              <input type="file" id="boardImg" name="boardImg" style="display: none;">
            </div>
            <div class="col-lg-12">
              <textarea id="boardContent" name="boardContent" placeholder="내용을 입력하세요..."
                style="color: #333;"></textarea>
              <button type="reset" class="site-btn small-btn"
                style="font-size: medium; background: #B7B7B7; border-radius: 10px;">취소</button>
              <button type="submit" class="site-btn small-btn"
                style="font-size: medium; border-radius: 10px;">등록</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <script>

      setInputFileBtn();

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