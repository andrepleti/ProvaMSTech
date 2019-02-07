using ProvaMsTech.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProvaMsTech.Controllers
{
    public class CustomersController : Controller
    {
        NorthwindEntities db;

        public CustomersController()
        {
            db = new NorthwindEntities();
        }
        // GET: Customers
        public ActionResult Index()
        {
            var customers = db.Customers.ToList();
            return View(customers);
        }

        public ActionResult Create()
        {
            ViewBag.Customers = db.Customers;
            var model = new Customers();
            return View(model);
        }
        [HttpPost]
        public ActionResult Save(Customers data)
        {
            Random rdm = new Random();
            data.CustomerID = data.CompanyName.Substring(0, 3) + rdm.Next(data.CompanyName.Length) + rdm.Next(data.CompanyName.Length);
            db.Customers.Add(data);
            db.SaveChanges();
            ViewBag.Customers = db.Customers;
            var model = new Customers();
            return View(model);
        }
    }
}