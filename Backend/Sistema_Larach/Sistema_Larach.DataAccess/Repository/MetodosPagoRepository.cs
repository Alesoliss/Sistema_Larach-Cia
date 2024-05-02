using AHM.Total.Travel.DataAccess.Repositories;
using Dapper;
using Microsoft.Data.SqlClient;
using Sistema_Larach.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sistema_Larach.DataAccess.Repository
{
    public class MetodosPagoRepository : IRepository<tbMetodospago>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMetodospago Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbMetodospago item)
        {
            throw new NotImplementedException();
        }

      

        public RequestStatus Update(tbMetodospago item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbMetodospago> List()
        {
            string sql = ScriptDataBase.MetodoListar;
            List<tbMetodospago> result = new List<tbMetodospago>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbMetodospago>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
    }
}
