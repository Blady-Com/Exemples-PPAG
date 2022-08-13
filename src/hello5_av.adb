with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Multimedia;

procedure hello5_av is
   use all type Gnoga.String;

   Main_Window : Gnoga.Gui.Window.Window_Type;
   Main_View   : Gnoga.Gui.View.Console.Console_View_Type;

   Audio : Gnoga.Gui.Element.Multimedia.Audio_Type;
   Video : Gnoga.Gui.Element.Multimedia.Video_Type;

begin
   Gnoga.Application.Title ("hello5");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);
   Main_View.Put_Line ("Audio");
   Audio.Create (Main_View, "img/tune.mp3");
   Gnoga.Log ("The browser can play MP3s? - " & Gnoga.Image (Audio.Can_Play ("audio/mp3")));
   Main_View.Put_Line ("Video");
   Video.Create (Main_View, "img/test.mp4");
   Gnoga.Log ("The browser can play MP4s? - " & Gnoga.Image (Video.Can_Play ("video/mp4")));

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello5_av;
