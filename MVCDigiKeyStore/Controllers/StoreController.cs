using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCDigiKeyStore.Models;
using MVCDigiKeyStore.ViewModels;

namespace MVCDigiKeyStore.Controllers
{
    public class StoreController : Controller
    {
        DigiKeyStoreContext storeDB = new DigiKeyStoreContext();
        // GET: /Store/
        public ActionResult Index()
        {
            var types = storeDB.Types.ToList();

            return View(types);
        }

        //GET: /Store/Browse?type=Kits
        public ActionResult Browse(string type)
        {
            // Retrieve Genre and its Associated products from database
            var typeModel = storeDB.Types.Include("Products")
            .Single(g => g.Name == type);
            return View(typeModel);
        }

        //
        // GET: /Store/Details/5
        public ActionResult Details(int id)
        {
            var product = storeDB.Products.Find(id);

            return View(product);
        }

        //
        // GET: /Store/TypeMenu
        [ChildActionOnly]
        public ActionResult TypeMenu()
        {
            var types = storeDB.Types.ToList();
            return PartialView(types);
        }

    }
}
