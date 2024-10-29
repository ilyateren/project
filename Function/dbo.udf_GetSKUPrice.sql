create procedure dbo.usp_MakeFamilyPurchase
@FamilySurName varchar(255)
as
begin
	if not exists (
		select f.SurName
		from dbo.Family as f
		where f.SurName = @FamilySurName
	)
	begin
		print 'Данной семьи нет'
		return;
	end
	update f
	set f.BudgetValue = f.BudgetValue - (
		select sum(b.Value)
		from dbo.Family as f
			inner join dbo.Basket as b on b.ID_Family = f.ID
		where f.SurName = @FamilySurName
  )
	from dbo.Family as f
	where f.SurName = @FamilySurName
end;
