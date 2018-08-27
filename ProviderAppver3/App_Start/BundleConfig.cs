using System.Web;
using System.Web.Optimization;

namespace ProviderAppver3
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));
            bundles.Add(new ScriptBundle("~/bundles/scripts").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery.validate*",
                        "~/Scripts/loadCustMarkers.js",
                        "~/Scripts/loadMap.js",
                        "~/Scripts/clearMap.js",
                        "~/Scripts/createCustMarker.js",
                        "~/Scripts/GetProvRankings.js",
                        "~/Scripts/overlay.js",


                        "~/Scripts/loadProviders.js",
                        "~/Scripts/addMarkersToMap.js",
                        //"~/Scripts/openChat.js",
                        "~/Scripts/providerRankingsStar.js",
                        "~/Scripts/rangeScript.js",
                        "~/Scripts/ratingPop.js",
                        "~/Scripts/slider.js",
                        "~/Scripts/topProviderRankings.js"));


            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));
        }
    }
}
