{{
    config(
        materialized='table'
    )
}}

with campaign_sequence as (
    select
        id as campaign_id,
        seq_id as sequence_id,
        seq_name as campaign_sequence_name
    from {{ ref('campaign_sequence') }}
),

campaigns as (
    select 
        id as campaign_id,
        campaign_name,
        tier_name as campaign_tier_name,
        owner as campaign_owner
    from {{ ref('stg_campaigns') }}
),

final as (
    select
        campaign_sequence.campaign_id,
        campaign_sequence.sequence_id,
        campaign_sequence.campaign_sequence_name,
        campaigns.campaign_name,
        campaigns.campaign_tier_name,
        campaigns.campaign_owner
    from campaign_sequence
    left join campaigns on campaign_sequence.campaign_id = campaigns.campaign_id
)

select * from final
