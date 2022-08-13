with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.List;

procedure hello5_list is
   Main_Window : Gnoga.Gui.Window.Window_Type;
   Main_View   : Gnoga.Gui.View.Console.Console_View_Type;

   Unordered_List, Unordered_Sublist1, Unordered_Sublist2  : Gnoga.Gui.Element.List.Unordered_List_Type;
   ULItem1, ULItem2, ULItem3, ULItem11, ULItem21, ULItem22 : Gnoga.Gui.Element.List.List_Item_Type;

   Ordered_List, Ordered_Sublist1, Ordered_Sublist2        : Gnoga.Gui.Element.List.Ordered_List_Type;
   OLItem1, OLItem2, OLItem3, OLItem11, OLItem21, OLItem22 : Gnoga.Gui.Element.List.List_Item_Type;

   Definition_List     : Gnoga.Gui.Element.List.Definition_List_Type;
   Term1, Term2, Term3 : Gnoga.Gui.Element.List.Term_Type;
   Desc1, Desc2, Desc3 : Gnoga.Gui.Element.List.Description_Type;
begin
   Gnoga.Application.Title ("hello5");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);
   Main_View.Put_Line ("Unordered list");

   Unordered_List.Create (Main_View);

   ULItem1.Create (Unordered_List, "I1");

   Unordered_Sublist1.Create (Unordered_List);
   ULItem11.Create (Unordered_Sublist1, "SI11");

   ULItem2.Create (Unordered_List, "I2");

   Unordered_Sublist2.Create (Unordered_List);
   Unordered_Sublist2.List_Kind (Gnoga.Gui.Element.List.Square);

   ULItem21.Create (Unordered_Sublist2, "SI21");
   ULItem22.Create (Unordered_Sublist2, "SI22");

   ULItem3.Create (Unordered_List, "I3");

   Main_View.Put_Line ("Ordered list");

   Ordered_List.Create (Main_View);
   Ordered_List.List_Kind (Gnoga.Gui.Element.List.Decimal_Leading_Zero);

   OLItem1.Create (Ordered_List, "I1");
   OLItem2.Create (Ordered_List, "I2");
   OLItem3.Create (Ordered_List, "I3");

   Ordered_Sublist1.Create (Ordered_List);
   Ordered_Sublist1.Place_Inside_Bottom_Of (OLItem1);
   Ordered_Sublist2.Create (Ordered_List);
   Ordered_Sublist2.Place_Inside_Bottom_Of (OLItem2);
   Ordered_Sublist2.List_Location (Gnoga.Gui.Element.List.Inside);

   OLItem11.Create (Ordered_Sublist1, "SI11");
   OLItem21.Create (Ordered_Sublist2, "SI21");
   OLItem22.Create (Ordered_Sublist2, "SI22");

   Main_View.Put_Line ("Description list");

   Definition_List.Create (Main_View);

   Term1.Create (Definition_List, "I1");
   Desc1.Create (Definition_List, "-> D1");
   Term2.Create (Definition_List, "I2");
   Desc2.Create (Definition_List, "-> D2");
   Term3.Create (Definition_List, "I3");
   Desc3.Create (Definition_List, "-> D3");

   Gnoga.Log (ULItem21.Value);
   Gnoga.Log (OLItem21.Value);

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello5_list;
