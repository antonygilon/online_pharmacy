package com.pharmacy;
// Generated 22-Mar-2020, 11:16:14 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Orders generated by hbm2java
 */
@Entity
@Table(name="orders"
    ,catalog="online_pharmacy"
)
public class Orders  implements java.io.Serializable {


     private Integer orderId;
     private Users users;
     private int totalCost;
     private Set<Purchase> purchases = new HashSet<Purchase>(0);

    public Orders() {
    }

	
    public Orders(Users users, int totalCost) {
        this.users = users;
        this.totalCost = totalCost;
    }
    public Orders(Users users, int totalCost, Set<Purchase> purchases) {
       this.users = users;
       this.totalCost = totalCost;
       this.purchases = purchases;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="order_id", unique=true, nullable=false)
    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="order_by", nullable=false)
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }

    
    @Column(name="total_cost", nullable=false)
    public int getTotalCost() {
        return this.totalCost;
    }
    
    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="orders")
    public Set<Purchase> getPurchases() {
        return this.purchases;
    }
    
    public void setPurchases(Set<Purchase> purchases) {
        this.purchases = purchases;
    }




}


