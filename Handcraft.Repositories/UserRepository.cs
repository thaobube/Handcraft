using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Repositories
{
    class UserRepository : BaseRepository<UserEntity>, IConcreteRepository<UserEntity>
    {
        public UserRepository(string ConnectionString) : base(ConnectionString)
        {

        }


        public List<UserEntity> Get()
        {
            throw new NotImplementedException();
        }

        public UserEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(UserEntity toInsert)
        {
            string requete = @"INSERT INTO [User] (FirstName, LastName, [Email], [Login], [Password], salt)
                               VALUES (@FirstName, @LastName, @Email, @Login, @Password, @salt)";
            return base.Insert(toInsert, requete);
        }

        public bool Update(UserEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(UserEntity toDelete)
        {
            throw new NotImplementedException();
        }

        public UserEntity GetUserEntityFromLogin (string login)
        {
            Dictionary<string, object> parameter = new Dictionary<string, object>();
            parameter.Add("login", login);
            string requete = "SELECT * FROM [User] WHERE Login = @login";
            return base.Get(requete, parameter).FirstOrDefault();
        }

    }
}
