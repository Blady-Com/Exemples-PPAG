with Ada.Numerics.Discrete_Random;
with Ada.Containers.Indefinite_Ordered_Maps;

with Gnoga.Types;
with Gnoga.Gui.Window;
with Gnoga.Gui.Base;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Common;
with Gnoga.Application.Multi_Connect;
with Gnoga.Client.Storage;

with UXStrings;

procedure hello7_session is
   use all type Gnoga.String;

   subtype String is Gnoga.String;

   subtype Char is UXStrings.Unicode_Character range 'a' .. 'z';
   package Char_Random is new Ada.Numerics.Discrete_Random (Char);
   Char_Generator : Char_Random.Generator;

   package ID_Map is new Ada.Containers.Indefinite_Ordered_Maps (String, Char);
   Text_Map : ID_Map.Map;

   type App_Data_Type is new Gnoga.Types.Connection_Data_Type with record
      Main_View  : Gnoga.Gui.View.Console.Console_View_Type;
      Mon_Bouton : Gnoga.Gui.Element.Common.Button_Type;
      Session    : Gnoga.Client.Storage.Session_Storage_Type;
   end record;
   type App_Data_Access is access all App_Data_Type;

   procedure On_Inc (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      Client_Text : constant String :=
        App_Data_Access (Object.Connection_Data).Session.Get ("TEXT") &
        Text_Map.Element (App_Data_Access (Object.Connection_Data).Session.Get ("gid"));
   begin
      App_Data_Access (Object.Connection_Data).Session.Set ("TEXT", Client_Text);
      App_Data_Access (Object.Connection_Data).Main_View.Put_Line
      ("Texte serveur : " & Text_Map.Element (App_Data_Access (Object.Connection_Data).Session.Get ("gid")));
      App_Data_Access (Object.Connection_Data).Main_View.Put_Line ("Texte client : " & Client_Text);
   end On_Inc;

   procedure On_Connect
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  :        access Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      App_Data : constant App_Data_Access := new App_Data_Type;
   begin
      Main_Window.Connection_Data (App_Data);
      App_Data.Main_View.Create (Main_Window);
      App_Data.Mon_Bouton.Create (App_Data.Main_View, "Incrémenter du texte");
      App_Data.Mon_Bouton.On_Click_Handler (On_Inc'Unrestricted_Access);
      App_Data.Main_View.Put_Line ("gid de session : " & Main_Window.Gnoga_Session_ID);
      App_Data.Session := Gnoga.Client.Storage.Session_Storage (Main_Window);
      App_Data.Session.Set ("TEXT", " -> ");
      Char_Random.Reset (Char_Generator);
      Text_Map.Include (Main_Window.Gnoga_Session_ID, Char_Random.Random (Char_Generator));
      App_Data.Main_View.Put_Line ("Texte serveur : " & Text_Map.Element (Main_Window.Gnoga_Session_ID));
      App_Data.Main_View.Put_Line ("Texte client : " & App_Data.Session.Get ("TEXT"));
   end On_Connect;

begin
   Gnoga.Application.Title ("hello7 session");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   --     Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Multi_Connect.Initialize;
   Gnoga.Application.Multi_Connect.On_Connect_Handler (On_Connect'Unrestricted_Access);

   Gnoga.Application.Multi_Connect.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello7_session;
