//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProviderAppver3
{
    using System;
    using System.Collections.Generic;
    
    public partial class Image
    {
        public int ImageID { get; set; }
        public byte[] ImageBin { get; set; }
        public byte[] ImagIMG { get; set; }
        public Nullable<int> CustomerID { get; set; }
        public Nullable<int> ProviderID { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Provider Provider { get; set; }
    }
}
