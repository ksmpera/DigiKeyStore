using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.IO;
using System.Data.Entity.Migrations;
using System.Data.Entity.Validation;
using System.Diagnostics;

namespace MVCDigiKeyStore.Models
{
    public class SampleData : DropCreateDatabaseIfModelChanges<DigiKeyStoreContext>
    {
        protected override void Seed(DigiKeyStoreContext context)
        {

            //IList<Type> types = new List<Type>();
            //IList<Supplier> suppliers = new List<Supplier>();
            //IList<Product> products = new List<Product>();
            var types = new List<Type>();
            var suppliers = new List<Supplier>();
            var products = new List<Product>();

            types.Add(new Type() {TypeId = 1, Name = "Audio Products" });
            types.Add(new Type() {TypeId = 2, Name = "Battery Products" });
            types.Add(new Type() {TypeId = 3, Name = "Fans, Thermal Management" });
            types.Add(new Type() {TypeId = 4, Name = "Boxes, Enclosures, Racks" });
            types.Add(new Type() {TypeId = 5, Name = "Capacitors" });
            types.Add(new Type() {TypeId = 6, Name = "Isolators" });
            types.Add(new Type() {TypeId = 7, Name = "Kits" });
            types.Add(new Type() {TypeId = 8, Name = "Resistors" });          

            suppliers.Add(new Supplier() {SupplierId = 1, Name = "3M" });
            suppliers.Add(new Supplier() {SupplierId = 2, Name = "4 D System" });
            suppliers.Add(new Supplier() {SupplierId = 3, Name = "Goldberg" });
            suppliers.Add(new Supplier() {SupplierId = 4, Name = "DC" });
            suppliers.Add(new Supplier() {SupplierId = 5, Name = "Alpha Wire" });
            suppliers.Add(new Supplier() {SupplierId = 6, Name = "Adrians" });
            suppliers.Add(new Supplier() {SupplierId = 7, Name = "Amigis" });
            suppliers.Add(new Supplier() {SupplierId = 8, Name = "AishDAPT" });
            suppliers.Add(new Supplier() {SupplierId = 9, Name = "ARM" });
            suppliers.Add(new Supplier() {SupplierId = 10, Name = "Turco & Nova" });
            suppliers.Add(new Supplier() {SupplierId = 11, Name = "Ams" });
            suppliers.Add(new Supplier() {SupplierId = 12, Name = "Nokia" });
            suppliers.Add(new Supplier() {SupplierId = 13, Name = "Apem Inc" });
            suppliers.Add(new Supplier() {SupplierId = 14, Name = "Amprobe" });

            products.Add(new Product() { TypeId = 1, SupplierId = 1, ProductName = "M 91", Price = 8.98M, Stock = 3449, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 2, SupplierId = 2, ProductName = "4 D System", Price = 12.99M, Stock = 977, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 3, SupplierId = 3, ProductName = "23001005", Price = 14.99M, Stock = 2349, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 4, SupplierId = 4, ProductName = "34MIO191", Price = 12.99M, Stock = 599, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 5, SupplierId = 5, ProductName = "4o23D S", Price = 7.91M, Stock = 3652, ProductUrl = "/Content/Images/placeholder.gif", });
            products.Add(new Product() { TypeId = 6, SupplierId = 6, ProductName = "23001005", Price = 14.99M, Stock = 1899, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 7, SupplierId = 7, ProductName = "OM 2391", Price = 8.99M, Stock = 8923, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 8, SupplierId = 8, ProductName = "WD System", Price = 12.99M, Stock = 892, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 7, SupplierId = 12, ProductName = "23001005", Price = 14.99M, Stock = 482, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 8, SupplierId = 1, ProductName = "021M 91", Price = 8.99M, Stock = 949, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 8, SupplierId = 9, ProductName = "4001D System", Price = 12.99M, Stock = 2349, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 1, SupplierId = 9, ProductName = "4oS", Price = 12.99M, Stock = 4365, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 2, SupplierId = 4, ProductName = "34MIO1we", Price = 14.99M, Stock = 2349, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 3, SupplierId = 12, ProductName = "2300qw05", Price = 8.99M, Stock = 499, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 4, SupplierId = 7, ProductName = "021wqq", Price = 14.44M, Stock = 899, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 5, SupplierId = 2, ProductName = "4001D System", Price = 12.99M, Stock = 2349, ProductUrl = "/Content/Images/placeholder.gif" });
            products.Add(new Product() { TypeId = 6, SupplierId = 5, ProductName = "4ymt", Price = 11.49M, Stock = 1355, ProductUrl = "/Content/Images/placeholder.gif" });


          
            foreach (Type type in types) context.Types.Add(type);
            foreach (Supplier supp in suppliers) context.Suppliers.Add(supp);           


            foreach (Product prod in products) context.Products.Add(prod);
            //context.SaveChanges();
            base.Seed(context);       
          
        }
    }
}
