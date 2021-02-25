using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Entities
{
    public class ClassEntity
    {
        #region Fields
        private int _idClass;
        private string _className;
        private string _description;
        private string _trailerURL;
        private decimal _price;
        private int _duration;
        private string _firstNameTutor, _lastNameTutor, _firstNameCoordinator, _lastNameCoordinator;
        private string _thumbnailFront, _thumbnailBack, _thumbnailDetail1, _thumbnailDetail2, _thumbnailDetail3;
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

        public string ThumbnailDetail1
        {
            get
            {
                return _thumbnailDetail1;
            }

            set
            {
                _thumbnailDetail1 = value;
            }
        }

        public string ThumbnailDetail2
        {
            get
            {
                return _thumbnailDetail2;
            }

            set
            {
                _thumbnailDetail2 = value;
            }
        }

        public string ThumbnailDetail3
        {
            get
            {
                return _thumbnailDetail3;
            }

            set
            {
                _thumbnailDetail3 = value;
            }
        }

        #endregion
    }
}
