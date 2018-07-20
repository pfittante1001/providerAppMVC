using GoogleMaps.LocationServices;
using Microsoft.AspNet.Identity;
using System;
using System.Data;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProviderAppver3.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        //private ProviderDBV2Entities db = new ProviderDBV2Entities();

        //public ActionResult Maps()
        //{
        //    string num;
        //    string street;
        //    string city;
        //    string state;
        //    string name;
        //    int userid;
        //    string id = User.Identity.GetUserId(); //saves currently logged in user id to string id
        //    bool? provider = (from pr in db.AspNetUsers where pr.Id == id select pr.IsProvider).First(); //finds currently logged in user and checks if they are a provider or not then...
        //    if ((bool)provider)
        //    {
        //        userid = (from p in db.Providers where p.UserName == id select p.ProviderID).First();
        //        name = (from p in db.Providers where p.UserName == id select p.ProviderName).First();
        //        num = (from a in db.Addresses where a.ProviderID == userid select a.StreetNumber).First();
        //        street = (from a in db.Addresses where a.ProviderID == userid select a.StreetName).First();
        //        city = (from a in db.Addresses where a.ProviderID == userid select a.City).First(); ;
        //        state = (from a in db.Addresses where a.ProviderID == userid select a.State).First();
        //    }
        //    else
        //    {
        //        userid = (from c in db.Customers where c.UserName == id select c.CustomerID).First();
        //        name = (from c in db.Customers where c.UserName == id select c.CustomerName).First();
        //        num = (from a in db.Addresses where a.CustomerID == userid select a.StreetNumber).First();
        //        street = (from a in db.Addresses where a.CustomerID == userid select a.StreetName).First();
        //        city = (from a in db.Addresses where a.CustomerID == userid select a.City).First(); ;
        //        state = (from a in db.Addresses where a.CustomerID == userid select a.State).First();

        //    }


        //    var address = num + " " + street + ", " + city + ", " + state;
        //    var locationService = new GoogleLocationService();
        //    var point = locationService.GetLatLongFromAddress(address);

        //    var latitude = point.Latitude;
        //    var longitude = point.Longitude;
        //    ViewBag.Latitude = latitude;
        //    ViewBag.Longitude = longitude;
        //    ViewBag.Name = name;
        //    return View();

        //}
    }
}