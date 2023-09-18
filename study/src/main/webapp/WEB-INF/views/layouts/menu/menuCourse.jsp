<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>

  <body>
    <div class="col-lg-3">
      <div class="shop__sidebar">
        <div class="shop__sidebar__search">
          <form action="#">
            <input type="text" placeholder="Search...">
            <button type="submit"><span class="icon_search"></span></button>
          </form>
        </div>
        <div class="shop__sidebar__accordion">
          <div class="accordion" id="accordionExample">
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseOne">IT</a>
              </div>
              <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__categories">
                    <ul class="nice-scroll">
                      <li><a href="#">JAVA (20)</a></li>
                      <li><a href="#">C (20)</a></li>
                      <li><a href="#">C# (20)</a></li>
                      <li><a href="#">C++ (20)</a></li>
                      <li><a href="#">Python (20)</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseTwo">English</a>
              </div>
              <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__brand">
                    <ul>
                      <li><a href="#">TOEIC</a></li>
                      <li><a href="#">TOEFL</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseFour">Grade</a>
              </div>
              <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__size">
                    <label for="xs">초급
                      <input type="radio" id="xs">
                    </label>
                    <label for="sm">중급
                      <input type="radio" id="sm">
                    </label>
                    <label for="md">고급
                      <input type="radio" id="md">
                    </label>
                    <label for="xl">xl
                      <input type="radio" id="xl">
                    </label>
                    <label for="2xl">2xl
                      <input type="radio" id="2xl">
                    </label>
                    <label for="xxl">xxl
                      <input type="radio" id="xxl">
                    </label>
                    <label for="3xl">3xl
                      <input type="radio" id="3xl">
                    </label>
                    <label for="4xl">4xl
                      <input type="radio" id="4xl">
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
              </div>
              <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__color">
                    <label class="c-1" for="sp-1">
                      <input type="radio" id="sp-1">
                    </label>
                    <label class="c-2" for="sp-2">
                      <input type="radio" id="sp-2">
                    </label>
                    <label class="c-3" for="sp-3">
                      <input type="radio" id="sp-3">
                    </label>
                    <label class="c-4" for="sp-4">
                      <input type="radio" id="sp-4">
                    </label>
                    <label class="c-5" for="sp-5">
                      <input type="radio" id="sp-5">
                    </label>
                    <label class="c-6" for="sp-6">
                      <input type="radio" id="sp-6">
                    </label>
                    <label class="c-7" for="sp-7">
                      <input type="radio" id="sp-7">
                    </label>
                    <label class="c-8" for="sp-8">
                      <input type="radio" id="sp-8">
                    </label>
                    <label class="c-9" for="sp-9">
                      <input type="radio" id="sp-9">
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-heading">
                <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
              </div>
              <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                  <div class="shop__sidebar__tags">
                    <a href="#">Product</a>
                    <a href="#">Bags</a>
                    <a href="#">Shoes</a>
                    <a href="#">Fashio</a>
                    <a href="#">Clothing</a>
                    <a href="#">Hats</a>
                    <a href="#">Accessories</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  </html>