using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
[Serializable]
public class Cart
{
    private DateTime dateCreated;
    private DateTime lastUpdate;
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

    public void Insert(string imageUrl, string res, int quantity, int price)
    {
        int ItemIndex = ItemIndexOfID(imageUrl);
        if (ItemIndex == -1)
        {
            CartItem NewItem = new CartItem();
            NewItem.ImageUrl = imageUrl;
            NewItem.Res = res;
            NewItem.Quantity = quantity;
            NewItem.Price = price;
            items.Add(NewItem);
        }
        else
        {
            items[ItemIndex].Quantity += 1;
        }
        lastUpdate = DateTime.Now;
    }

    public void Update(int rowID, string imageUrl,
                         int quantity, int price)
    {
        CartItem Item = items[rowID];
        Item.ImageUrl = imageUrl;
        Item.Quantity = quantity;
        Item.Price = price;
        lastUpdate = DateTime.Now;
    }

    public void DeleteItem(int rowID)
    {
        items.RemoveAt(rowID);
        lastUpdate = DateTime.Now;
    }

    private int ItemIndexOfID(string imageUrl)
    {
        int index = 0;
        foreach (CartItem item in items)
        {
            if (item.ImageUrl.Equals(imageUrl))
            {
                return index;
            }
            index++;
        }
        return -1;
    }

    public double TotalPrice
    {
        get
        {
            double totalPrice = 0;
            if (items == null)
            {
                return 0;
            }
            foreach (CartItem Item in items)
            {
                totalPrice += Item.Price;
            }
            return totalPrice;
        }
    }

    
}