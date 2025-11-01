use sampledb
GO

create table [dbo].[SampleModels](
	[Id] [bigint] IDENTITY(1,1) not null,
	[EventName] [nvarchar](max) not null,
	[CorrelationId] [nvarchar](50) not null,
	[EventData] [nvarchar](max) not null,
	[CreatedDate] [datetime2](7) not null,
 constraint [PK_SampleModels] primary key clustered
(
	[Id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, OPTIMIZE_FOR_SEQUENTIAL_KEY = off) on [PRIMARY]
) on [PRIMARY] textimage_on [PRIMARY];
go
