with
    source_products as (
        select 
            cast(product_id as int) as id_produto
            , cast(supplier_id as int) as id_fornecedor			
            , cast(category_id as int) as id_categoria           		
            , cast(product_name as string) as nome_produto				
            , cast(quantity_per_unit as string) as qtd_porproduto				
            , cast(unit_price as float) as preco_unidade			
            , cast(units_in_stock as int) as estoque				
            , cast(units_on_order as int) as und_compradas				
            , cast(reorder_level				
            , case 
                when discontinued = 1 then true
                else false
            end as esta_discontinuado            	
        from {{ source('erp', 'products')}}
    )

select * 
from source_products