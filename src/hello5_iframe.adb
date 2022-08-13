with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.IFrame;

procedure hello5_iframe is
   Main_Window : Gnoga.Gui.Window.Window_Type;
   Main_View   : Gnoga.Gui.View.Console.Console_View_Type;

   Web_Frame : Gnoga.Gui.Element.IFrame.IFrame_Type;

begin
   Gnoga.Application.Title ("hello5");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);
   Main_View.Put_Line ("Gnoga web page (Internet connexion required):");

   Web_Frame.Create (Main_View, "http://www.gnoga.com");
   Web_Frame.Width (300);
   Web_Frame.Height (200);
   Web_Frame.Border;

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello5_iframe;
