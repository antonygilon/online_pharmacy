/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pharmacy;

import static java.time.Clock.system;
import java.util.ArrayList;

/**
 *
 * @author Srinivas Raman
 */
public class Cart {
    
    public ArrayList<Medicines> medicines = new ArrayList<>();
    public ArrayList<Integer> quantity = new ArrayList<>();

    public Cart() {
    }
    
    public void addMedicine(Medicines m,int q)
    {
        int flag = 0;
        System.out.println(m.getMname());
        for(int i=0;i<this.medicines.size();i++)
        {
            if(medicines.get(i).getMname().equals(m.getMname()))
            {
                System.out.println(m.getMname());
                flag = 1;
                quantity.set(i, quantity.get(i)+1);
            }
                
        }
        
        if(flag!=1)
        {this.medicines.add(m);
        this.quantity.add(q);}
    }

    public ArrayList<Medicines> getMedicines() {
        return medicines;
    }

    public void setMedicines(ArrayList<Medicines> medicines) {
        this.medicines = medicines;
    }

    public ArrayList<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(ArrayList<Integer> quantity) {
        this.quantity = quantity;
    }
    
    
    
    
    
    
}
