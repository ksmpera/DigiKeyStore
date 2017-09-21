using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations.Schema;

namespace MVCDigiKeyStore.Models
{
    public class Product
    {
        public Product()
        {
           
        }
        [Key]
        public int ProductId { get; set; }
        [DisplayName("Type")]
        public int TypeId { get; set; }
        [DisplayName("Supplier")]
        public int SupplierId { get; set; }
        [Required(ErrorMessage = "An Product name is required")]
        [StringLength(160)]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Price is required")]
        [Range(0.01, 100.00,
        ErrorMessage = "Price must be between 0.01 and 100.00")]
        public decimal Price { get; set; }
        [Range(0, 10000,
        ErrorMessage = "Stock must be between 0 and 10000")]
        public int Stock { get; set; }

        [DisplayName("ProductURL")]
        [StringLength(1024)]
        public string ProductUrl { get; set; }

        [ForeignKey("TypeId")]
        public virtual Type Type { get; set; }
        [ForeignKey("SupplierId")]
        public virtual Supplier Supplier { get; set; }
        public virtual List<OrderDetail> OrderDetails { get; set; }
    }
}