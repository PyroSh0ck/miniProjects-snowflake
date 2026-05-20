select
  *
from
  {{ ref('fct_orders') }}
where
  gross_item_discount_amount > 0
