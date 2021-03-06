﻿using Castle.Windsor;
using UCDArch.Core.CommonValidator;
using UCDArch.Core.NHibernateValidator.CommonValidatorAdapter;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Data.NHibernate;
using NamSearch.Services;

namespace NamSearch
{
    public static class ComponentRegistrar
    {
        public static void AddComponentsTo(IWindsorContainer container)
        {
            //Add your components here
            container.AddComponent("validator", typeof(IValidator), typeof(Validator));
            container.AddComponent("dbContext", typeof(IDbContext), typeof(DbContext));

            container.AddComponent("dataNamQueryService", typeof (IDataNamQueryService), typeof (DataNamQueryService));

            AddRepositoriesTo(container);
        }

        private static void AddRepositoriesTo(IWindsorContainer container)
        {
            container.AddComponent("repository", typeof(IRepository), typeof(Repository));
            container.AddComponent("genericRepository", typeof(IRepository<>), typeof(Repository<>));
            container.AddComponent("typedRepository", typeof(IRepositoryWithTypedId<,>),
                                   typeof(RepositoryWithTypedId<,>));
        }
    }
}