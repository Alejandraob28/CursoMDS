{{
  config(
    materialized='table'
  )
}}

WITH stg_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
),

renamed_casted AS (
    SELECT
         user_id 
        , updated_at
        , address_id
        , last_name
        , email
    FROM stg_users
    )

SELECT * FROM renamed_casted