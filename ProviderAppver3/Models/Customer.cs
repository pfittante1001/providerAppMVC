using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProviderAppver3
{
    [MetadataType(typeof(Custmetadata))]
    public partial class Customer
    {
    }

    public class Custmetadata
    {
        [DisplayName("Name")]
        public string CustomerName { get; set; }
        [DisplayName("Phone")]
        public string CustomerPhone { get; set; }
        [DisplayName("Email")]
        public string CustomerEmail { get; set; }
        public string UserName { get; set; }
    }
}