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

      .delete__file__btn {
        margin-top: 0 !important;
        margin-right: 1%;
        padding: 6px 15px;
        color: white;
        background: #aaa;
        cursor: pointer;
        border-radius: 8px;
      }

      .small-btn {
        padding: 9px 20px;
        border-radius: 10px;
      }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="client/js/jquery-3.3.1.min.js"></script>
  </head>

  <body>
    <div class="col-lg-12 container">
      <div class="contact__form">
        <form action="questionupdate.do" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-lg-9">
              <input type="text" id="questionTitle" name="questionTitle" placeholder="제목을 입력하세요.."
                value="${question.questionTitle}">
            </div>
            <div class="col-lg-12">
              <label class="input__file__btn"
                style="margin-top: 3%; border-radius: 8px; font-size: medium; font-weight: 900;">
                <i class="bi bi-image"></i>&nbsp;IMG
              </label>
              <label class="delete__file__btn"
                style="margin-top: 3%; border-radius: 8px; font-size: medium; font-weight: 900;">
                <i class="bi bi-trash" style="font-size: large !important;"></i>
              </label>
              <input type="file" id="questionImg" name="questionImg" style="display: none;">
            </div>
            <div class="col-lg-12">
              <textarea id="questionContent" name="questionContent" placeholder="내용을 입력하세요..."
                style="color: #333;">${question.questionContent}</textarea>
              <div class="row col-lg-12">
                <button type="reset" class="site-btn"
                  style="padding: 5px 6px 5px 9px; background: #B7B7B7; border-radius: 8px; font-size: small;"><i
                    class="bi bi-arrow-repeat" style="font-size: x-large !important;"></i></button>
                <button type="submit" class="site-btn"
                  style="margin-left: 1%; padding: 9px 15px; background: #333; border-radius: 8px; font-size: small;"><i
                    class="bi bi-pencil"></i>&nbsp;수정</button>
              </div>
            </div>
            <input type="hidden" id="questionId" name="questionId" value="${question.questionId}">
          </div>
        </form>
      </div>
    </div>
    <script>
      setInputFileBtn();
      setDeteleFileBtn();

      function setInputFileBtn() {
        $('.input__file__btn').on('click', function () {
          $('#questionImg').click();
        });
      }

      function setDeteleFileBtn() {
        $('.delete__file__btn').on('click', function () {
          alert('이미지를 삭제하였습니다');
          $('#questionImg').val('');
        });
      }
    </script>
  </body>

  </html>