/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class Cart {
    private List<Item> items;
    
    private double totalPrice;
    
    public Cart(){
        items= new ArrayList<Item>();
    }
    public Cart(List<Item> items, double totalPrice){
        this.items = items;
        this.totalPrice = totalPrice;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    public int getQuantityById(String bookID){
        return getItemById(bookID).getQuantity();
    }
    
    public Item getItemById(String bookID){
       for(Item i : items){
           if(i.getBook().getBookID().equals(bookID))
               return i;
    }
        return null;
        
}
    
    public void addItem(Item t){
        if(getItemById(t.getBook().getBookID())!= null){
            Item m = getItemById(t.getBook().getBookID());
            m.setQuantity(m.getQuantity()+ t.getQuantity());
        }else
            items.add(t);
    }
    public void removeItem(String bookID){
        if(getItemById(bookID)!= null){
            items.remove(getItemById(bookID));
        }
    }
    
    public double getTotal(){
        double t = 0;
        for(Item i : items)
            t+=(i.getQuantity()*i.getPrice());
        this.totalPrice = t;
        return t;
    }
}
