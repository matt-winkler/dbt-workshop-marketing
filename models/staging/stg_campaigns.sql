-- PR trigger
with campaigns as (

    select * from {{ ref('campaigns') }}

),final as (

    select
    
    id,
    name as campaign_name,
    tier_name,
    owner

    from campaigns

)

select * from final