using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using ProviderAppver3;

namespace ProviderAppver3.Controllers
{
    public class AddressesController : Controller
    {
        private ProviderDBV2Entities db = new ProviderDBV2Entities();

        // GET: Addresses
        [Authorize]
        public ActionResult Index()
        {
            var addresses = db.Addresses.Include(a => a.Customer).Include(a => a.Provider);
            return View(addresses.ToList());
        }

        // GET: Addresses/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Address address = db.Addresses.Find(id);
            if (address == null)
            {
                return HttpNotFound();
            }
            return View(address);
        }

        // GET: Addresses/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Addresses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create([Bind(Include = "AddressID,StreetNumber,StreetName,City,State,PostalCode,CustomerID,ProviderID")] Address address)
        {
            if (ModelState.IsValid)
            {
                string id = User.Identity.GetUserId(); //saves currently logged in user id to string id
                bool? provider = (from pr in db.AspNetUsers where pr.Id == id select pr.IsProvider).Single(); //finds currently logged in user and checks if they are a provider or not then...
                if ((bool) provider)
                {
                    address.ProviderID = (from p in db.Providers where p.UserName == id select p.ProviderID).First(); //if they are a provider, it finds their provider id in the database and saves it as the provider id in the addresses table
                }
                else
                {
                    address.CustomerID = (from c in db.Customers where c.UserName == id select c.CustomerID).First(); //if they are not a provider, it finds the customer id in the databse and saves it as the customer id in the addresses table
                }
                db.Addresses.Add(address);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(address);
        }

        // GET: Addresses/Edit/5
        [Authorize]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Address address = db.Addresses.Find(id);
            if (address == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "CustomerName", address.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "ProviderName", address.ProviderID);
            return View(address);
        }

        // POST: Addresses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit([Bind(Include = "AddressID,StreetNumber,StreetName,City,State,PostalCode,CustomerID,ProviderID")] Address address)
        {
            if (ModelState.IsValid)
            {
                db.Entry(address).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "CustomerName", address.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "ProviderName", address.ProviderID);
            return View(address);
        }

        // GET: Addresses/Delete/5
        [Authorize]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Address address = db.Addresses.Find(id);
            if (address == null)
            {
                return HttpNotFound();
            }
            return View(address);
        }

        // POST: Addresses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Address address = db.Addresses.Find(id);
            db.Addresses.Remove(address);
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
    }
}
