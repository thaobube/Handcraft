using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Models
{
    public class ClassModel
    {
        #region Fields
        private int _idClass;
        private string _className;
        private decimal _price;
        private string _thumbnailFront, _thumbnailBack;
        private string _date;
        private string _categoryName;
        #endregion

        #region Properties
        public int IdClass
        {
            get
            {
                return _idClass;
            }

            set
            {
                _idClass = value;
            }
        }

        public string ClassName
        {
            get
            {
                return _className;
            }

            set
            {
                _className = value;
            }
        }

        public decimal Price
        {
            get
            {
                return _price;
            }

            set
            {
                _price = value;
            }
        }
        
        public string ThumbnailFront
        {
            get
            {
                return _thumbnailFront;
            }

            set
            {
                _thumbnailFront = value;
            }
        }

        public string ThumbnailBack
        {
            get
            {
                return _thumbnailBack;
            }

            set
            {
                _thumbnailBack = value;
            }
        }

        public string CategoryName
        {
            get
            {
                return _categoryName;
            }

            set
            {
                _categoryName = value;
            }
        }

        public string Date
        {
            get
            {
                return _date;
            }

            set
            {
                _date = value;
            }
        }


        #endregion
    }
}
