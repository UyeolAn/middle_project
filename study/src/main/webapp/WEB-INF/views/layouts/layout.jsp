<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="client/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="client/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="client/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="client/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="client/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="client/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="client/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="client/css/style.css" type="text/css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    
    <style type="text/css">
    * {
    	font-family: 'NanumSquareRound' !important;
    }
    
    i {
    	font: normal normal normal 14px/1 FontAwesome !important;
    }
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


    <!-- Header Section Begin -->
      <tiles:insertAttribute name="header"/>
    <!-- Header Section End -->


    <!-- Menu Section Begin -->
    <section class="shop spad">
      <div class="container">
        <div class="row">
          <tiles:insertAttribute name="menu"/>
    <!-- Menu Section End -->
    
          
    <!-- Body Section Begin -->
    	  <div class="col-lg-9">
          	<tiles:insertAttribute name="body"/>
          </div>
        </div>
      </div>
    </section>
    <!-- Body Section End -->

	<!--Start of Tawk.to Script-->



    <!-- Footer Section Begin -->
    <tiles:insertAttribute name="footer"/>
    <!-- Footer Section End -->



    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->


    <!-- Js Plugins -->
    <script src="client/js/demo/chart-pie-demo.js"></script>
    <script src="client/js/jquery-3.3.1.min.js"></script>
    <script src="client/js/bootstrap.min.js"></script>
    <!-- <script src="client/js/jquery.nice-select.min.js"></script> -->
    <script src="client/js/jquery.nicescroll.min.js"></script>
    <script src="client/js/jquery.magnific-popup.min.js"></script>
    <script src="client/js/jquery.countdown.min.js"></script>
    <script src="client/js/jquery.slicknav.js"></script>
    <script src="client/js/mixitup.min.js"></script>
    <script src="client/js/owl.carousel.min.js"></script>
    <script src="client/js/main.js"></script>
</body>

</html>