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
    public class UnidadesRepository : IRepository<tbUnidades>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbEstadosCiviles Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbEstadosCiviles item)
        {
            throw new NotImplementedException();
        }

 
        public RequestStatus Update(tbEstadosCiviles item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbUnidades> List()
        {
            string sql = ScriptDataBase.UnidadesListar;
            List<tbUnidades> result = new List<tbUnidades>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbUnidades>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }

        public RequestStatus Insert(tbUnidades item)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbUnidades item)
        {
            throw new NotImplementedException();
        }

        IEnumerable<tbUnidades> IRepository<tbUnidades>.List()
        {
            throw new NotImplementedException();
        }

        tbUnidades IRepository<tbUnidades>.Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
