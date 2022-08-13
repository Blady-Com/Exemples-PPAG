with Gnoga.Application.Multi_Connect;

with hello6.Controller;

procedure hello6.Main is
begin
   Gnoga.Application.Title ("hello6");
   Gnoga.Application.HTML_On_Close
     ("<b>Connection to Application has been terminated</b>");
   
   Gnoga.Application.Multi_Connect.Initialize;
   
   Gnoga.Application.Multi_Connect.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello6.Main;
