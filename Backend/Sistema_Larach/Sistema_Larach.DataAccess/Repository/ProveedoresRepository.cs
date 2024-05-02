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
    public class ProveedoresRepository : IRepository<tbProveedores>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbProveedores Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbProveedores item)
        {
            throw new NotImplementedException();
        }


        public RequestStatus Update(tbProveedores item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbProveedores> List()
        {
            string sql = ScriptDataBase.ProveedorListar;
            List<tbProveedores> result = new List<tbProveedores>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbProveedores>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
    }
}
