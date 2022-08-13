with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Canvas;
with Gnoga.Gui.Element.Canvas.Context_2D;

procedure hello2 is
   Main_Window : Gnoga.Gui.Window.Window_Type;
   Main_View   : Gnoga.Gui.View.Console.Console_View_Type;
   Mon_Canvas  : Gnoga.Gui.Element.Canvas.Canvas_Type;
   Context     : Gnoga.Gui.Element.Canvas.Context_2D.Context_2D_Type;
begin
   Gnoga.Application.Title ("hello2");
   Gnoga.Application.HTML_On_Close
     ("<b>Connection to Application has been terminated</b>");

   Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);

   Mon_Canvas.Create (Parent => Main_View, Width => 600, Height => 400);
   Context.Get_Drawing_Context_2D (Mon_Canvas);
   Context.Translate (10, 10);
   Context.Scale (5.0, 5.0);
   Context.Font (Height => "5px");
   Context.Move_To (0, 0);
   Context.Line_To (30, 0);
   Context.Line_To (28, 2);
   Context.Fill_Text ("X", 24, 5);
   Context.Move_To (0, 0);
   Context.Line_To (0, 30);
   Context.Line_To (2, 28);
   Context.Fill_Text ("Y", 1, 26);
   Context.Fill_Text ("0", 1, 5);
   Context.Move_To (20, 10);
   Context.Arc_Radians (10, 10, 10, 0.0, 3.14 / 2.0);
   Context.Line_To (12, 22);
   Context.Fill_Text ("0", 21, 10);
   Context.Fill_Text ("Pi/2", 10, 27);
   Context.Stroke;

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello2;
