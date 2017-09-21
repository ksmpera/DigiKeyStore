﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDigiKeyStore.Models;
using MVCDigiKeyStore.ViewModels;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;

namespace MVCDigiKeyStore.Controllers
{
    public class ShoppingCartController : Controller
    {
        DigiKeyStoreContext storeDB = new DigiKeyStoreContext();

        //
        // GET: /ShoppingCart/
        public ActionResult Index()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            // Set up our ViewModel
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = cart.GetTotal()
            };
            // Return the view
            return View(viewModel);
        }
        public ActionResult AddToCart(int id)
        {
            // Retrieve the product from the database
            var addedProduct = storeDB.Products
            .Single(product => product.ProductId == id);
            // Add it to the shopping cart
            var cart = ShoppingCart.GetCart(this.HttpContext);
            cart.AddToCart(addedProduct);
            // Go back to the main store page for more shopping
            return RedirectToAction("Index");
        }

        //
        // AJAX: /ShoppingCart/RemoveFromCart/5
        //[HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            // Remove the item from the cart
            var cart = ShoppingCart.GetCart(this.HttpContext);
            // Get the name of the product to display confirmation
            string productName = storeDB.Carts.Single(item => item.RecordId == id).Product.ProductName;
            // Remove from cart
            int itemCount = cart.RemoveFromCart(id);
            // Display the confirmation message

            //var results = new ShoppingCartRemoveViewModel
            //{
            //    Message = Server.HtmlEncode(productName) +
            //    " has been removed from your shopping cart.",
            //    CartTotal = cart.GetTotal(),
            //    CartCount = cart.GetCount(),
            //    ItemCount = itemCount,                        
            //    DeleteId = id
            //};
            return RedirectToAction("Index");
            //return this.Json(results, JsonRequestBehavior.AllowGet);
        }
       
        // GET: /ShoppingCart/CartSummary
        [ChildActionOnly]
        public ActionResult CartSummary()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            ViewData["CartCount"] = cart.GetCount();

            return PartialView("CartSummary");
        }      
    }
}
