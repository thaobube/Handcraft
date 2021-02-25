using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using Handcraft.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Repositories
{
    public class UnitOfWork
    {
        IConcreteRepository<ClassEntity> _classRepo;
        IConcreteRepository<CategoryEntity> _categoryRepo;
        public UnitOfWork(string connectionString)
        {
            _classRepo = new ClassRepository(connectionString);
            _categoryRepo = new CategoryRepository(connectionString);
        }

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
    }
}
