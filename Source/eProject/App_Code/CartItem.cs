using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem : IEquatable<CartItem>
{
    private string imageUrl;

    public string ImageUrl
    {
        get { return imageUrl; }
        set { imageUrl = value; }
    }
    private string res;

    public string Res
    {
        get { return res; }
        set { res = value; }
    }
    
    private int quantity;

    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }

    private int price;

    public int Price
    {
        get { return price; }
        set { price = value; }
    }
    public int TotalPrice
    {
        get { return Price * Quantity; }
    }
    public CartItem()
    {

    }
	
    public CartItem(string imageUrl, string res, int price) {
        this.ImageUrl = imageUrl;
        this.Res = res;
        this.Price = price;
    }
    public CartItem(string imageUrl, string res)
    {
        this.ImageUrl = imageUrl;
        this.Res = res;
        
    }
    public bool Equals(CartItem item)
    {
        return (item.ImageUrl == this.ImageUrl) && (item.Res == this.Res);
    }  
}