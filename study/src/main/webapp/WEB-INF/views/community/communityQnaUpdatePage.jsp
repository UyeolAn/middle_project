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

      .small-btn {
        padding: 9px 20px;
        border-radius: 10px;
      }
    </style>
  </head>

  <body>
    <div class="col-lg-12 container">
      <div class="contact__form">
        <form action="questionupdate.do" method="post">
          <div class="row">
            <div class="col-lg-9">
              <input type="text" id="questionTitle" name="questionTitle" placeholder="제목을 입력하세요.."
                value="${question.questionTitle}">
            </div>
            <div class="col-lg-12">
              <label class="input__file__btn" for="questionImg">
                IMG
              </label>
              <input type="file" id="questionImg" name="questionImg" style="display: none;">
            </div>
            <div class="col-lg-12">
              <textarea id="questionContent" name="questionContent" placeholder="내용을 입력하세요..."
                style="color: #333;">${question.questionContent}</textarea>
              <button type="reset" class="site-btn small-btn"
                style="font-size: medium; background: #B7B7B7;">취소</button>
              <button type="submit" class="site-btn small-btn" style="font-size: medium;">수정</button>
            </div>
            <input type="hidden" id="questionId" name="questionId" value="${question.questionId}">
          </div>
        </form>
      </div>
    </div>
  </body>

  </html>