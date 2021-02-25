using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Repositories
{
    public class CategoryRepository : BaseRepository<CategoryEntity>, IConcreteRepository<CategoryEntity>
    {
        public CategoryRepository(string cnstr) : base(cnstr)
        {

        }
        public List<CategoryEntity> Get()
        {
            string requete = "Select * from Category";

            return base.Get(requete);
        }

        public CategoryEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(CategoryEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(CategoryEntity toUpdate)
        {
            throw new NotImplementedException();
        }
        public bool Delete(CategoryEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
