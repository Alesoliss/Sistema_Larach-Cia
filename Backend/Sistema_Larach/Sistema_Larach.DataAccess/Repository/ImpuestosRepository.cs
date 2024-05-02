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
    public class ImpuestosRepository : IRepository<tbImpuestos>
    {
        public RequestStatus Delete(int? id)
        {
            throw new NotImplementedException();
        }

        public tbImpuestos Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbImpuestos item)
        {
            throw new NotImplementedException();
        }

   
        public RequestStatus Update(tbImpuestos item)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<tbImpuestos> List()
        {
            string sql = ScriptDataBase.ImpuestoListar;
            List<tbImpuestos> result = new List<tbImpuestos>();
            using (var db = new SqlConnection(Sistema_LarachContext.ConnectionString))
            {
                result = db.Query<tbImpuestos>(sql, commandType: System.Data.CommandType.Text).ToList();
                return result;
            }
        }
    }
}
