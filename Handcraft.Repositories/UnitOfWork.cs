using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using Handcraft.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tools;

namespace Handcraft.Repositories
{
    public class UnitOfWork
    {
        IConcreteRepository<ClassEntity> _classRepo;
        IConcreteRepository<CategoryEntity> _categoryRepo;
        IConcreteRepository<ContactMessageEntity> _contactMessageRepo;
        IConcreteRepository<UserEntity> _userRepo;
        public UnitOfWork(string connectionString)
        {
            _classRepo = new ClassRepository(connectionString);
            _categoryRepo = new CategoryRepository(connectionString);
            _contactMessageRepo = new ContactMessageRepository(connectionString);
            _userRepo = new UserRepository(connectionString);
        }

        #region Category
        public List<CategoryModel> GetAllCategoryModel()
        {
            // Get all the category from DB
            List<CategoryEntity> categoryListFromDB = _categoryRepo.Get();
            // Mapping
            List<CategoryModel> categoryListForController = new List<CategoryModel>();
            foreach (CategoryEntity item in categoryListFromDB)
            {
                CategoryModel cgm = new CategoryModel();
                cgm.Link = item.Link;
                cgm.Name = item.Name;
                cgm.Picture = item.Picture;
                categoryListForController.Add(cgm);
            }
            return categoryListForController;
        }
        #endregion

        #region Class
        public List<ClassModel> GetAllClassModel()
        {
            // Get all the classes from DB
            List<ClassEntity> classListfromDB = _classRepo.Get();
            //Mapping
            List<ClassModel> classListforController = new List<ClassModel>();
            foreach (ClassEntity item in classListfromDB)
            {
                ClassModel cm = new ClassModel();
                cm.IdClass = item.IdClass;
                cm.ClassName = item.ClassName;
                cm.Description = item.Description;
                cm.TrailerURL = item.TrailerURL;
                cm.Price = item.Price;
                cm.Duration = new TimeSpan(item.Duration);
                cm.FirstNameCoordinator = item.FirstNameCoordinator;
                cm.LastNameCoordinator = item.LastNameCoordinator;
                cm.FirstNameTutor = item.FirstNameTutor;
                cm.LastNameTutor = item.LastNameTutor;
                cm.ThumbnailFront = item.ThumbnailFront;
                cm.ThumbnailBack = item.ThumbnailBack;
                cm.ThumbnailDetail1 = item.ThumbnailDetail1;
                cm.ThumbnailDetail2 = item.ThumbnailDetail2;
                cm.ThumbnailDetail3 = item.ThumbnailDetail3;
                classListforController.Add(cm);
            }
            return classListforController;
        }
        #endregion

        #region Contact
        public bool SaveContact(ContactModel cm)
        {
            // Mapping
            ContactMessageEntity cme = new ContactMessageEntity();
            cme.Name = cm.Name;
            cme.Email = cm.Email;
            cme.Subject = cm.Subject;
            cme.MessageContent = cm.MessageContent;

            return _contactMessageRepo.Insert(cme);
        }
        #endregion

        public UserModel UserVefif(LoginModel lm)
        {
            UserEntity ue = ((UserRepository)_userRepo).GetUserEntityFromLogin(lm.Login);
            if (ue == null)
            {
                return null;
            }
            else
            {
                SecurityHelper sh = new SecurityHelper();
                if (sh.VerifyHash(lm.Password, ue.Password,ue.Salt))
                {
                    return new UserModel()
                    {
                        // Mapping
                        IdUser = ue.IdUser,
                        FirstName = ue.FirstName,
                        LastName = ue.LastName,
                        Email = ue.Email,
                        Phone = ue.Phone,
                        Login = ue.Login,
                        Picture = ue.Picture
                    };
                }
                else
                {
                    return null;
                }
            }
        }

        public bool CreateUser(UserModel um)
        {
            SecurityHelper sh = new SecurityHelper();
            // Mapping
            UserEntity ue = new UserEntity();
            ue.IdUser = um.IdUser;
            ue.FirstName = um.FirstName;
            ue.LastName = um.LastName;
            ue.Email = um.Email;
            ue.Login = um.Login;

            byte[] newSalt = sh.GenerateLongRandomSalt();
            ue.Salt = Convert.ToBase64String(newSalt);

            string hashPwd = sh.createHash(um.Password, newSalt);
            ue.Password = hashPwd;
            return _userRepo.Insert(ue);
        }

    }
}
