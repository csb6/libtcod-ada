with Ada.Containers, Ada.Containers.Bounded_Vectors;
with Actor_Ids;

package Components.Inventories is

    use type Actor_Ids.Actor_Id;

    -- Types

    subtype Index_Type is Natural;
    package Actor_Id_Sets is new Ada.Containers.Bounded_Vectors(Index_Type, Element_Type => Actor_Ids.Actor_Id);
    subtype Inventory is Actor_Id_Sets.Vector;
    Invalid_Index : Integer renames Actor_Id_Sets.No_Index;

end Components.Inventories;