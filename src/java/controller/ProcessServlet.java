/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Cart;
import model.Item;

/**
 *
 * @author Acer
 */
@WebServlet(name = "ProcessServlet", urlPatterns = {"/process"})
public class ProcessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if(o!=null){
            cart= (Cart) o;
        }else{
            cart = new Cart();
        }
            String tnum=request.getParameter("num").trim();
            String tid=request.getParameter("id");
            int id,num;
            try{
               
               BookDAO pdb=new BookDAO();
               Book p=pdb.getProductByID(tid);
               int realnum=p.getQuantity();
               num=Integer.parseInt(tnum);
               if((num==-1) &&(cart.getQuantityById(tid)<=1)){
                   cart.removeItem(tid);
               }else{ 
                 if((num==1)&& cart.getQuantityById(tid)>=realnum){
                     num=0;
                 } 
                 double price=p.getPrice()*1.2;
                 Item t=new Item(p,num, price);  
                 cart.addItem(t);
               }      
            }catch(NumberFormatException e){
                System.out.println(e);
            }
        List<Item> listi=cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", listi.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      HttpSession session =request.getSession(true);
        Cart cart=null;
        Object o=session.getAttribute("cart");
        //co roi
        if(o!=null){
            cart=(Cart)o;
        }else{
            cart=new Cart();
        }
        String id=request.getParameter("id");
        cart.removeItem(id);
        
        List<Item> listi=cart.getItems();
        
        session.setAttribute("cart", cart);
        session.setAttribute("size", listi.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
