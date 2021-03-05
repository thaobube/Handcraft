using System.Web;
using System.Web.Optimization;

namespace Handcraft
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));            
            bundles.Add(new ScriptBundle("~/bundles/jquery-ui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/css/style-profile.css"));
            bundles.Add(new StyleBundle("~/Content/StyleStarter").Include(
                      "~/css/style-starter.css"));

            bundles.Add(new StyleBundle("~/Content/StyleLiberty").Include(
          "~/css/style-liberty.css"));

            bundles.Add(new StyleBundle("~/Content/StyleClass").Include(
"~/css/style-class.css"));
            bundles.Add(new StyleBundle("~/Content/FontAwesome").Include(
"~/css/font-awesome.min.css"));

            bundles.Add(new ScriptBundle("~/bundles/minicart").Include(
                      "~/js/minicart.js"));

            bundles.Add(new ScriptBundle("~/bundles/manificpopup").Include(
                      "~/js/jquery.magnific-popup.js"));

            //bundles.Add(new ScriptBundle("~/bundles/JqueryUI").Include(
            //          "~/js/jquery-ui.js"));
            bundles.Add(new ScriptBundle("~/bundles/Bootstrap").Include(
          "~/js/bootstrap.min.js"));


        }
    }
}
