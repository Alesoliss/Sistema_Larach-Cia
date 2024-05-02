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
    public class MunicipiosRepository : IRepository<tbMunicipios>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbMunicipios Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbMunicipios item)
        {
            throw new NotImplementedException();
        }

     

        public RequestStatus Update(tbMunicipios item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbMunicipios> List()
        {
            string sql = ScriptDataBase.MunicipiosListar;
            List<tbMunicipios> result = new List<tbMunicipios>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbMunicipios>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
    }
}
