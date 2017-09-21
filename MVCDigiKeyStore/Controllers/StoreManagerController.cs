using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDigiKeyStore.Models;
using MVCDigiKeyStore.ViewModels;
using System.Data.Entity;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Core.Objects.DataClasses;

namespace MVCDigiKeyStore.Controllers
{
    public class StoreManagerController : Controller
    {
        //[Authorize(Roles = "Administrator")]
        DigiKeyStoreContext db = new DigiKeyStoreContext();
        //
        //
        // GET: /StoreManager/

        public ViewResult Index()
        {
            var products = db.Products.Include(a => a.Type).Include(a => a.Supplier);
            return View(products.ToList());
        }

        //
        // GET: /StoreManager/Details/5

        public ViewResult Details(int id)
        {
            Product product = db.Products.Find(id);
            return View(product);
        }

        //
        // GET: /StoreManager/Create

        public ActionResult Create()
        {
            ViewBag.TypeId = new SelectList(db.Types, "TypeId", "Name");
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name");
            return View();
        }

        //
        // POST: /StoreManager/Create

        [HttpPost]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductId = new SelectList(db.Types, "TypeId", "Name", product.TypeId);
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name", product.SupplierId);
            return View(product);
        }

        //
        // GET: /StoreManager/Edit/5

        public ActionResult Edit(int id)
        {            
            Product product = db.Products.Find(id);
            ViewBag.TypeId = new SelectList(db.Types, "TypeId", "Name");
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name");
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        ////
        //// POST: /StoreManager/Edit/5

        [HttpPost]
        public ActionResult Edit(Product product)
        {      
         if (ModelState.IsValid)
          {              
             db.Entry(product).State = EntityState.Modified;
             db.SaveChanges();
              return RedirectToAction("Index");
           }
          ViewBag.ProductId = new SelectList(db.Types, "TypeId", "Name", product.TypeId);
          ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name", product.SupplierId);
          return View(product);         
        }

        //
        // GET: /StoreManager/Delete/5

        public ActionResult Delete(int id)
        {
            Product product = db.Products.Find(id);
            return View(product);
        }

        //
        // POST: /StoreManager/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
