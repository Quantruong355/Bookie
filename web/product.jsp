<%-- 
    Document   : product
    Created on : Jun 28, 2021, 4:40:26 PM
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
<style>
        navigation {
  width: 100%;
  height: 90px;
  display: flex;
  align-items: center;
  border-top: 6px solid #d60e96;
}

.logo {
  max-height: 70px;
}

li {
  list-style: none;
}

.fa,
.fas {
  font-family: 'FontAwesome';
}

ul li a {
  font-size: 1.1rem;
  color: #f55b5b;
}

ul li a.cart:hover {
  text-decoration: none;
  color: #d60e96;
}

ul li a.cart .cart-basket {
  font-size: .6rem;
  position: absolute;
  bottom: 45px;
  right: -5px;
  width: 15px;
  height: 15px;
  color: #fff;
  background-color: #418deb;
  border-radius: 50%;
  
  
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
                <a class="nav-link" href="product.jsp">Our Products</a>
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
              
              
              <c:if test="${sessionScope.acc.admin != 1 && sessionScope.acc != null}">
              <c:set var="size" value="${sessionScope.size}"/>
              <li id="bag" class="nav-item px-3 text-uppercase mb-0 position-relative d-lg-flex">
        
        <a href="cart.jsp" class="cart position-relative d-inline-flex" aria-label="View your shopping cart">
          <i class="fas fa fa-shopping-cart fa-lg" style="font-size:32px;color:whitesmoke;padding-top: 10px;"></i>
          <span class="cart-basket d-flex align-items-center justify-content-center">
            ${size}
          </span>
        </a>
      </li>
            </c:if>
              
               

              
               
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>your choices</h4>
              <h2>BOOKIE products</h2>
            </div>
          </div>
        </div>
      </div>
    </div>

    <form class="navbar-form navbar-right" action="search" method="get" style="padding-left: 655px; padding-top: 20px;margin-bottom: -60px;">
        <div class="form-group">
            
            <input value="${title}" name="txt" type="text" class="form-control" placeholder="Book Title">
          
            <input type="submit" class="btn btn-default" value="FIND BOOK"\>  <i class="fa fa-search"></i>
            
        </div>
    </form>
    
    <div class="products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="filters">
              <ul>
                  <li class="active" data-filter="*"><a  href="product">All Products </a></li>
                  <li>
                      <select name="genreid" onchange="location = this.value;">
                <option value="0">Category</option>
                <c:forEach items="${requestScope.cate}" var="o">
                    <option  value="category?genreid=${o.genreid}"> ${o.catename} </option>
                </c:forEach> </select>
                     </li>
              </ul>
            </div>
          </div>
          <div class="col-md-12">
            <div class="filters-content">
                <div class="row grid">
                    
                     <form name="f" action="" method="post">
                    <c:forEach items="${requestScope.bookk}" var="o" >
                       
                    <div class="col-lg-4 col-md-4 all des">
                      <div class="product-item">
                        <a href="detail?tid=${o.bookID}"><img src="${o.image}" alt="" style="height: 400px;"></a>
                        <div class="down-content">
                            <a href="detail?tid=${o.bookID}"><h4>${o.title}</h4></a>
                           <h6></br>${o.price}đ</h6>
                          <p>Genre : ${o.genre}</p>
                          <p>${o.language}</p>
                          <ul class="stars">
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                          </ul>
                           <c:if test="${sessionScope.acc.admin != 1 && sessionScope.acc != null}">
                          <span><input type="submit" onclick="buy('${o.bookID}')" class="btn btn-success btn-block" value="Add to cart"></span>
                           </c:if>
                        </div>
                      </div>
                    </div>
                        </c:forEach>
                     </form>
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
            <div class="inner-content">
              <p>Copyright &copy; 2020 Bookie Co., Ltd.
            
           
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
<script type="text/javascript">
    function buy(bookID){
        
          document.f.action="buy?id="+bookID + "&num=1";
          document.f.submit();
      
    }
</script>    