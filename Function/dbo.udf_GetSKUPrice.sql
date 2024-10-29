create or alter function dbo.udf_GetSKUPrice(
	@ID_SKU int
)
returns decimal(18, 2)
as
begin
	declare
		@Price decimal(18, 2)
		,@TotalQuantity int
		,@TotalValue decimal(18, 2)
	v
	select
		@TotalQuantity = sum(quantity)
		,@TotalValue = sum(value)
	from dbo.Basket as b
	where b.ID_SKU = @ID_SKU

	if (@TotalQuantity = 0)
		set @Price = 0
	else
		set @Price = @TotalValue / @TotalQuantity
	
	return @Price
end;
