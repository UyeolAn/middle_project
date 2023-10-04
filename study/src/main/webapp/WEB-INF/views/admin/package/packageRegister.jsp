<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="section-body container py-5">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">&#127881;패키지 등록&#127881;</h1>
        <p class="mb-4">
            등록할 패키지의 정보를 입력해주세요.
        </p>
            <div class="row">
              <div class="col-12 col-md-6 col-lg-12">
                <div class="card">
                  <div class="card-header">
                    <h6 class="m-0 font-weight-bold text-primary">New Package</h6>
                  </div>
                  <div class="card-body">
                    <form id="frm" action="adminpackageinsert.do" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                      <label class="font-weight-bold">패키지 이름</label>
                      <input type="text" class="form-control" name="packageTitle" required>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">패키지 설명</label>
                        <textarea class="form-control" name="packageScript" required></textarea>
                    </div>
                      <div class="col-lg-12 row">
                    <div class="form-group col-lg-6">
                      <label class="font-weight-bold">패키지 할인율 (%)</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <div class="input-group-text">
                            <i class="fa fa-credit-card"></i>
                          </div>
                        </div>
                        <input type="text" class="form-control" name="packageDiscount" required>
                      </div>
                    </div>
                    <div class="form-group col-lg-6">
                        <label class="font-weight-bold">카테고리</label>
                        <select class="form-control select2 main" id="courseMainCategory" name="packageCategory">
                            <option value="it">IT</option>
                            <option value="english">ENGLISH</option>
                            <option value="career">CAREER</option>
                        </select>
                    </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label font-weight-bold">난이도</label>
                        <div class="selectgroup w-100">
                          <label class="selectgroup-item">
                            <input type="radio" name="packageGrade" value="easy" class="selectgroup-input" checked="">
                            <span class="selectgroup-button">초급</span>
                          </label>
                          <label class="selectgroup-item">
                            <input type="radio" name="packageGrade" value="normal" class="selectgroup-input">
                            <span class="selectgroup-button">중급</span>
                          </label>
                          <label class="selectgroup-item">
                            <input type="radio" name="packageGrade" value="hard" class="selectgroup-input">
                            <span class="selectgroup-button">고급</span>
                          </label>
                        </div>
                      </div>
                      <div class="col-lg-12 row">
                          <div class="form-group col-lg-6">
                            <label class="font-weight-bold">패키지 썸네일</label>
                            <input type="file" style="display: block;" id="packageThumbnail" name="packageThumbnail">
                          </div>
                          <div class="form-group col-lg-6">
                            <label class="font-weight-bold">패키지 이미지</label>
                            <input type="file" style="display: block;" id="packageImg" name="packageImg">
                          </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4" >
                            <div style="text-align: center;">
                          <button type="submit"  class="btn btn-primary btn-circle btn-lg" style="margin-right: 20px;">
                            <i class="fas fa-check"></i>
                            </button>
                          <button type="reset" class="btn btn-danger btn-circle btn-lg" style="margin-left: 20px;">
                            <i class="fas fa-trash"></i>
                          </button>
                        </div>
                        </div>
                        <div class="col-lg-4"></div>
    
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
    

</body>
</html>