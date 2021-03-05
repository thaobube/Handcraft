using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Models
{
    public class UserModel
    {
        #region Fields
        private int _idUser;
        private string _firstName;
        private string _lastName;
        private string _email;
        private string _phone;
        private string _login;
        private string _password;
        private string __confirmPassword;
        private string _picture;
        #endregion
        #region Properties
        public int IdUser
        {
            get
            {
                return _idUser;
            }

            set
            {
                _idUser = value;
            }
        }
        
        [Required]
        [MaxLength(64)]
        public string FirstName
        {
            get
            {
                return _firstName;
            }

            set
            {
                _firstName = value;
            }
        }

        [Required]
        [MaxLength(64)]
        public string LastName
        {
            get
            {
                return _lastName;
            }

            set
            {
                _lastName = value;
            }
        }

        public string Email
        {
            get
            {
                return _email;
            }

            set
            {
                _email = value;
            }
        }

        public string Phone
        {
            get
            {
                return _phone;
            }

            set
            {
                _phone = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string Login
        {
            get
            {
                return _login;
            }

            set
            {
                _login = value;
            }
        }

        public string Password
        {
            get
            {
                return _password;
            }

            set
            {
                _password = value;
            }
        }

        [Required]
        [Compare("Password", ErrorMessage = "No Matching Password")]
        public string ConfirmPassword
        {
            get
            {
                return __confirmPassword;
            }

            set
            {
                __confirmPassword = value;
            }
        }

        public string Picture
        {
            get
            {
                return _picture;
            }

            set
            {
                _picture = value;
            }
        } 
        #endregion

    }
}
