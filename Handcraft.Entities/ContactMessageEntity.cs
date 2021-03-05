using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Entities
{
    public class ContactMessageEntity
    {
        #region Fields
        private int _idContactMessage;
        private string _name;

        private string _email;

        private string _subject;
        private string _messageContent;

        private DateTime _sendDate;
        #endregion
        #region Properties

        public int IdContactMessage
        {
            get
            {
                return _idContactMessage;
            }

            set
            {
                _idContactMessage = value;
            }
        }

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

        public DateTime SendDate
        {
            get
            {
                return _sendDate;
            }

            set
            {
                _sendDate = value;
            }
        } 
        #endregion
    }
}
