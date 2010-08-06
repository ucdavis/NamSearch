using System.Linq;
using NHibernate.Linq;

namespace NamSearch.Helpers
{
    public static class QueryExtensions
    {
        public static INHibernateQueryable<T> NhQueryable<T>(this IQueryable<T> queryable)
        {
            return queryable as INHibernateQueryable<T>;
        }
    }
}