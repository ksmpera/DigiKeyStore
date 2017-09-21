using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using MVCDigiKeyStore.Models;
using System.ComponentModel.DataAnnotations;

namespace MVCDigiKeyStore.Models
{
    public class DigiKeyStoreContext :  DbContext
    {
        public DigiKeyStoreContext()
            : base("DigiKeyStoreEntities")
        {
             //Database.SetInitializer<DigiKeyStoreContext>(new DropCreateDatabaseIfModelChanges<DigiKeyStoreContext>());
             //Database.SetInitializer<DigiKeyStoreContext>(new CreateDatabaseIfNotExists<DigiKeyStoreContext>());
            //Database.SetInitializer<DigiKeyStoreContext>(new DropCreateDatabaseAlways<DigiKeyStoreContext>());
            //Database.SetInitializer(new SampleData());            
             Database.SetInitializer<DigiKeyStoreContext>(new SampleData());
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Type> Types { get; set; }

        public DbSet<Supplier> Suppliers { get; set; }
        public DbSet<Cart> Carts { get; set; } 
        public DbSet<Order> Orders { get; set; } 
        public DbSet<OrderDetail> OrderDetails { get; set; }

        
    }
}




