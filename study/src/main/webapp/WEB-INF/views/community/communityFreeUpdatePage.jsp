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
        border-radius: 10px;
      }

      .input__file__btn:hover {
        background: #A7A7A7;
      }

      .delete__file__btn {
        margin-top: 1%;
        padding: 6px 25px;
        color: white;
        background: #B7B7B7;
        cursor: pointer;
        border-radius: 10px;
      }

      .delete__file__btn:hover {
        background: #A7A7A7;
      }

      .small-btn {
        padding: 9px 20px;
        border-radius: 10px;
      }
    </style>
    <script src="client/js/jquery-3.3.1.min.js"></script>
  </head>

  <body>
    <div class="col-lg-12 container">
      <div class="contact__form">
        <form action="boardupdate.do" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-lg-9">
              <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요.."
                value="${board.boardTitle}">
            </div>
            <div class="col-lg-12">
              <label class="input__file__btn" style="margin-top: 3%; border-radius: 10px; font-size: medium;">
                IMG
              </label>
              <label class="delete__file__btn" style="margin-top: 3%; border-radius: 10px; font-size: medium;">
                DEL
              </label>
              <input type="file" id="boardImg" name="boardImg" style="display: none;">
            </div>
            <div class="col-lg-12">
              <textarea id="boardContent" name="boardContent" placeholder="내용을 입력하세요..."
                style="color: #333;">${board.boardContent}</textarea>
              <button type="reset" class="site-btn small-btn"
                style="font-size: medium; background: #B7B7B7;">취소</button>
              <button type="submit" class="site-btn small-btn" style="font-size: medium;">수정</button>
            </div>
            <input type="hidden" id="boardId" name="boardId" value="${board.boardId}">
          </div>
        </form>
      </div>
    </div>
    <script>
      setInputFileBtn();
      setDeteleFileBtn();

      function setInputFileBtn() {
        $('.input__file__btn').on('click', function () {
          $('#boardImg').click();
        });
      }

      function setDeteleFileBtn() {
        $('.delete__file__btn').on('click', function () {
          alert('이미지를 삭제하였습니다');
          $('#boardImg').val('');
        });
      }
    </script>
  </body>

  </html>