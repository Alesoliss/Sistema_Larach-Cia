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
    public class CargosRepository : IRepository<tbCargos>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbCargos Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbCargos item)
        {
            throw new NotImplementedException();
        }

       

        public RequestStatus Update(tbCargos item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbCargos> List()
        {
            string sql = ScriptDataBase.cargoListar;
            List<tbCargos> result = new List<tbCargos>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbCargos>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
    }
}
