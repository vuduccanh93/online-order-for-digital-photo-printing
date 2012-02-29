using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
[Serializable]
public class Cart
{
    
    private List<CartItem> items;   

    public List<CartItem> Items
    {
        get { return items; }
        set { items = value; }
    }
    public static readonly Cart Instance;
    static Cart()
    {  
        // If the cart is not in the session, create one and put it there  
        // Otherwise, get it from the session  
        if (HttpContext.Current.Session["ASPNETShoppingCart"] == null) {
            Instance = new Cart();  
            Instance.Items = new List<CartItem>();  
            HttpContext.Current.Session["ASPNETShoppingCart"] = Instance;  
        } else {
            Instance = (Cart)HttpContext.Current.Session["ASPNETShoppingCart"];  
        }  
    }  
	protected Cart() { }

    public void AddItem(string imageUrl, string res, int price)
    {
         
            CartItem newItem = new CartItem(imageUrl,res,price);
            if (Items.Contains(newItem)) {  
            foreach (CartItem item in Items) {  
                if (item.Equals(newItem)) {  
                    item.Quantity++;  
                    return;  
                }  
            }  
        } else {  
            newItem.Quantity = 1;  
            Items.Add(newItem);  
        }
        
        
    }
    public void RemoveItem(string imageUrl, string res)
    {
        CartItem removedItem = new CartItem(imageUrl, res);
        Items.Remove(removedItem);
    }

    public void SetItemQuantity(string imageUrl, string res, int quantity)
    {
        if (quantity == 0)
        {
            RemoveItem(imageUrl, res);
            return;
        }
        
        CartItem updatedItem = new CartItem(imageUrl, res);
        foreach (CartItem item in Items)
        {
            if (item.Equals(updatedItem))
            {
                item.Quantity = quantity;
                return;
            }
        }
    }

    public decimal GetSubTotal()
    {
        decimal subTotal = 0;
        foreach (CartItem item in Items)
            subTotal += item.TotalPrice;

        return subTotal;
    }

    public void RemoveCart() {
        items.Clear();
    }
}