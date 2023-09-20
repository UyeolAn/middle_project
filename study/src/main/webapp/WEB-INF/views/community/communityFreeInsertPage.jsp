<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
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
    </style>
  </head>

  <body>
    <div class="col-lg-12 container">
      <div class="contact__form">
        <form action="boardinsert.do" method="post">
          <div class="row">
            <div class="col-lg-9">
              <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요..">
            </div>
            <div class="col-lg-12">
              <label class="input__file__btn" for="boardImg">
                IMG
              </label>
              <input type="file" id="boardImg" name="boardImg" style="display: none;">
            </div>
            <div class="col-lg-12">
              <textarea id="boardContent" name="boardContent" placeholder="내용을 입력하세요..."></textarea>
              <button type="reset" class="site-btn" style="font-size: medium; background: #B7B7B7;">취소</button>
              <button type="submit" class="site-btn" style="font-size: medium;">등록</button>  
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>

  </html>