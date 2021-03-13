using Handcraft.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Handcraft.Models
{
    public class ClassViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private List<CategoryModel> _category;
        private List<ClassModel> _classes;
        private int _maxClass, _maxPage;

        public ClassViewModel()
        {
            // Section Class Category
            Category = uow.GetAllCategoryModel();
            foreach (CategoryModel item in Category)
            {
                item.Count = uow.CountClassByCategory(item.Name);
            }

            MaxClass = uow.CountClasses();
            if ((MaxClass % 9) == 0)
            {
                MaxPage = MaxClass / 9;
            }
            else
            {
                double nbPage = MaxClass / 9;
                MaxPage = (int)Math.Floor(nbPage) + 1;
            }
        }

        public void paginateClass(string sortOrder = "", string category = "", string searchString = null, int page = 1)
        {
            // Section Classes
            Classes = uow.GetClassModelByPage(sortOrder, category, searchString, page);
            if (searchString != null || category != "")
            {
                
                MaxClass = uow.CountClassesAllPage(sortOrder, category, searchString, page);
                if ((MaxClass % 9) == 0)
                {
                    MaxPage = MaxClass / 9;
                }
                else
                {
                    double nbPage = MaxClass / 9;
                    MaxPage = (int)Math.Floor(nbPage) + 1;
                }
            }
        }

        public List<CategoryModel> Category
        {
            get
            {
                return _category;
            }

            set
            {
                _category = value;
            }
        }

        public List<ClassModel> Classes
        {
            get
            {
                return _classes;
            }

            set
            {
                _classes = value;
            }
        }

        public int MaxClass
        {
            get
            {
                return _maxClass;
            }

            set
            {
                _maxClass = value;
            }
        }

        public int MaxPage
        {
            get
            {
                return _maxPage;
            }

            set
            {
                _maxPage = value;
            }
        }
    }
}