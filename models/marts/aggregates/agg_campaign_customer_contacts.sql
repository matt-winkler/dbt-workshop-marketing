
with campaign as (
    select
        campaign_name,
        campaign_owner,
        campaign_tier_name
    from {{ ref('dim_campaigns') }}
),

customer as (
    select
        name as customer_name,
        region as customer_region,
        tier_name,
        address as email_address
    from {{ ref('analytics', 'dim_customers', v=1) }}
),

final as (
    select
        campaign.campaign_name,
        campaign.campaign_owner,
        customer.customer_name,
        customer.customer_region,
        customer.tier_name,
        customer.email_address
    from campaign
    inner join customer on campaign.campaign_tier_name = customer.tier_name
)

select * from final