<%-- 
    Document   : home
    Created on : Jun 28, 2021, 12:00:11 AM
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
          <a class="navbar-brand" href="home"><h2>Book<em>ie</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          </c:if>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               
              <li class="nav-item active">
                <a class="nav-link" href="home">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link"  href="product">Our Products</a>
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
              
              <c:if test="${sessionScope.acc.admin != 1 &&  sessionScope.acc != null}">
              <li id="bag" class="nav-item px-3 text-uppercase mb-0 position-relative d-lg-flex">
        
        <a href="cart.jsp" class="cart position-relative d-inline-flex" aria-label="View your shopping cart">
          <i class="fas fa fa-shopping-cart fa-lg" style="font-size:32px;color:whitesmoke;padding-top: 10px;"></i>
          <span class="cart-basket d-flex align-items-center justify-content-center">
            0
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
    <!-- Banner Starts Here -->
    <div class="banner header-text">
      <div class="owl-banner owl-carousel">
        <div class="banner-item-01">
          <div class="text-content">
            <h4>Best Offer</h4>
            <h2>New Books Have Arrived</h2>
          </div>
        </div>
        <div class="banner-item-02">
          <div class="text-content">
            <h4>Flash Deals</h4>
            <h2>Get your books</h2>
          </div>
        </div>
        <div class="banner-item-03">
          <div class="text-content">
            <h4>Discover</h4>
            <h2>Your favorite books</h2>
          </div>
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->
    
    <div class="latest-products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Latest Products</h2>
              <a href="product">view all products <i class="fa fa-angle-right"></i></a>
            </div>
          </div>
            <c:forEach items="${requestScope.last}" var="l" >
          <div class="col-md-4">
            <div class="product-item">
                <a href="detail?tid=${l.bookID}"><img src="${l.image}" alt="" style="height: 420px;"></a>
              <div class="down-content">
                  <a href="#"><h4>${l.title}</h4></a>
                  <h6></br>${l.price}đ</h6>
                <p>Genre : ${l.genre}</p>
                <p>${l.language}</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
                <span>Reviews (24)</span>
              </div>
            </div>
          </div>
            </c:forEach>
    
        </div>
      </div>
    </div>
    
    
    
    
    <div class="latest-products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Best Seller</h2>
              <a href="product">view all products <i class="fa fa-angle-right"></i></a>
            </div>
          </div>
          <div class="col-md-4">
            <div class="product-item">
                <a href="#"><img src="assets/images/SherlockHolmes.jpg" alt=""></a>
              <div class="down-content">
                <a href="#"><h4>SherLock Holmes </h4></a>
                <h6> 100.000đ</h6>
                <p>Genre: Thriller</p>
                <p>Languge: Tiếng Việt</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
                <span>Reviews (24)</span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="product-item">
                <a href="#"><img src="images/muoinguoidaden.jpg" alt=""></a>
              <div class="down-content">
                <a href="#"><h4>Mười Người Da Đen Nhỏ</h4></a>
                <h6>80.000đ</h6>
                 <p>Genre: Thriller</p>
                <p>Languge: Tiếng Việt</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
                <span>Reviews (21)</span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="product-item">
                <a href="#"><img src="images/rungnauy.jpg" alt=""></a>
              <div class="down-content">
                <a href="#"><h4>Rừng Na-uy</h4></a>
                <h6>106.400đ</h6>
                 <p>Genre: Novel</p>
                <p>Languge: Tiếng Việt</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                 
                </ul>
                <span>Reviews (36)</span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="product-item">
                <a href="#"><img src="images/bimatnaoko.jpg" alt="" style="height:370px";"></a>
              <div class="down-content">
                <a href="#"><h4>Bí mật của Naoko</h4></a>
                <h6>83.700đ</h6>
                 <p>Genre: Crime Fiction</p>
                <p>Languge: Tiếng Việt</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  
                </ul>
                <span>Reviews (48)</span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="product-item">
                <a href="#"><img src="images/anmangtrentau.jpg" alt="" style="height: 330px;"></a>
              <div class="down-content">
                <a href="#"><h4>Án mạng trên t
                        </br> tốc hành Phương </br>
                         Đông</h4></a>
                <h6>87.500đ</h6>
                 <p>Genre: Thriller</p>
                <p>Languge: Tiếng Việt</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
                <span>Reviews (16)</span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="product-item">
                <a href="#"><img src="assets/images/theoldman.jpg" alt=""></a>
              <div class="down-content">
                <a href="#"><h4>The old man and the </br>
                        Sea</h4></a>
                <h6>70.000đ</h6>
                 <p>Genre: Adventure</p>
                <p>Languge: Tiếng Việt</p>
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                
                </ul>
                <span>Reviews (32)</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="best-features">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>About Bookie</h2>
            </div>
          </div>
          <div class="col-md-6">
            <div class="left-content">
              <h4>Looking for the new books?</h4>
              <p>Welcome to Bookie - A bookstore online where you can find new and bestseller books.We have all kinds of books that makes you curious.What is your favorite genre? Let's find it out and enjoy . <a rel="nofollow" href="contact.jsp">Contact us</a> for more info.</p>
              <ul class="featured-list">
                <li><a href="#">Best Seller</a></li>
                <li><a href="#">High Quality Books</a></li>
                <li><a href="#">Books on sale every month</a></li>
                <li><a href="#">Satisfied customer</a></li>
                <li><a href="#">Simple and friendly bookstore online</a></li>
              </ul>
              
            </div>
          </div>
          <div class="col-md-6">
            <div class="right-image">
                <img src="assets/images/footerbook.jpg" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content">
              <div class="row">
                <div class="col-md-8">
                  <h4>Discover new books with <em>Bookie</em></h4>
                  <p>Let's find out your favorite book</p>
                </div>
                <div class="col-md-4">
                  <a href="product" class="filled-button">Purchase Now</a>
                </div>
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


    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>


  </body>

</html>