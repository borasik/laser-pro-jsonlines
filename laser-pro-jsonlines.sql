select replace(replace(value,char(10),''),char(13),'') JLINES
from (select id from [LaserProWtl_TransactionsLog] (nolock) where isjson(json)<>0) a
cross apply openjson((SELECT [JSON] FROM [dbo].[LaserProWtl_TransactionsLog] (nolock) b where b.id=a.id))