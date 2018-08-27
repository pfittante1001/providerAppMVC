using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace ProviderAppver3.Models
{
    public class Prov
    {
        public string ProviderName { get; set; }
        public int ProviderID { get; set; }
        public string Address { get; set; }
        public string ProviderPhone { get; set; }
        //public List<Prov> prov  { get; set; }
    }
}