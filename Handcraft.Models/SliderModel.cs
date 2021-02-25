using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Models
{
    public class SliderModel
    {
        #region Fields
        private string _link, picture;
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

        public string Picture
        {
            get
            {
                return picture;
            }

            set
            {
                picture = value;
            }
        } 
        #endregion
    }
}
