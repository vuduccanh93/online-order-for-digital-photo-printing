using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
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
	public CartItem()
	{
		
	}

    public CartItem(string imageUrl, string res, int quantity) {
        this.imageUrl = imageUrl;
        this.res = res;
        this.quantity = quantity;
    }
}