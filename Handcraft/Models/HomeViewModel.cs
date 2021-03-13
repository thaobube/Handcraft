using Handcraft.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Handcraft.Models
{
    public class HomeViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private List<SliderModel> _slider;
        private List<CategoryModel> _category;
        private FullClassModel _newClass;
        private List<ClassModel> _classes;

        public HomeViewModel()
        {

            #region Section Banner Slider
            // Section Banner Slider
            Slider = new List<SliderModel>();
            Slider.Add(new SliderModel() { Link = "#", Picture = "banner1.jpg" });
            Slider.Add(new SliderModel() { Link = "#", Picture = "banner2.jpg" });
            Slider.Add(new SliderModel() { Link = "#", Picture = "banner3.jpg" });
            Slider.Add(new SliderModel() { Link = "#", Picture = "banner4.jpg" }); 
            #endregion

            // Section Class Category (Collections)
            Category = uow.GetAllCategoryModel();

            // Section Video (New workshop/online class)
            NewClass = new FullClassModel() { TrailerURL = "https://www.youtube.com/embed/aTkCLROKqKQ" };

            // Section Featured Classes (Let's craft with us)
            Classes = uow.GetFeaturedClassModel(8);
            
        }
        public List<SliderModel> Slider
        {
            get
            {
                return _slider;
            }

            set
            {
                _slider = value;
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

        public FullClassModel NewClass
        {
            get
            {
                return _newClass;
            }

            set
            {
                _newClass = value;
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