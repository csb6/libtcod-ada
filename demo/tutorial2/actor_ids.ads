package Actor_Ids is

    type Actor_Id is range 1 .. 100;
    Player_Id : constant Actor_Id := Actor_Id'First;
    Invalid_Actor_Id : constant Actor_Id := Actor_Id'Last;
    subtype Monster_Id is Actor_Id range Actor_Id'Succ(Player_Id) .. Actor_Id'Pred(Invalid_Actor_Id);

end Actor_Ids;