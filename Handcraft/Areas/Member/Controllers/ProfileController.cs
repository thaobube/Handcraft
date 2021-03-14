using Handcraft.Infra;
using Handcraft.Models;
using Handcraft.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Handcraft.Areas.Member.Controllers
{
    public class ProfileController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private string[] validImageType = { ".png", ".jpg", ".jpeg" };

        // GET: Member/Profile
        public ActionResult EditPicture()
        {
            return View(SessionUtils.ConnectedUser);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPicture(UserModel um, HttpPostedFileBase FilePicture)
        {
            // 1. Check the image size > 0 and < 200Mb
            if (FilePicture.ContentLength > 0 && FilePicture.ContentLength < 20000)
            {
                //2. Check the image type
                string extension = Path.GetExtension(FilePicture.FileName);
                if (validImageType.Contains(extension))
                {
                    //3. Check if the destination folder exist
                    //C:\WorkSpace_Thao\aspNet project\Handcraft\Handcraft\images\Users\{IdUser}
                    string destFolder = Path.Combine(Server.MapPath("~/images/Users"), SessionUtils.ConnectedUser.IdUser.ToString());
                    if (!Directory.Exists(destFolder))
                    {
                        Directory.CreateDirectory(destFolder);
                    }
                    //4. Upload the image
                    FilePicture.SaveAs(Path.Combine(destFolder, FilePicture.FileName));
                    //5. Update the Picture of the Connected User
                    SessionUtils.ConnectedUser.Picture = FilePicture.FileName;
                    // 6. Save in the DB
                    uow.EditUserProfilePicture(SessionUtils.ConnectedUser);
                    return RedirectToAction("Index", "Home");
                }
            }
            

            return View(SessionUtils.ConnectedUser);
        }
    }
}