with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.View.Grid;
with Gnoga.Gui.View.Docker;
with Gnoga.Gui.View.Card;
with Gnoga.Types.Colors;
with Gnoga.Gui.Element;
with Gnoga.Gui.Element.Common;
use Gnoga.Gui.View.Grid;
use Gnoga.Types.Colors;

procedure hello4 is
   Main_Window        : Gnoga.Gui.Window.Window_Type;
   Main_View          : Gnoga.Gui.View.Grid.Grid_View_Type;
   Basic_View         : Gnoga.Gui.View.View_Type;
   Console_View       : Gnoga.Gui.View.Console.Console_View_Type;
   Grid_View          : Gnoga.Gui.View.Grid.Grid_View_Type;
   Docker_View        : Gnoga.Gui.View.Docker.Docker_View_Type;
   DL, DR, DT, DB, DF : aliased Gnoga.Gui.Element.Common.P_Type;
   Card_View          : Gnoga.Gui.View.Card.Card_View_Type;
   C1, C2             : aliased Gnoga.Gui.Element.Common.P_Type;
   Tabs               : Gnoga.Gui.View.Card.Tab_Type;

begin
   Gnoga.Application.Title ("hello4");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   --     Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window, ((1 => COL), (1 => COL), (1 => COL), (1 => COL), (1 => COL)));

   Basic_View.Create (Main_View.Panel (1, 1).all);
   Basic_View.Background_Color (To_String (Aqua));
   Basic_View.Put_Line ("Hello World! Basic");

   Console_View.Create (Main_View.Panel (2, 1).all);
   Console_View.Background_Color (To_String (Beige));
   Console_View.Put_Line ("Hello World! Console");

   Grid_View.Create (Main_View.Panel (3, 1).all, (1 => (COL, COL)), False);
   Grid_View.Background_Color (To_String (Cyan));
   Grid_View.Panel (1, 1).Background_Color (To_String (Fuchsia));
   Grid_View.Panel (1, 1).Put_Line ("Hello World! Grid 1, 1");
   Grid_View.Panel (1, 2).Background_Color (To_String (Forest_Green));
   Grid_View.Panel (1, 2).Put_Line ("Hello World! Grid 1, 2");

   Docker_View.Create (Main_View.Panel (4, 1).all);
   Docker_View.Fill_Parent;
   DL.Create (Docker_View, "Hello World! Dock left");
   DL.Background_Color (To_String (Light_Pink));
   Docker_View.Left_Dock (DL'Unchecked_Access);
   DR.Create (Docker_View, "Hello World! Dock right");
   DR.Background_Color (To_String (Light_Coral));
   Docker_View.Right_Dock (DR'Unchecked_Access);
   DT.Create (Docker_View, "Hello World! Dock top");
   DT.Background_Color (To_String (Light_Sea_Green));
   Docker_View.Top_Dock (DT'Unchecked_Access);
   DB.Create (Docker_View, "Hello World! Dock bottom");
   DB.Background_Color (To_String (Light_Yellow));
   Docker_View.Bottom_Dock (DB'Unchecked_Access);
   DF.Create (Docker_View, "Hello World! Dock fill");
   DF.Background_Color (To_String (Light_Gray));
   Docker_View.Fill_Dock (DF'Unchecked_Access);

   Card_View.Create (Main_View.Panel (5, 1).all);
   Card_View.Fill_Parent;
   Tabs.Create (Card_View, Card_View);
   C1.Create (Card_View, "Hello World! C1");
   C1.Background_Color (To_String (Sky_Blue));
   Card_View.Add_Card ("C1", C1'Access, True);
   Tabs.Add_Tab ("C1", "Card 1");
   C2.Create (Card_View, "Hello World! C2");
   C2.Background_Color (To_String (Royal_Blue));
   Card_View.Add_Card ("C2", C2'Access);
   Tabs.Add_Tab ("C2", "Card 2");

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello4;
