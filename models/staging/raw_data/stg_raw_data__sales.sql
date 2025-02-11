with 

source as (

    select * from {{ source('raw_data', 'sales') }}

),

renamed as (

    select

    from source

)

select * from renamed
