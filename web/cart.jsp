<%-- 
    Document   : cart
    Created on : Jul 11, 2021, 12:35:49 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Bookie</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--

TemplateMo 546 Sixteen Clothing

https://templatemo.com/tm-546-sixteen-clothing

-->

    <!-- Additional CSS Files -->
 
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>


  body {
  background-image: url(assets/images/book.jpg);
  min-height: 100vh;
  
  .cotainer{
      padding-top: 140px;
  }
}
  

    </style>
  </head>

  <body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
            <c:if test="${sessionScope.acc != null}">
             
                <a class="navbar-brand" href=""><h2>Hello <em>${sessionScope.acc.user}</em></h2></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
            </c:if>
                      
            <c:if test="${sessionScope.acc == null}">
          <a class="navbar-brand" href="home"><h2>BOOK<em>IE</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          </c:if>
          
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                  
                <a class="nav-link" href="home">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item active">
                <a class="nav-link" href="product">Our Products</a>
              </li>
              
                
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
              </li>
              
              
              <c:if test="${sessionScope.acc == null}">
              <li class="nav-item">
                <a class="nav-link" href="login.jsp">Log In</a>
              </li>
              </c:if>
             
              <c:if test="${sessionScope.acc.admin == 1}">
              <li class="nav-item">
                <a class="nav-link"  href="manage">Manage Product</a>
              </li>
              </c:if>
              
              <c:if test="${sessionScope.acc != null}">
    
              <li class="nav-item">
                <a class="nav-link" href="signout">Sign Out</a>
              </li>
                          </c:if>
              
               

              
               
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    

  <div class="pb-5">
    <div class="container">
      <div class="row"  style="padding-top: 200px;">
        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                    <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">No</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Product</div>
                  </th>
        
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Price</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Quantity</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Remove</div>
                  </th>
                </tr>
              </thead>
              <tbody>
                  <c:set var="c" value="${sessionScope.cart}"/>
                  <c:set var="t" value="0"/>
                  <c:forEach items="${c.items}" var="i">
                      <c:set var="t" value="${t+1}"/>
                <tr>
                    <td class="border-0 align-middle"><strong>${t}</strong></td>
                  <th scope="row" class="border-0">
                    <div class="p-2">
                      <img src="https://res.cloudinary.com/mhmd/image/upload/v1556670479/product-1_zrifhn.jpg" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <img src="${i.book.image}"style="height: 300px;">
                      </div>
                    </div>
                  </th>
                  
                  <td class="border-0 align-middle"><strong>${i.price} Đ</strong></td>
                  
                  
                  <td class="border-0 align-middle">
                <a href="process?num=-1&id=${i.book.bookID}" class="filled-button" style="height: 35px;"><</a>
                      <strong readonly>${i.quantity}</strong>
                <a href="process?num=1&id=${i.book.bookID}" class="filled-button" style="height: 35px;">></a>
                  </td>
                  <td>
                      
                   <form action="process" method="post">
                        <input type="hidden" name="id" value="${i.book.bookID}"/>
                        <button type="submit" class="btn btn-dark" style="margin-top: 150px;">
                          <i class="fa fa-trash"></i>
                         </button>
                              
                    </form> 
      
                  </td>
         
                </tr>
                  </c:forEach>
              
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

      <div class="row py-5 p-4 bg-white rounded shadow-sm">
        
        <div class="col-lg-12">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="border-radius: 30px;">Order summary </div>
          <div class="p-4">
            
            <ul class="list-unstyled mb-4">
             
             
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                <h5 class="font-weight-bold">${sessionScope.cart.getTotal()} VNĐ</h5>
              </li>
            </ul>
              
              <a href="checkout" class="btn btn-dark rounded-pill py-2 btn-block" style="border-radius: 30px;width: 250px;margin-left: 750px;">Procceed to checkout</a>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

    
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content" >
                <p style="color: white;">Copyright &copy; 2020 Bookie Co., Ltd.</p>
            
            </div>
          </div>
        </div>
      </div>
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>



  </body>

</html>
