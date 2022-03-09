<%-- 
    Document   : Edit
    Created on : Jul 10, 2021, 12:21:39 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

.table-title {
    width: 1100px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
    padding-top: 150px;
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}


.fade{
    padding-top: 80px;
}
.form-group input{
    width:180px;
    height: 30px
}
.btn-danger{
width: 140px;
border-radius: 20px;
}
#editBook{
    width: 750px;
}
.modal-content{
    width: 900px;
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
          <a class="navbar-brand" href="home"><h2>BOOK<em>IE</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
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
                <a class="nav-link" href="login">Log In</a>
              </li>
              </c:if>
             
              
              <c:if test="${sessionScope.acc != null}">
                   <li class="nav-item">
                      <a class="nav-link" href="">Hello ${sessionScope.acc.user}</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="signout">Sign Out</a>
              </li>
            </c:if>
              
               <c:if test="${sessionScope.acc.admin == 1}">
              <li class="nav-item">
                <a class="nav-link"  href="manage">Manage Product</a>
              </li>
              </c:if>

              
               
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
     
    <div class="container">
        <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
<div id="editBook">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="edit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Book's<b> Info</b></h4>
                            <a href="manage" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                             
                            <div class ="col-md-4">
                                <div class="form-group">
                                <label>BookID</label>
                                <input value="${dt.bookID}" name="bookid" class="form-control" readonly="" required></input>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <input value="${dt.title}" name="title" class="form-control" required></input>
                            </div>
                     
                            <div class="form-group">
                                <label>NoPage</label>
                                <input value="${dt.noPages}" name="nopage" class="form-control" required></input>
                            </div>
                            
                            <div class="form-group">
                                <label>Price</label>
                                <input value="${dt.price}" name="price" type="text" class="form-control" required placeholder="VNĐ">
                            </div>
                            
                             <div class="form-group">
                                <label>Author</label>
                                <input value="${dt.author}" name="author" class="form-control" required></input>
                            </div>
                                <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${requestScope.cate}" var="o">
                                        <option value="${o.genreid}">${o.catename}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            </div>
       
                            
                                <div class="col-md-4">
                                
                            
                            <div class="form-group right">
                                <label>Published Year</label>
                                <input value="${dt.published_year}" name="pyear" class="form-control" required></input>
                            </div>
                            <div class="form-group right">
                                <label>Language</label>
                                <input value="${dt.language}"name="language" class="form-control" required></input>
                            </div>
                            <div class="form-group right">
                                <label>Publisher</label>
                                <input value="${dt.publisher}" name="publisher" class="form-control" required></input>
                            </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                <label>Image</label>
                                <input value="${dt.image}" name="image" class="form-control" required></input>
                            </div>
                            </div>
                            </div>
                                
                            
                            
                            
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required>${dt.description}</textarea>
                            </div>
                            

                        </div>
                        
                       
                        
                        <div class="modal-footer">
                            <a href="manage" type="button" class="btn btn-default" data-dismiss="modal" >Cancel </a>
                            <input type="submit" class="btn btn-danger" value="Edit">
                        </div>
                    </form>
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

