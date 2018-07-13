using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProviderAppver3;

namespace ProviderAppver3.Controllers
{
    public class ImagesTwoesController : Controller
    {
        private ProviderDBV2Entities db = new ProviderDBV2Entities();

        // GET: ImagesTwoes
        public ActionResult Index()
        {
            var imagesTwoes = db.ImagesTwoes.Include(i => i.Customer).Include(i => i.Provider);
            return View(imagesTwoes.ToList());
        }

        // GET: ImagesTwoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImagesTwo imagesTwo = db.ImagesTwoes.Find(id);
            if (imagesTwo == null)
            {
                return HttpNotFound();
            }
            return View(imagesTwo);
        }

        // GET: ImagesTwoes/Create
        public ActionResult Create()
        {
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "CustomerName");
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "ProviderName");
            return View();
        }

        // POST: ImagesTwoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ImageID,ImageBin,ImageIMG,CustomerID,ProviderID")] ImagesTwo imagesTwo)
        {
            if (ModelState.IsValid)
            {
                db.ImagesTwoes.Add(imagesTwo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "CustomerName", imagesTwo.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "ProviderName", imagesTwo.ProviderID);
            return View(imagesTwo);
        }

        // GET: ImagesTwoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImagesTwo imagesTwo = db.ImagesTwoes.Find(id);
            if (imagesTwo == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "CustomerName", imagesTwo.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "ProviderName", imagesTwo.ProviderID);
            return View(imagesTwo);
        }

        // POST: ImagesTwoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ImageID,ImageBin,ImageIMG,CustomerID,ProviderID")] ImagesTwo imagesTwo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(imagesTwo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "CustomerName", imagesTwo.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "ProviderName", imagesTwo.ProviderID);
            return View(imagesTwo);
        }

        // GET: ImagesTwoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImagesTwo imagesTwo = db.ImagesTwoes.Find(id);
            if (imagesTwo == null)
            {
                return HttpNotFound();
            }
            return View(imagesTwo);
        }

        // POST: ImagesTwoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ImagesTwo imagesTwo = db.ImagesTwoes.Find(id);
            db.ImagesTwoes.Remove(imagesTwo);
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
