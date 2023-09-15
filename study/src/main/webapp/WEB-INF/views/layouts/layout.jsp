<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>Wish</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="client/css/bootstrap4/bootstrap.min.css">
    <link href="client/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="client/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="client/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="client/plugins/OwlCarousel2-2.2.1/animate.css">
    <link href="client/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="client/css/main_styles.css">
    <link rel="stylesheet" type="text/css" href="client/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="client/css/categories.css">
	<link rel="stylesheet" type="text/css" href="client/css/categories_responsive.css">
  </head>

  <body>

    <div class="super_container">

      <!-- Header Start-->
      <tiles:insertAttribute name="header" />
      <!-- Header End-->


      <!-- Body Start-->
      <tiles:insertAttribute name="body" />
      <!-- Body End-->

      

      <!-- Footer Start -->
	  <tiles:insertAttribute name="footer" />
      <!-- Footer End -->

    </div>

    <script src="client/js/jquery-3.2.1.min.js"></script>
    <script src="client/css/bootstrap4/popper.js"></script>
    <script src="client/css/bootstrap4/bootstrap.min.js"></script>
    <script src="client/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="client/plugins/easing/easing.js"></script>
    <script src="client/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="client/plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="client/js/custom.js"></script>
  </body>

  </html>