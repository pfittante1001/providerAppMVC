using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
namespace ProviderAppver3.Models
{
    public class Common
    {
        public List<MapData> MapData { get; set; }
        public List<Prov> Prov { get; set; }
    }
}