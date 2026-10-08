using System;
using System.Collections.Generic;
using System.Linq;

namespace bansach
{
    [Serializable]
    public class CartItem
    {
        public string MASACH { get; set; }
        public string TENSACH { get; set; }
        public string HINHANH { get; set; }
        public decimal DONGIA { get; set; }
        public int SOLUONG { get; set; }

        public static List<CartItem> GetCart()
        {
            var cart = System.Web.HttpContext.Current.Session["Cart"] as List<CartItem>;
            if (cart == null)
            {
                cart = new List<CartItem>();
                System.Web.HttpContext.Current.Session["Cart"] = cart;
            }
            return cart;
        }

        public static void ClearCart()
        {
            System.Web.HttpContext.Current.Session["Cart"] = null;
        }

        public static int Count
        {
            get { return GetCart().Sum(c => c.SOLUONG); }
        }
    }
}
