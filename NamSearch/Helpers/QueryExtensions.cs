using System;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using NHibernate.Linq;

namespace NamSearch.Helpers
{
    public static class QueryExtensions
    {
        public static INHibernateQueryable<T> NhQueryable<T>(this IQueryable<T> queryable)
        {
            if (queryable is INHibernateQueryable<T> == false)
            {
                throw new ArgumentException("The IQueryable instance is not extendable, make suer it inherits from INhibernateQueryable<T>");
            }

            return (INHibernateQueryable<T>)queryable;
        }

        public static IQueryable<T> Cache<T>(this IQueryable<T> queryable)
        {
            queryable.NhQueryable().QueryOptions.SetCachable(true);

            return queryable;
        }

        public static IQueryable<T> Include<T>(this IQueryable<T> queryable, params Expression<Func<T, object>>[] properties)
        {
            var nhquery = queryable.NhQueryable();

            return nhquery.Include(properties);
        }

        public static IQueryable<T> Include<T>(this INHibernateQueryable<T> queryable, params Expression<Func<T, object>>[] properties)
        {
            foreach (var property in properties)
            {
                var text = ExpressionHelper.GetExpressionText(property);

                queryable.QueryOptions.AddExpansion(text);
            }

            return queryable;
        }
    }
}