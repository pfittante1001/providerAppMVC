using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GoogleMaps.LocationServices;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using ProviderAppver3;

namespace ProviderAppver3.Controllers
{
    public class CustomersController : Controller
    {
        private ProviderDBV2Entities db = new ProviderDBV2Entities();

        // GET: Customers
        [Authorize]
        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.AspNetUser);

            return View(customers.ToList());
        }

        // GET: Customers/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            string name = customer.CustomerName;
            int custid = (from a in db.Addresses where a.CustomerID == id select a.AddressID).First();
            Address location = db.Addresses.Find(custid);
            string num = location.StreetNumber;
            string street = location.StreetName;
            string city = location.City;
            string state = location.State;
            var address = num + " " + street + ", " + city + ", " + state;
            var locationService = new GoogleLocationService();
            var point = locationService.GetLatLongFromAddress(address);
            var latitude = point.Latitude;
            var longitude = point.Longitude;
            ViewBag.Latitude = latitude;
            ViewBag.Longitude = longitude;
            ViewBag.Name = name;
            return View(customer);
        }

        // GET: Customers/Create
        [Authorize]
        public ActionResult Create()
        {
            ViewBag.CustomerEmail = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "CustomerID,CustomerName,CustomerPhone,CustomerEmail,UserName")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.UserName = User.Identity.GetUserId(); //makes asp.net user email equal to the customer email
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Create", "Addresses");
            }

            ViewBag.UserName = new SelectList(db.AspNetUsers, "Id", "Email", customer.UserName);
            return View(customer);
        }

        // GET: Customers/Edit/5
        [Authorize]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserName = new SelectList(db.AspNetUsers, "Id", "Email", customer.UserName);
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit([Bind(Include = "CustomerID,CustomerName,CustomerPhone,CustomerEmail,UserName")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserName = new SelectList(db.AspNetUsers, "Id", "Email", customer.UserName);
            return View(customer);
        }

        // GET: Customers/Delete/5
        [Authorize]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public JsonResult GetSnowProviders()
        {
            var snowproviders = (from p in db.Providers
                                 where p.IsSnow == true &&
                                 p.Active == true
                                 select p.ProviderID).ToArray();
            Object[] result = new Object[snowproviders.Length];
            int i = 0;
            foreach (int provider in snowproviders)
            {
                string providername = (from p in db.Providers
                                       where p.ProviderID == provider
                                       select p.ProviderName).First().ToString();

                string num = (from a in db.Addresses
                              where a.ProviderID == provider
                              select a.StreetNumber).First();
                string street = (from a in db.Addresses
                                 where a.ProviderID == provider
                                 select a.StreetName).First();
                string city = (from a in db.Addresses
                               where a.ProviderID == provider
                               select a.City).First();
                string state = (from a in db.Addresses
                                where a.ProviderID == provider
                                select a.State).First();
                var address = num + " " + street + ", " + city + ", " + state;
                var locationService = new GoogleLocationService();
                var point = locationService.GetLatLongFromAddress(address);

                var lat = point.Latitude.ToString();
                var log = point.Longitude.ToString();
                Provider snowprovider = new Provider()
                {
                    ProviderName = providername,
                    Title = lat,
                    Description = log,
                    ProviderID = provider
                };

                result[i] = snowprovider;
                i++;
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}

