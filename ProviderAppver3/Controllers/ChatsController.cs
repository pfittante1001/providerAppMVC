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
            return View(chat);
        }

        // GET: Chats/Create
        public JsonResult GetChatID(int cid, int pid)
        {
            int? chatid = (from c in db.Chats
                          where c.CustomerID == cid &&
                          c.ProviderID == pid
                          select c.ChatID).First();

            if (chatid == null)
            {
                chatid = 0;
            }

            return Json(chatid, JsonRequestBehavior.AllowGet);
        }

        // POST: Chats/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult Create(int cid, int pid, Chat chat)
        {
            if (ModelState.IsValid)
            {
                chat.CustomerID = cid;
                chat.ProviderID = pid;
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
    }
}
