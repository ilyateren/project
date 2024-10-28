create or alter function dbo.udf_GetSKUPrice(
  @ID_SKU int
)
returns decimal(18, 2)
as
begin
  declare
    @Price decimal(18, 2)
  
  select 
    @Price = 
    case 
      when sum(quantity) = 0 
        then 0
      else sum(value) / sum(quantity) 
    end
  from dbo.Basket
  where ID_SKU = @ID_SKU
  
  return @Price
end;
