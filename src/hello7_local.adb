with Gnoga.Types;
with Gnoga.Gui.Window;
with Gnoga.Gui.Base;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.Element.Form;
with Gnoga.Application.Multi_Connect;
with Gnoga.Client.Storage;

procedure hello7_local is

   use all type Gnoga.String;

   type App_Data_Type is new Gnoga.Types.Connection_Data_Type with record
      Main_View       : Gnoga.Gui.View.Console.Console_View_Type;
      Mon_Bouton      : Gnoga.Gui.Element.Common.Button_Type;
      Mon_Formulaire  : Gnoga.Gui.Element.Form.Form_Type;
      Mon_Texte_Multi : Gnoga.Gui.Element.Form.Text_Area_Type;
      Local           : Gnoga.Client.Storage.Local_Storage_Type;
   end record;
   type App_Data_Access is access all App_Data_Type;

   procedure On_Envoie (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
   begin
      App_Data_Access (Object.Connection_Data).Main_View.Put_Line
      ("Texte envoyé : " & App_Data_Access (Object.Connection_Data).Mon_Texte_Multi.Value);
      App_Data_Access (Object.Connection_Data).Mon_Texte_Multi.Value ("");
      App_Data_Access (Object.Connection_Data).Local.Set ("TEXT", "");
   end On_Envoie;

   procedure On_Modif_Texte (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
   begin
      App_Data_Access (Object.Connection_Data).Local.Set
      ("TEXT", App_Data_Access (Object.Connection_Data).Mon_Texte_Multi.Value);
   end On_Modif_Texte;

   procedure On_Modif_Stockage
     (Object        : in out Gnoga.Gui.Base.Base_Type'Class;
      Storage_Event : in     Gnoga.Gui.Window.Storage_Event_Record)
   is
   begin
      if Storage_Event.Name = "TEXT" then
         App_Data_Access (Object.Connection_Data).Mon_Texte_Multi.Value (Storage_Event.New_Value);
      end if;
   end On_Modif_Stockage;

   procedure On_Connect
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  :        access Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      App_Data : constant App_Data_Access := new App_Data_Type;
   begin
      Main_Window.Connection_Data (App_Data);
      Main_Window.On_Storage_Handler (On_Modif_Stockage'Unrestricted_Access);
      App_Data.Local := Gnoga.Client.Storage.Local_Storage (Main_Window);
      App_Data.Main_View.Create (Main_Window);
      App_Data.Mon_Bouton.Create (App_Data.Main_View, "Envoyer du texte");
      App_Data.Mon_Bouton.On_Click_Handler (On_Envoie'Unrestricted_Access);
      App_Data.Mon_Formulaire.Create (App_Data.Main_View);
      App_Data.Mon_Texte_Multi.Create (App_Data.Mon_Formulaire, Value => App_Data.Local.Get ("TEXT"));
      App_Data.Mon_Texte_Multi.Focus;
      App_Data.Mon_Texte_Multi.On_Change_Handler (On_Modif_Texte'Unrestricted_Access);
      App_Data.Main_View.Put_Line ("Texte envoyé : ");
   end On_Connect;

begin
   Gnoga.Application.Title ("hello7 local");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   --     Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Multi_Connect.Initialize;
   Gnoga.Application.Multi_Connect.On_Connect_Handler (On_Connect'Unrestricted_Access);

   Gnoga.Application.Multi_Connect.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello7_local;
