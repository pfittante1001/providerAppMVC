
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
    
public partial class ArticlesComment
{

    public int CommentID { get; set; }

    public string Comments { get; set; }

    public Nullable<System.DateTime> ThisDateTime { get; set; }

    public Nullable<int> ProviderID { get; set; }

    public Nullable<int> Rating { get; set; }



    public virtual Provider Provider { get; set; }

}

}
