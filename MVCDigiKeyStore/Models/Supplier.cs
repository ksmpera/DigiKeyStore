using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

namespace MVCDigiKeyStore.Models
{
    public class Supplier
    {
        public Supplier()
        {
          
        }
        public int SupplierId { get; set; }
        public string Name { get; set; }
        public List<Product> Products { get; set; }
    }
}