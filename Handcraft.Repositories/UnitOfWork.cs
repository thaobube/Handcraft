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
        IConcreteRepository<FullClassEntity> _fullClassRepo;
        IConcreteRepository<CategoryEntity> _categoryRepo;
        IConcreteRepository<ContactMessageEntity> _contactMessageRepo;
        IConcreteRepository<UserEntity> _userRepo;
        public UnitOfWork(string connectionString)
        {
            _classRepo = new ClassRepository(connectionString);
            _fullClassRepo = new FullClassRepository(connectionString);
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
                cgm.Name = item.Name;
                cgm.Picture = item.Picture;
                categoryListForController.Add(cgm);
            }
            return categoryListForController;
        }
        #endregion

        public int CountClasses()
        {
            return _classRepo.Get().Count();
        }
        
        public int CountClassesAllPage(string sortOrder, string category, string searchString, int page)
        {
            return ((ClassRepository)_classRepo).GetClassEntityAllPage(sortOrder, category, searchString, page).Count();
        }
        
        #region Class
        public List<ClassModel> GetClassModelByPage(string sortOrder, string category, string searchString, int page)
        {
            // Get the classes from DB
            List<ClassEntity> classListfromDB = ((ClassRepository)_classRepo).GetClassEntityByPage(sortOrder, category, searchString, page);
            //Mapping
            List<ClassModel> classListforController = new List<ClassModel>();
            foreach (ClassEntity item in classListfromDB)
            {
                ClassModel cm = new ClassModel();
                cm.IdClass = item.IdClass;
                cm.ClassName = item.ClassName;
                cm.Price = System.Math.Round(item.Price, 2);
                cm.ThumbnailFront = "../images/Classes/" + item.IdClass + "/" + item.ThumbnailFront;
                cm.ThumbnailBack = "../images/Classes/" + item.IdClass + "/" + item.ThumbnailBack;
                cm.CategoryName = item.CategoryName;
                cm.Date = item.Date.ToString("dd/MM/yyyy");
                classListforController.Add(cm);
            }
            return classListforController;
        }

        public List<ClassModel> GetFeaturedClassModel(int number)
        {
            // Get the number of the classes from DB
            List<ClassEntity> featuredClassesfromDB = ((ClassRepository)_classRepo).GetFeaturedClassEntity(number);
            List<ClassModel> featuredClassesforController = new List<ClassModel>();
            //Mapping
            foreach (ClassEntity item in featuredClassesfromDB)
            {
                ClassModel cm = new ClassModel();
                cm.IdClass = item.IdClass;
                cm.ClassName = item.ClassName;
                cm.Price = System.Math.Round(item.Price, 2); 
                cm.ThumbnailFront = "/images/Classes/" + item.IdClass + "/" + item.ThumbnailFront;
                cm.ThumbnailBack = "/images/Classes/" + item.IdClass + "/" + item.ThumbnailBack;
                cm.CategoryName = item.CategoryName;
                cm.Date = item.Date.ToString("dd/MM/yyyy");
                featuredClassesforController.Add(cm);
            }
            return featuredClassesforController;
        }

        public int CountClassByCategory (string categoryName)
        {
            // Get the classes from DB
            List<ClassEntity> classesByCategoryfromDB = ((ClassRepository)_classRepo).GetClassEntityByCategory(categoryName);
            int count = classesByCategoryfromDB.Count();
            return count;
        }
        #endregion

        public FullClassModel GetTargetClassModel(int PK)
        {
            // Get the target class entity
            FullClassEntity classfromDB = _fullClassRepo.GetOne(PK);

            // Mapping
            FullClassModel classforController = new FullClassModel();
            classforController.IdClass = classfromDB.IdClass;
            classforController.ClassName = classfromDB.ClassName;
            classforController.Description = classfromDB.Description;
            classforController.Price = System.Math.Round(classfromDB.Price, 2);
            classforController.Duration = classfromDB.Duration;
            classforController.FirstNameCoordinator = classfromDB.FirstNameCoordinator;
            classforController.LastNameCoordinator = classfromDB.LastNameCoordinator;
            classforController.FirstNameTutor = classfromDB.FirstNameTutor;
            classforController.LastNameTutor = classfromDB.LastNameTutor;
            classforController.ThumbnailFront = "/images/Classes/" + classfromDB.IdClass + "/" + classfromDB.ThumbnailFront;
            classforController.ThumbnailBack = "/images/Classes/" + classfromDB.IdClass + "/" + classfromDB.ThumbnailBack;

            classforController.StudioName = classfromDB.StudioName;
            classforController.Number = classfromDB.Number;
            classforController.Street = classfromDB.Street;
            classforController.City = classfromDB.City;
            classforController.Country = classfromDB.Country;
            classforController.Date = classfromDB.Date.ToString("dd/MM/yyyy");
            classforController.TimeStart = classfromDB.TimeStart;
            classforController.TimeEnd = classfromDB.TimeEnd;
            classforController.CategoryName = classfromDB.CategoryName;
            return classforController;
        }

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

        #region Login
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
                if (sh.VerifyHash(lm.Password, ue.Password, ue.Salt))
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
        #endregion

        #region SignUp
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
        #endregion

        public bool EditUserProfilePicture(UserModel um)
        {
            // Mapping
            UserEntity ue = new UserEntity();
            ue.IdUser = um.IdUser;
            ue.Picture = um.Picture;

            return ((UserRepository)_userRepo).UpdatePicture(ue);
        }

    }
}
