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
    public class SucursalesRepository : IRepository<tbSucursales>
    {

        public IEnumerable<tbSucursales> List()
        {
            string sql = ScriptDataBase.sucursalListar;
            List<tbSucursales> result = new List<tbSucursales>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbSucursales>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbSucursales Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbSucursales item)
        {
            throw new NotImplementedException();
        }



        public RequestStatus Update(tbSucursales item)
        {
            throw new NotImplementedException();
        }
    }
}
