<%-- 
    Document   : Detail
    Created on : Jul 8, 2021, 2:34:26 PM
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
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            
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
  color: #343a40;
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
          <a class="navbar-brand" href="home.jsp"><h2>BOOK<em>IE</em></h2></a>
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
                <a class="nav-link"  href="">Manage Product</a>
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

       
    <div class="products">
      <div class="container">
          <form name="f" action="" method="post">
              
        <div class="row">
          <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                             <a href="#"><img src="${dt.image}"></a>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
          <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${dt.title}</h3>
                                            <dl class="item-property">
                                            <dt>${dt.author}</dt>
                                           
                                        </dl>
                                            </br>
                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">Price: </span><span class="num">${dt.price}Đ</span>
                                            </span> 
                                        </p> <!-- price-detail-wrap .// -->
                                        </br>
                                         <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>
                                                    ${dt.description}
                                                </p></dd>
                                        </dl>

                                                 <dl class="item-property">
                                            <dt>Language :  ${dt.language}</dt>
                                                
                                        </dl>
                                            
                                                <dl class="item-property">
                                            <dt>No_Page :  ${dt.noPages}</dt>
                                                
                                        </dl>
                                            
                                        <dl class="item-property">
                                            <dt>Published Year : ${dt.published_year}</dt>
                                                
                                        </dl>

                                            <dl class="item-property">
                                            <dt>Publisher : ${dt.publisher}</dt>
                                                
                                        </dl>
                                            
                                       
                                        <c:if test="${sessionScope.acc.admin != 1 && sessionScope.acc != null}">
                                            <button type="submit" onclick="buy('${dt.bookID}')" class="btn btn-danger"><i class="fa fa-shopping-cart"> Add To Cart </i></button>
                           </c:if>
                            
                                    </article> <!-- card-body.// -->
                                </aside>
          
        </div>
</form>                               
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


   
<script type="text/javascript">
    function buy(bookID){
        
          document.f.action="buy?id="+bookID + "&num=1";
          document.f.submit();
      
    }
</script>    

  </body>

</html>