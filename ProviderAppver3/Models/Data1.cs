using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
namespace ProviderAppver3.Models
{
    public class MapData
    {
        public double ProLat { get; set; }
        public double ProLng { get; set; }
        public double CustLat { get; set; }
        public double CustLng { get; set; }
        public char Unit { get; set; }
        public int ProID { get; set; }
        public int Counter { get; set; }
        public int Range { get; set; }
        public int ProviderID { get; set; }
        //public List<MapData> mapData { get; set; }
    }
}