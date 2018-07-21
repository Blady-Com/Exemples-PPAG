with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Common;
with Gnoga.Types;
with Gnoga.Gui.View;

with hello6.View;
with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Window;

package body hello6.Controller is

   type App_Data_Type is new Gnoga.Types.Connection_Data_Type with record
      View : hello6.View.Default_View_Type;
   end record;
   type App_Data_Access is access all App_Data_Type;

   procedure On_Click1 (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   
   procedure On_Click1 (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      View : constant hello6.View.Default_View_Access := 
               hello6.View.Default_View_Access (Object.Parent);
   begin
      View.Label_Text.Put_Line ("Click1");
   end On_Click1;
   
   procedure On_Click2 (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   
   procedure On_Click2 (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
   begin
      App_Data_Access(Object.Connection_Data).View.Label_Text.Put_Line ("Click2");
   end On_Click2;
   
   procedure On_Click3 (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   
   procedure On_Click3 (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      Window : constant Gnoga.Gui.Window.Window_Access :=
        Gnoga.Gui.Window.Window_Access (Object.Parent.Parent);
      View : Gnoga.Gui.View.View_Type;
   begin
      Gnoga.Gui.View.View_Access(Window.Get_View).Remove;
      View.Create (Window.all);
      View.Put_Line ("Application exited.");
      Window.Close_Connection;
   end On_Click3;
   
   procedure Default1
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  : access
        Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      View : hello6.View.Default_View_Type;
   begin
      View.Create (Main_Window);
      View.Click_Button.On_Click_Handler (On_Click1'Access);
      Connection.Hold;
   end Default1;

   procedure Default2
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  : access
        Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      App_Data : constant App_Data_Access := new App_Data_Type;
   begin
      Main_Window.Connection_Data (App_Data);
      App_Data.View.Create (Main_Window);
      App_Data.View.Click_Button.On_Click_Handler (On_Click2'Access);
   end Default2;

   procedure Default3
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  : access
        Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      View : constant hello6.View.Default_View_Access :=
        new hello6.View.Default_View_Type;
      Close_Button : constant Gnoga.Gui.Element.Common.Button_Access :=
        new Gnoga.Gui.Element.Common.Button_Type;
   begin
      View.Dynamic;
      View.Create (Main_Window);
      View.Click_Button.On_Click_Handler (On_Click1'Access);
      Close_Button.Dynamic;
      Close_Button.Create (View.all, "Close");
      Close_Button.On_Click_Handler (On_Click3'Access);
   end Default3;

begin
   Gnoga.Application.Multi_Connect.On_Connect_Handler
     (Default1'Access, "default1");   
   Gnoga.Application.Multi_Connect.On_Connect_Handler
     (Default2'Access, "default2");   
   Gnoga.Application.Multi_Connect.On_Connect_Handler
     (Default3'Access, "default3");   
end hello6.Controller;
