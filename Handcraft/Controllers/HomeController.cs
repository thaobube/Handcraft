using Handcraft.Models;
using Handcraft.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Handcraft.Controllers
{
    public class HomeController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        public ActionResult Index()
        {
            ViewBag.Home = "active";
            HomeViewModel hm = new HomeViewModel();
            return View(hm);
        }

        public ActionResult About()
        {
            ViewBag.About = "active";
            ViewBag.Message = "Your application description page.";
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Contact = "active";
            ViewBag.Message = "Your contact page.";
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactModel cm)
        {
            if (ModelState.IsValid)
            {
                if (uow.SaveContact(cm))
                {
                    ViewBag.SuccessMessage = "Message sent successfully.";
                    return View();
                }
                else
                {
                    ViewBag.ErrorMessage = "Message Not Sent Error";
                    return View();
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Form Error";
                return View();
            }
        }
        public ActionResult Class(string sortOrder = "", string category = "", string searchString = null, int page = 1)
        {
            ViewBag.DateSort = String.IsNullOrEmpty(sortOrder) ? "date_desc" : "";
            ViewBag.PriceSort = sortOrder == "price_desc" ? "price_asc" : "price_desc";
            ViewBag.Class = "active";
            ViewBag.Message = "Your class page.";
            ClassViewModel cvm = new ClassViewModel();
            cvm.paginateClass(sortOrder, category, searchString, page);
            return View(cvm);
        }
        [HttpGet]
        public ActionResult ClassInfo(int id)
        {
            ViewBag.Message = "Class Info";
            ViewBag.IndexClass = id;
            ClassInfoViewModel civm = new ClassInfoViewModel();
            civm.TargetClass = uow.GetTargetClassModel(id);
            return View(civm);
        }
    }
}