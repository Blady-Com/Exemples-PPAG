with Ada.Long_Long_Float_Text_IO;

with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View;
with Gnoga.Gui.Base;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.Element.Form;

with UXStrings.Formatting;

procedure hello is
   Main_Window     : Gnoga.Gui.Window.Window_Type;
   Main_View       : Gnoga.Gui.View.View_Type;
   Quit_Button     : Gnoga.Gui.Element.Common.Button_Type;
   Fact_Form       : Gnoga.Gui.Element.Form.Form_Type;
   Input_Text      : Gnoga.Gui.Element.Form.Text_Type;
   Question_Label  : Gnoga.Gui.Element.Form.Label_Type;
   Fact_Button     : Gnoga.Gui.Element.Common.Button_Type;
   Result_Label    : Gnoga.Gui.Element.Common.DIV_Type;
   Dec_Check_Box   : Gnoga.Gui.Element.Form.Check_Box_Type;
   Dec_Label       : Gnoga.Gui.Element.Form.Label_Type;
   Dec_Range       : Gnoga.Gui.Element.Form.Range_Type;
   Dec_Range_Label : Gnoga.Gui.Element.Form.Label_Type;
   Dec_Value_Label : Gnoga.Gui.Element.Form.Label_Type;

   use all type Gnoga.String;

   subtype String is Gnoga.String;

   procedure On_Quit (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      pragma Unreferenced (Object);
   begin
      Gnoga.Application.Singleton.End_Application;
   end On_Quit;

   procedure On_Factorial (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      pragma Unreferenced (Object);
      function Format is new UXStrings.Formatting.Integer_Format (Long_Long_Integer);
      function Format (V : Long_Long_Float) return String is
         S : Standard.String (1 .. 20);
      begin
         Ada.Long_Long_Float_Text_IO.Put (S, V, Dec_Range.Value, 6);
         return From_Latin_1 (S);
      end;

      function Factorielle_LLI (N : Natural) return Long_Long_Integer is
         F : Long_Long_Integer := 1;
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Integer (I);
         end loop;
         return F;
      end Factorielle_LLI;
      function Factorielle_LLF (N : Natural) return Long_Long_Float is
         F : Long_Long_Float := 1.0;
      begin
         for I in 2 .. N loop
            F := F * Long_Long_Float (I);
         end loop;
         return F;
      end Factorielle_LLF;
   begin
      if not Dec_Check_Box.Checked then
         Result_Label.Text
         ("Résultat " &
          Input_Text.Value &
          "! = " &
          Format (Factorielle_LLI (Gnoga.Value (Input_Text.Value))));
      else
         Result_Label.Text
         ("Résultat " &
          Input_Text.Value &
          "! = " &
          Format (Factorielle_LLF (Gnoga.Value (Input_Text.Value))));
      end if;
   exception
      when others =>
         Result_Label.Text ("Erreur !");
   end On_Factorial;

   procedure Dec_Range_Change (Element : in out Gnoga.Gui.Base.Base_Type'Class) is
      pragma Unreferenced (Element);
   begin
      Dec_Value_Label.Text (Dec_Range.Value);
   end Dec_Range_Change;

   procedure On_Dec_Change (Element : in out Gnoga.Gui.Base.Base_Type'Class) is
      pragma Unreferenced (Element);
   begin
      Dec_Range.Disabled (not Dec_Check_Box.Checked);
   end On_Dec_Change;

begin
   Gnoga.Application.Title ("hello");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);
   Quit_Button.Create (Main_View, "Quitter");
   Quit_Button.On_Click_Handler (On_Quit'Unrestricted_Access);
   Fact_Form.Create (Main_View);
   Input_Text.Create (Fact_Form, 40);
   Input_Text.Place_Holder ("nombre entier");
   Input_Text.Pattern ("[0-9]+");
   Input_Text.Focus;
   Question_Label.Create (Fact_Form, Input_Text, "Saisir un nombre entier : ");
   Fact_Form.New_Line;
   Dec_Check_Box.Create (Fact_Form);
   Dec_Check_Box.On_Change_Handler (On_Dec_Change'Unrestricted_Access);
   Dec_Label.Create (Fact_Form, Dec_Check_Box, " Calcul décimal", False);
   Fact_Form.New_Line;
   Dec_Range.Create (Fact_Form);
   Dec_Range.Minimum (0);
   Dec_Range.Maximum (10);
   Dec_Range.Value (0);
   Dec_Range.Disabled;
   Dec_Value_Label.Create (Fact_Form, Dec_Range, "0", False);
   Dec_Range_Label.Create (Fact_Form, Dec_Range, " décimale(s)", False);
   Dec_Range.On_Change_Handler (Dec_Range_Change'Unrestricted_Access);
   Main_View.Put_Line ("Calcul de factorielle :");
   Fact_Button.Create (Main_View, "Calcul");
   Fact_Button.On_Click_Handler (On_Factorial'Unrestricted_Access);
   Fact_Form.On_Submit_Handler (On_Factorial'Unrestricted_Access);
   Result_Label.Create (Main_View);

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello;
