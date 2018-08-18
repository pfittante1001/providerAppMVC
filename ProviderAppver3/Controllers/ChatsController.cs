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
    public class ChatsController : Controller
    {
        private ProviderDBV2Entities db = new ProviderDBV2Entities();

        // GET: Chats
        public ActionResult Index()
        {
            var chats = db.Chats.Include(c => c.Customer).Include(c => c.Provider);
            return View(chats.ToList());
        }

        // GET: Chats/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
                 
            Chat chat = db.Chats.Find(id);
            if (chat == null)
            {
                return HttpNotFound();
            }

            int? custid = (from c in db.Chats where c.ChatID == id select c.CustomerID).First();
            int? proid = (from c in db.Chats where c.ChatID == id select c.ProviderID).First();
            int addid = (from a in db.Addresses where a.CustomerID == custid select a.AddressID).First();

            Address location = db.Addresses.Find(addid);
            string num = location.StreetNumber;
            string street = location.StreetName;
            string city = location.City;
            string state = location.State;
            var address = num + " " + street + ", " + city + ", " + state;

            string cname = (from c in db.Customers where c.CustomerID == custid select c.CustomerName).First();

            ViewBag.Pid = proid;
            ViewBag.Name = cname;
            ViewBag.Address = address;

            return View(chat);
        }

        // GET: Chats/Create
        public JsonResult GetChatID(int cid, int pid)
        {
            int? chatid = (from c in db.Chats
                          where c.CustomerID == cid &&
                          c.ProviderID == pid
                          select c.ChatID).First();

            return Json(chatid, JsonRequestBehavior.AllowGet);
        }

        // POST: Chats/Create

        public JsonResult CreateFromMap(int cid, int pid, string search, string cname, Chat chat)
        {
            if (ModelState.IsValid)
            {
                chat.CustomerID = cid;
                chat.ProviderID = pid;
                chat.Message = "You have a new request from " + cname + " regarding " + search + " services. ";
                db.Chats.Add(chat);
                db.SaveChanges();
            }

            int? chatid = (from c in db.Chats
                           where c.CustomerID == cid &&
                           c.ProviderID == pid
                           select c.ChatID).First();

            return Json(chatid, JsonRequestBehavior.AllowGet);



        }

       

        // GET: Chats/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chat chat = db.Chats.Find(id);
            if (chat == null)
            {
                return HttpNotFound();
            }
            return View(chat);
        }

        // POST: Chats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Chat chat = db.Chats.Find(id);
            db.Chats.Remove(chat);
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

        public JsonResult GetCurrentAddress(int pid)
        {
           int PAddID = (from a in db.Addresses where a.ProviderID == pid select a.AddressID).First();

            Address location = db.Addresses.Find(PAddID);
            string num = location.StreetNumber;
            string street = location.StreetName;
            string city = location.City;
            string state = location.State;
            var paddress = num + " " + street + ", " + city + ", " + state;


            return Json(paddress, JsonRequestBehavior.AllowGet);
        }
    }
}
