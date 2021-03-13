using Handcraft.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Handcraft.Models
{
    public class ClassInfoViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private FullClassModel _targetClass;
        private List<ClassModel> _classes;

        public ClassInfoViewModel()
        {
            // Section featured classes
            Classes = uow.GetFeaturedClassModel(4);

        }
        public FullClassModel TargetClass
        {
            get
            {
                return _targetClass;
            }

            set
            {
                _targetClass = value;
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
    }
}