with campaigns as (
    select * from {{ ref('stg_campaigns') }}
),
campaign_sequence as (
    select * from {{ ref('campaign_sequence') }}
),

final as (
    select
        campaign_sequence.id as campaign_id,
        campaign_sequence.seq_id as sequence_id,
        campaigns.campaign_name,
        campaigns.tier_name,
        campaigns.owner as campaign_owner
    from campaign_sequence
    left join campaigns
    on campaign_sequence.id = campaigns.id
)

select * from final