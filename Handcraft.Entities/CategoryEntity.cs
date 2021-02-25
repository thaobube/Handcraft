using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Entities
{
    public class CategoryEntity
    {
        #region Fields
        private string _link, _name, _picture;
        #endregion

        #region Properties
        public string Link
        {
            get
            {
                return _link;
            }

            set
            {
                _link = value;
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
