using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Entities
{
    public class FullClassEntity
    {
        #region Fields
        private int _idClass;
        private string _className;
        private string _description, _trailerURL;
        private decimal _price;
        private int _duration;
        private string _firstNameTutor, _lastNameTutor, _firstNameCoordinator, _lastNameCoordinator;
        private string _thumbnailFront, _thumbnailBack;
        private string _studioName;
        private string _number;
        private string _street;
        private string _city;
        private string _country;
        private DateTime _date;
        private string _timeStart;
        private string _timeEnd;
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

        public string Description
        {
            get
            {
                return _description;
            }

            set
            {
                _description = value;
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

        public int Duration
        {
            get
            {
                return _duration;
            }

            set
            {
                _duration = value;
            }
        }

        public string FirstNameTutor
        {
            get
            {
                return _firstNameTutor;
            }

            set
            {
                _firstNameTutor = value;
            }
        }

        public string LastNameTutor
        {
            get
            {
                return _lastNameTutor;
            }

            set
            {
                _lastNameTutor = value;
            }
        }

        public string FirstNameCoordinator
        {
            get
            {
                return _firstNameCoordinator;
            }

            set
            {
                _firstNameCoordinator = value;
            }
        }

        public string LastNameCoordinator
        {
            get
            {
                return _lastNameCoordinator;
            }

            set
            {
                _lastNameCoordinator = value;
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

        public string StudioName
        {
            get
            {
                return _studioName;
            }

            set
            {
                _studioName = value;
            }
        }

        public string Number
        {
            get
            {
                return _number;
            }

            set
            {
                _number = value;
            }
        }

        public string Street
        {
            get
            {
                return _street;
            }

            set
            {
                _street = value;
            }
        }

        public string City
        {
            get
            {
                return _city;
            }

            set
            {
                _city = value;
            }
        }

        public string Country
        {
            get
            {
                return _country;
            }

            set
            {
                _country = value;
            }
        }

        public DateTime Date
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

        public string TimeStart
        {
            get
            {
                return _timeStart;
            }

            set
            {
                _timeStart = value;
            }
        }

        public string TimeEnd
        {
            get
            {
                return _timeEnd;
            }

            set
            {
                _timeEnd = value;
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

        public string TrailerURL
        {
            get
            {
                return _trailerURL;
            }

            set
            {
                _trailerURL = value;
            }
        }

        #endregion
    }
}
