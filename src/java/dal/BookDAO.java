/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Book;
import model.Cart;
import model.Category;
import model.Item;

/**
 *
 * @author Acer
 */
public class BookDAO extends DBContext {
    public List<Book> getAll(){
        List<Book> list=new ArrayList<>();
        String sql="select b.BookID,b.Title,b.Genre,c.CategoryName," 
                  + "b.NoPages,b.Published_year,b.quantity,b.Language,b.Price,b.gID,b.Image\n"
                  + "from Book b inner join  Category c on b.gID=c.GenreID";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Book b=new Book();
                b.setBookID(rs.getString("BookID"));
                b.setTitle(rs.getString("Title"));
                b.setGenre(rs.getString("Genre"));
                b.setNoPages(rs.getString("NoPages"));
                b.setPublished_year(rs.getString("Published_year"));
              b.setQuantity(rs.getInt("quantity"));
                b.setLanguage(rs.getString("Language"));
                b.setPrice(rs.getDouble("Price"));
                b.setGid(rs.getString("gID"));
                b.setImage(rs.getString("Image"));
                
                
                list.add(b);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
        
        
}
     public List<Book> getLastest(){
        List<Book> list=new ArrayList<>();
        String sql="select top(6)\n" +
                   "      b.BookID,\n" +
                   "      b.Title,\n" +
                   "	  b.Image,\n" +
                   "      b.Genre,\n" +
                   "      b.Language,\n" +
                   "      b.Price\n" +
                   "  FROM [dbo].[Book] b\n" +
                   "  order by b.Published_year desc";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Book b=new Book(); 
                b.setBookID(rs.getString("BookID")); 
                b.setTitle(rs.getString("Title"));
                b.setImage(rs.getString("Image"));
                b.setGenre(rs.getString("Genre"));
                b.setLanguage(rs.getString("Language"));
                b.setPrice(rs.getDouble("Price"));
                list.add(b);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
        
        
}
      public List<Book> getProductBygID(String genreid){
        List<Book> list=new ArrayList<>();
        String sql="select * from Book\n" 
        +"where gID= ?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,genreid);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Book b=new Book();
                b.setBookID(rs.getString("BookID"));
                b.setTitle(rs.getString("Title"));
                b.setGenre(rs.getString("Genre"));
                b.setNoPages(rs.getString("NoPages"));
                b.setPublished_year(rs.getString("Published_year"));
              
                b.setLanguage(rs.getString("Language"));
                b.setPrice(rs.getDouble("Price"));
                b.setGid(rs.getString("gID"));
                b.setImage(rs.getString("Image"));

                list.add(b);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
        
        
}
      
      public List<Book> getProductBySellerid(int sid){
        List<Book> list=new ArrayList<>();
        String sql="select * from Book\n" +
                   "where seller_id = ?" ;
        
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,sid);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Book b=new Book();
                b.setBookID(rs.getString("BookID"));
                b.setTitle(rs.getString("Title"));
                b.setGenre(rs.getString("Genre"));
                b.setNoPages(rs.getString("NoPages"));
                b.setPublished_year(rs.getString("Published_year"));
              
                b.setLanguage(rs.getString("Language"));
                b.setPrice(rs.getDouble("Price"));
                b.setGid(rs.getString("gID"));
                b.setImage(rs.getString("Image"));

                list.add(b);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
      }
      
      
    public List<Book> SearchByTitle(String txtsrch){
        List<Book> list=new ArrayList<>();
        String sql="select * from Book\n" +
                     "where Title like ?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,"%"+ txtsrch +"%");
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Book b=new Book();
                b.setBookID(rs.getString("BookID"));
                b.setTitle(rs.getString("Title"));
                b.setGenre(rs.getString("Genre"));
                b.setNoPages(rs.getString("NoPages"));
                b.setPublished_year(rs.getString("Published_year"));
              
                b.setLanguage(rs.getString("Language"));
                b.setPrice(rs.getDouble("Price"));
                b.setGid(rs.getString("gID"));
                b.setImage(rs.getString("Image"));

                list.add(b);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Account Login(String user, String pass){
        String sql="select * from Customer\n" +
                   "where [User] = ?\n" +
                   "and Password = ?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,user);
            st.setString(2,pass);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
               return new Account(rs.getInt("CustomerID"),
                                  rs.getString("User"),
                                  rs.getString("Password"),
                                  rs.getInt("Admin"));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
      
    public Account CheckAcc(String user){
        String sql="select * from Customer\n" +
                   "where [User] = ?\n";
                  
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,user);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
               return new Account(rs.getInt("CustomerID"),
                                  rs.getString("User"),
                                  rs.getString("Password"),
                                  rs.getInt("Admin"));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public void signup(String user, String pass){
        String sql="Insert into Customer\n" +
                   "values(?,?,0)";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,user);
            st.setString(2,pass);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
     public Book getProductByID(String bid){
        String sql="select * from Book\n" 
        +"where BookID= ?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,bid);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Book b=new Book();
                b.setBookID(rs.getString("BookID"));
                b.setTitle(rs.getString("Title"));
                b.setGenre(rs.getString("Genre"));
                b.setNoPages(rs.getString("NoPages"));
                b.setPublished_year(rs.getString("Published_year"));
                b.setAuthor(rs.getString("Author"));
                b.setPublisher(rs.getString("Publisher"));
                b.setLanguage(rs.getString("Language"));
                b.setPrice(rs.getDouble("Price"));
                b.setGid(rs.getString("gID"));
                b.setImage(rs.getString("Image"));
                b.setDescription(rs.getString("description"));
                b.setQuantity(rs.getInt("quantity"));
                return b;
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return null;
    
}
    
     public void deletebook(String bid){
         String sql="delete from Book\n" +
                    "where BookID = ?";
         try{
             PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,bid);
            st.executeUpdate();
         }catch(Exception e){
             System.out.println(e);
         }
     }
     
     public void insertbook(String title,String image,String price,
                             String description,String category,String author,
                              String nopage,String pyear,String language,
                              String publisher, int sid, String quantity){
         String sql="insert Book\n" +
"(Title,NoPages,Published_year,[Language],Price,gID,[Image],[description],Author,Publisher,seller_id,quantity) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

         try{
              PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,title);
            st.setString(2,nopage);
            st.setString(3,pyear);
            st.setString(4,language);
            st.setString(5,price);
            st.setString(6,category);
            st.setString(7,image);
            st.setString(8,description);
            st.setString(9,author);
            st.setString(10,publisher);
            st.setInt(11,sid);
            st.setString(12, quantity);
            st.executeUpdate();
         }catch(Exception e){
             System.out.println(e);  
         }
     }
     
      public void Editbook(String title,String image,String price,
                             String description,String category,String author,
                              String nopage,String pyear,String language,
                              String publisher, String bid){
         String sql= "update Book\n" +
"set Title = ?,\n" +
"    NoPages = ?,\n" +
"	Published_year = ?,\n" +
"	[Language] = ?,\n" +
"	Price = ?,\n" +
"	gID = ?,\n" +
"	[Image] = ?,\n" +
"	[description] = ?,\n" +
"	Author = ?,\n" +
"	Publisher = ?\n" +
"	where BookID = ?";
         try{
              PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,title);
            st.setString(2,nopage);
            st.setString(3,pyear);
            st.setString(4,language);
            st.setString(5,price);
            st.setString(6,category);
            st.setString(7,image);
            st.setString(8,description);
            st.setString(9,author);
            st.setString(10,publisher);
            st.setString(11,bid);
            st.executeUpdate();
         }catch(Exception e){
             System.out.println(e);  
         }
     }
    
      
      public void addOrder(Account u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try{
            //add vào bảng Order
            String sql="insert into [Order] values(?,?,?)";
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, u.getId());
            st.setDouble(3, cart.getTotal());
            st.executeUpdate();
            
            //lấy ra id của Order vừa add
            String sql1="select top 1 OrderID from [Order] order by OrderID desc";
            PreparedStatement st1=connection.prepareStatement(sql1);
            ResultSet rs=st1.executeQuery();
            
            //add vào bảng OrderLine
            if(rs.next()){
                int oid=rs.getInt(1);
                for(Item i:cart.getItems()){
                String sql2="insert into [OrderDetail] values(?,?,?,?)";
                PreparedStatement st2=connection.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setString(2, i.getBook().getBookID());
                st2.setInt(3, i.getQuantity());
                st2.setDouble(4, i.getPrice());
                st2.executeUpdate();
            }
            }
            //update so luong trong bang Product sau khi ban
            String sql3 = "update Book set quantity = quantity - ? "
                        + "where BookID = ?";
            PreparedStatement st3=connection.prepareStatement(sql3);
            for(Item i:cart.getItems()){
                st3.setInt(1, i.getQuantity());
                st3.setString(2, i.getBook().getBookID());
                st3.executeUpdate();
            }
            
        }catch(SQLException e){
            System.out.println(e);
        }
    }
     
   
     public static void main(String[] args) {
        BookDAO bd = new BookDAO();
        Book list = bd.getProductByID("1");
       
            System.out.println(list.getBookID());
    }
}
