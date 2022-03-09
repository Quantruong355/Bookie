/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Acer
 */
public class Book implements Serializable {
     private String bookID;
    private String title;
     private String genre;
     private String author;
     private String noPages;
     private String published_year;
    private String publisher;
     private String language;
     private double price;
     private String gid;
    private String image;
    private String description;
    private int quantity;
    private Category cate;
    
    public Book(){
        
    }
    
    public Book(String bookID, String title,String genre,String author,String noPages,
                String published_year, String publisher, String language, double price,String gid,String image,String description,int quantity, Category cate ){
        this.bookID = bookID;
        this.title = title;
        this.genre = genre;
        this.author = author;
        this.noPages = noPages;
        this.published_year = published_year;
        this.publisher = publisher;
        this.language = language;
        this.price = price;
        this.gid = gid;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    

    public String getNoPages() {
        return noPages;
    }

    public void setNoPages(String noPages) {
        this.noPages = noPages;
    }

    public String getPublished_year() {
        return published_year;
    }

    public void setPublished_year(String published_year) {
        this.published_year = published_year;
    }


    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    

    
  
   
}
