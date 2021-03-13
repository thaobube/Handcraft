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
            string requete = "Select * from V_SimpleClass";

            return base.Get(requete);
        }

        public ClassEntity GetOne(int PK)
        {
            string requete = "Select * from V_SimpleClass where IdClass =@id"; 
            return base.GetOne(PK, requete);
        }

        public List<ClassEntity> GetFeaturedClassEntity(int number)
        {
            string requete = $"EXEC FeaturedClasses {number}";
            return base.Get(requete);
        }

        public List<ClassEntity> GetClassEntityByCategory(string categoryName)
        {
            string requete = @"EXEC [CategoryClasses] '" + categoryName + "'";
            return base.Get(requete);
        }

        public List<ClassEntity> GetClassEntityByPage(string sortOrder, string category, string searchString, int page)
        {
            string requete = $@"SELECT * FROM V_SimpleClass";

            if (!String.IsNullOrEmpty(searchString))
            {
                requete += " WHERE ClassName LIKE '%" + searchString + "%' ";
                if (!String.IsNullOrEmpty(category))
                {
                    requete += $" AND CategoryName = '{category}' ";
                }
            }
            else
            {
                if (!String.IsNullOrEmpty(category))
                {
                    requete += $" WHERE CategoryName = '{category}' ";
                }
            }

            switch (sortOrder)
            {
                case "price_desc":
                    requete += " ORDER BY Price DESC ";
                    break;
                case "price_asc":
                    requete += " ORDER BY Price ASC ";
                    break;
                case "date_desc":
                    requete += " ORDER BY Date DESC ";
                    break;
                default:
                    requete += " ORDER BY Date ";
                    break;
            }

            int nbPerPage = 9;
            int skip = (page - 1) * nbPerPage;
            requete += $@" OFFSET {skip} ROWS 
                        FETCH NEXT {nbPerPage} ROWS ONLY ";
            return base.Get(requete);
        }

        public List<ClassEntity> GetClassEntityAllPage(string sortOrder, string category, string searchString, int page)
        {
            string requete = $@"SELECT * FROM V_SimpleClass";

            if (!String.IsNullOrEmpty(searchString))
            {
                requete += " WHERE ClassName LIKE '%" + searchString + "%' ";
                if (!String.IsNullOrEmpty(category))
                {
                    requete += $" AND CategoryName = '{category}' ";
                }
            }
            else
            {
                if (!String.IsNullOrEmpty(category))
                {
                    requete += $" WHERE CategoryName = '{category}' ";
                }
            }

            switch (sortOrder)
            {
                case "price_desc":
                    requete += " ORDER BY Price DESC ";
                    break;
                case "price_asc":
                    requete += " ORDER BY Price ASC ";
                    break;
                case "date_desc":
                    requete += " ORDER BY Date DESC ";
                    break;
                default:
                    requete += " ORDER BY Date ";
                    break;
            }
            return base.Get(requete);
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
