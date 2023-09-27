with Ada.Containers;
with Actors, Components.Containers; use Components.Containers;

package body Components.Pickables is

    use type Ada.Containers.Count_Type;

    function pick(self : in out Pickable'Class;
                  picker : in out Actors.Actor;
                  target : Actor_Id) return Boolean is
    begin
        if picker.has_inventory and then picker.inventory.Length < picker.inventory.Capacity then
            picker.inventory.Append(target);
            return True;
        end if;
        return False;
    end pick;

    function consume(self : in out Pickable;
                     picker : in out Actors.Actor;
                     target : Actor_Id) return Boolean is
        use type Containers.Cursor;
        match : Containers.Cursor;
    begin
        if picker.has_inventory then
            match := picker.inventory.Find(target);
            if match /= Containers.No_Element then
                picker.inventory.Delete(match);
                return True;
            end if;
        end if;
        return False;
    end consume;

    overriding
    function consume(self : in out Healer;
                     picker : in out Actors.Actor;
                     target : Actor_Id) return Boolean is
        amount_healed : Health;
    begin
        if picker.is_destructible then
            amount_healed := picker.destructible.heal(self.amount);
            if amount_healed > 0 then
                return consume(Pickable(self), picker, target);
            end if;
        end if;
        return False;
    end consume;

end Components.Pickables;