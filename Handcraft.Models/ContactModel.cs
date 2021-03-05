using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Models
{
    public class ContactModel
    {
        private string _name, _email, _subject, _messageContent;

        [Required]
        [MaxLength(50)]
        public string Name
        {
            get
            {
                return _name;
            }

            set
            {
                _name = value;
            }
        }

        [Required]
        [MaxLength(256)]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}")]
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

        [Required]
        [MaxLength(256)]
        public string Subject
        {
            get
            {
                return _subject;
            }

            set
            {
                _subject = value;
            }
        }

        [Required]
        public string MessageContent
        {
            get
            {
                return _messageContent;
            }

            set
            {
                _messageContent = value;
            }
        }
    }
}
