using Handcraft.DAL.Repositories;
using Handcraft.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handcraft.Repositories
{
    public class ContactMessageRepository : BaseRepository<ContactMessageEntity>, IConcreteRepository<ContactMessageEntity>
    {
        public ContactMessageRepository(string connectionString) : base(connectionString)
        {

        }
        public List<ContactMessageEntity> Get()
        {
            throw new NotImplementedException();
        }

        public ContactMessageEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ContactMessageEntity toInsert)
        {
            toInsert.SendDate = DateTime.Now;
            string requete = @"INSERT INTO ContactMessage (Name, Email, Subject, MessageContent, SendDate)
                               VALUES (@Name, @Email, @Subject, @MessageContent, GETDATE())";
            return base.Insert(toInsert, requete);
        }

        public bool Update(ContactMessageEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(ContactMessageEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
