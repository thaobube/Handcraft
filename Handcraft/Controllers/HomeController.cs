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
        public ActionResult Index()
        {
            HomeViewModel hm = new HomeViewModel();
            return View(hm);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactModel cm)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
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
        public ActionResult Class()
        {
            ViewBag.Message = "Your class page.";

            return View();
        }
    }
}