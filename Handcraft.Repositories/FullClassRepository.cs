using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Repositories
{
    class FullClassRepository : BaseRepository<FullClassEntity>, IConcreteRepository<FullClassEntity>
    {
        public FullClassRepository(string cnstr) : base(cnstr)
        {

        }
        public List<FullClassEntity> Get()
        {
            string requete = "Select * from V_FullClass";

            return base.Get(requete);
        }

        public FullClassEntity GetOne(int PK)
        {
            string requete = "Select * from V_FullClass where IdClass =@id";
            return base.GetOne(PK, requete);
        }

        //public List<FullClassEntity> GetFeaturedFullClassEntity(int number)
        //{
        //    string requete = $"EXEC FeaturedClasses {number}";
        //    return base.Get(requete);
        //}

        public bool Insert(FullClassEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(FullClassEntity toUpdate)
        {
            throw new NotImplementedException();
        }
        public bool Delete(FullClassEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
