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
            ViewBag.CID = id;

            Address location = db.Addresses.Find(custid);
            string num = location.StreetNumber;
            string street = location.StreetName;
            string city = location.City;
            string state = location.State;
            var address = num + " " + street + ", " + city + ", " + state;

            ViewBag.Address = address;
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


        public JsonResult GetProvRankings()
        {
            var getRankings = (from p in db.Providers
                               where p.Active == true
                               select p.ProviderID).ToArray();
            Object[] result = new Object[getRankings.Length];
            Dictionary<string, double?> Rating = new Dictionary<string, double?>();
            //int j = 0;
            foreach (int provider in getRankings)
            {
                string providername = (from p in db.Providers
                                       where p.ProviderID == provider
                                       select p.ProviderName).First().ToString();
                double? numRate = (from r in db.ArticlesComments
                               where r.ProviderID == provider
                               select r.Rating).Average();
                

                Rating.Add(providername, numRate);


            }
            
            var providerName = from x in Rating where x.Value == Rating.Max(v => v.Value) select x.Key;
            var maxRating = from x in Rating where x.Value == Rating.Max(v => v.Value) select x.Value;

            int providerID = (from p in db.Providers
                              where p.ProviderName.Equals(providerName)
                              select p.ProviderID).First();
            var providers = new { providerName, providerID, maxRating };
        
            return Json(providers, JsonRequestBehavior.AllowGet);

        }
       
        public JsonResult GetSnowProviders(string text)
        {
            var snowproviders = (from p in db.Providers
                                 where p.Services.Contains(text) &&
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
                string rate = (from r in db.ArticlesComments
                               where r.ProviderID == provider
                               select r.Rating).Average().ToString();
                street = street.Replace(" ", "%20");
                
                var address = num + "%20" + street + "%20" + city + "%20" + state;

                Provider snowprovider = new Provider() { 
                    ProviderName = providername,
                    Description = address,
                    ProviderID = provider,
                    ProviderPhone = rate
                };

                result[i] = snowprovider;
                i++;
            }



            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}

