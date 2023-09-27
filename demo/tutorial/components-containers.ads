with Ada.Containers.Bounded_Vectors;

package Components.Containers is

    package Bounded_Actor_Id_Vectors is new Ada.Containers.Bounded_Vectors(Index_Type => Natural,
                                                                           Element_Type => Actor_Id);

    subtype Container is Bounded_Actor_Id_Vectors.Vector;

    subtype Cursor is Bounded_Actor_Id_Vectors.Cursor;

    function Value_Of(c: Cursor) return Actor_Id renames Bounded_Actor_Id_Vectors.Element;

    No_Element : Cursor renames Bounded_Actor_Id_Vectors.No_Element;

end Components.Containers;