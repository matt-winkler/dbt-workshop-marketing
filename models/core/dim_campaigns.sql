with campaign_sequence as
(
    select * from {{ ref('campaign_sequence') }}
)
,
stg_campaigns as 
(
    select * from {{ ref('stg_campaigns') }}
)

select
cs.id as campaign_id
,cs.seq_id as sequence_id
,cs.seq_name as sequence_name
, sc.campaign_name
, sc.tier_name
, sc.owner
from stg_campaigns sc
join campaign_sequence cs
on sc.id = cs.id