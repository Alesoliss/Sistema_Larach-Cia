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
    public class CategoriasRepository : IRepository<tbCategorias>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbCategorias Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbCategorias item)
        {
            throw new NotImplementedException();
        }

      

        public RequestStatus Update(tbCategorias item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbCategorias> List()
        {
            string sql = ScriptDataBase.categoriaListar;
            List<tbCategorias> result = new List<tbCategorias>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbCategorias>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
    }
}
