using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Repositories
{
    class ClassRepository : BaseRepository<ClassEntity>, IConcreteRepository<ClassEntity>
    {
        public ClassRepository(string cnstr) : base(cnstr)
        {

        }

        public List<ClassEntity> Get()
        {
            string requete = "Select * from V_FullClass";

            return base.Get(requete);
        }

        public ClassEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ClassEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(ClassEntity toUpdate)
        {
            throw new NotImplementedException();
        }
        public bool Delete(ClassEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
