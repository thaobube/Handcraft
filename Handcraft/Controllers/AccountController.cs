﻿using Handcraft.Infra;
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
    public class AccountController : Controller
    {

        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel lm)
        {
            if (ModelState.IsValid)
            {
                UserModel um = uow.UserVefif(lm);
                if (um == null)
                {
                    ViewBag.ErrorMessage = "Login/Password Error";
                    return View();
                }
                else
                {
                    SessionUtils.IsLogged = true;
                    SessionUtils.ConnectedUser = um;
                    return RedirectToAction("Index", "Home", new { area = "Member" });
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Login Error";
                return View();
            }
        }

        [HttpGet]
        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Signup(UserModel um)
        {
            if (ModelState.IsValid)
            {
                if (uow.CreateUser(um))
                {
                    ViewBag.SuccessMessage = "Congratulation, your account has been successfully created.";
                    return View();
                }
                else
                {
                    ViewBag.ErrorMessage = "There was an error creating your account. Please try again.";
                    return View();
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Sign Up Error";
                return View();
            }
        }
    }
}