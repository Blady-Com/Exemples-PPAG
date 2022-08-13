with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Form;
with Gnoga.Types;
with Gnoga.Application.Multi_Connect;
with Gnoga.Server.Connection;

procedure hello3post_file is

   use all type Gnoga.String;

   subtype String is Gnoga.String;

   Last_Parameters : Gnoga.Types.Data_Map_Type;

   procedure Formulaires
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  :        access Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      Main_View            : Gnoga.Gui.View.Console.Console_View_Type;
      Mon_Formulaire       : Gnoga.Gui.Element.Form.Form_Type;
      Mon_Texte_Multi      : Gnoga.Gui.Element.Form.Text_Area_Type;
      Mon_Champ_Cache      : Gnoga.Gui.Element.Form.Hidden_Type;
      Mon_Bouton           : Gnoga.Gui.Element.Form.Input_Button_Type;
      Mon_Bouton_Envoi     : Gnoga.Gui.Element.Form.Submit_Button_Type;
      Mon_Bouton_RAZ       : Gnoga.Gui.Element.Form.Reset_Button_Type;
      Ma_Case_A_Cocher     : Gnoga.Gui.Element.Form.Check_Box_Type;
      Mon_Bouton_Radio1    : Gnoga.Gui.Element.Form.Radio_Button_Type;
      Mon_Bouton_Radio2    : Gnoga.Gui.Element.Form.Radio_Button_Type;
      Mon_Image            : Gnoga.Gui.Element.Form.Input_Image_Type;
      Mon_Texte            : Gnoga.Gui.Element.Form.Text_Type;
      Mon_Mel              : Gnoga.Gui.Element.Form.Email_Type;
      Mon_Mot_Passe        : Gnoga.Gui.Element.Form.Password_Type;
      Mon_URL              : Gnoga.Gui.Element.Form.URL_Type;
      Ma_Recherche         : Gnoga.Gui.Element.Form.Search_Type;
      Ma_Couleur           : Gnoga.Gui.Element.Form.Color_Picker_Type;
      Ma_Date              : Gnoga.Gui.Element.Form.Date_Type;
      Mon_Heure            : Gnoga.Gui.Element.Form.Time_Type;
      Mon_Mois             : Gnoga.Gui.Element.Form.Month_Type;
      Ma_Semaine           : Gnoga.Gui.Element.Form.Week_Type;
      Ma_Date_Heure_Locale : Gnoga.Gui.Element.Form.Date_Time_Local_Type;
      Mon_Nombre           : Gnoga.Gui.Element.Form.Number_Type;
      Mon_Glisseur         : Gnoga.Gui.Element.Form.Range_Type;
      Mon_Etiquette        : Gnoga.Gui.Element.Form.Label_Type;
      Ma_Selection         : Gnoga.Gui.Element.Form.Selection_Type;
      Mon_Option1          : Gnoga.Gui.Element.Form.Option_Type;
      Mon_Option2          : Gnoga.Gui.Element.Form.Option_Type;
      Mon_Option_Groupe    : Gnoga.Gui.Element.Form.Option_Group_Type;
      Mon_Fichier          : Gnoga.Gui.Element.Form.File_Type;
      Mon_Téléphone        : Gnoga.Gui.Element.Form.Tel_Type;
   begin
      Main_View.Create (Main_Window);
      Mon_Formulaire.Create (Main_View, "/resultats", Gnoga.Gui.Element.Form.Post);
      -- Format nécessaire pour le transfert effectif des données du fichier sélectionné (voir Mon_Fichier)
      Mon_Formulaire.Encoding (Gnoga.Gui.Element.Form.Multi_Part);
      Mon_Texte_Multi.Create (Mon_Formulaire, Value => "Texte multi-ligne...", Name => "Texte multi-ligne");
      Mon_Formulaire.New_Line;
      Mon_Champ_Cache.Create (Mon_Formulaire, Value => "Valeur0", Name => "Champ Caché");
      Mon_Formulaire.Put ("<- Champ caché.");
      Mon_Formulaire.New_Line;
      Mon_Bouton.Create (Mon_Formulaire, "Annuler");
      Mon_Bouton_Envoi.Create (Mon_Formulaire, "Envoyer");
      Mon_Bouton_RAZ.Create (Mon_Formulaire, "RAZ");
      Mon_Formulaire.New_Line;
      Ma_Case_A_Cocher.Create (Mon_Formulaire, Value => "Cochée", Name => "Case à Cocher");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (Mon_Formulaire, Ma_Case_A_Cocher, "Case à cocher");
      Mon_Formulaire.New_Line;
      Mon_Bouton_Radio1.Create (Mon_Formulaire, Value => "Choix1", Name => "Boutons radio");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (Mon_Formulaire, Mon_Bouton_Radio1, "Choix 1");
      Mon_Bouton_Radio2.Create (Mon_Formulaire, True, Value => "Choix2", Name => "Boutons radio");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (Mon_Formulaire, Mon_Bouton_Radio2, "Choix 2");
      Mon_Formulaire.New_Line;
      Mon_Image.Create (Mon_Formulaire, "favicon.ico", Value => "favicon.ico", Name => "Image");
      Mon_Formulaire.Put ("<- image.");
      Mon_Formulaire.New_Line;
      Mon_Texte.Create (Mon_Formulaire, Name => "Texte");
      Mon_Formulaire.Put ("<- texte sur une ligne.");
      Mon_Formulaire.New_Line;
      Mon_Mel.Create (Mon_Formulaire, Value => "mel@moi.org", Name => "Mel");
      Mon_Formulaire.Put ("<- courriel.");
      Mon_Formulaire.New_Line;
      Mon_Mot_Passe.Create (Mon_Formulaire, Value => "mdp", Name => "MDP");
      Mon_Formulaire.Put ("<- mot de passe.");
      Mon_Formulaire.New_Line;
      Mon_URL.Create (Mon_Formulaire, Value => "http://gnoga.com", Name => "URL");
      Mon_Formulaire.Put ("<- URL.");
      Mon_Formulaire.New_Line;
      Ma_Recherche.Create (Mon_Formulaire, Value => "gnoga", Name => "Recherche");
      Mon_Formulaire.Put ("<- recherche.");
      Mon_Formulaire.New_Line;
      Ma_Couleur.Create (Mon_Formulaire, Name => "Couleur");
      Mon_Formulaire.Put ("<- couleur.");
      Mon_Formulaire.New_Line;
      Ma_Date.Create (Mon_Formulaire, Name => "Date");
      Mon_Formulaire.Put ("<- date yyyy-mm-dd.");
      Mon_Formulaire.New_Line;
      Mon_Heure.Create (Mon_Formulaire, Name => "Heure");
      Mon_Formulaire.Put ("<- heure HH:MM.");
      Mon_Formulaire.New_Line;
      Mon_Mois.Create (Mon_Formulaire, Name => "Mois");
      Mon_Formulaire.Put ("<- mois yyyy-mm.");
      Mon_Formulaire.New_Line;
      Ma_Semaine.Create (Mon_Formulaire, Name => "Semaine");
      Mon_Formulaire.Put ("<- semaine yyyy-Www.");
      Mon_Formulaire.New_Line;
      Ma_Date_Heure_Locale.Create (Mon_Formulaire, Name => "Date heure locale");
      Mon_Formulaire.Put ("<- date et heure locale yyyy-mm-ddTHH:MMZ.");
      Mon_Formulaire.New_Line;
      Mon_Nombre.Create (Mon_Formulaire, Value => "99", Name => "Nombre");
      Mon_Formulaire.Put ("<- nombre.");
      Mon_Formulaire.New_Line;
      Mon_Glisseur.Create (Mon_Formulaire, Name => "Glisseur");
      Mon_Etiquette.Create (Mon_Formulaire, Mon_Glisseur, "Glisseur");
      Mon_Formulaire.New_Line;
      Ma_Selection.Create (Mon_Formulaire, Name => "Sélection");
      Ma_Selection.Add_Option ("Valeur1", "Champ 1");
      Mon_Option1.Create (Mon_Formulaire, Ma_Selection, "Valeur2", "Champ 2");
      Mon_Option_Groupe.Create (Mon_Formulaire, Ma_Selection, "Groupe 1");
      Mon_Option2.Create (Mon_Formulaire, Mon_Option_Groupe, "Valeur3", "Champ 3");
      Mon_Formulaire.New_Line;
      Mon_Fichier.Create (Mon_Formulaire, Name => "Fichier");
      Mon_Formulaire.New_Line;
      Mon_Téléphone.Create (Mon_Formulaire, Value => "(33) 699989795", Name => "Téléphone");
   end Formulaires;

   procedure On_Post_Request
     (URI                 : in     String;
      Accepted_Parameters :    out String)
   is
      pragma Unreferenced (URI);
   begin
      Accepted_Parameters :=
           "Texte multi-ligne,Champ Caché,Case à Cocher,Boutons radio,Image," &
           "Texte,Mel,MDP,URL,Recherche,Couleur,Date,Heure,Mois,Semaine," &
           "Date heure locale,Nombre,Glisseur,Sélection,Image.x,Image.y,Fichier,Téléphone";
   end On_Post_Request;

   procedure On_Post
     (URI        :        String;
      Parameters : in out Gnoga.Types.Data_Map_Type)
   is
      pragma Unreferenced (URI);
   begin
      for C in Parameters.Iterate loop
         Last_Parameters.Include (Gnoga.Types.Data_Maps.Key (C), Gnoga.Types.Data_Maps.Element (C));
      end loop;
   end On_Post;

   procedure On_Post_File
     (URI       : in String;
      File_Name : in String;
      Temp_Name : in String)
   is
      pragma Unreferenced (URI);
   begin
      Last_Parameters.Include ("Fichier envoyé", File_Name);
      Last_Parameters.Include ("Fichier reçu", Temp_Name);
   end On_Post_File;

   procedure Resultats
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  :        access Gnoga.Application.Multi_Connect.Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      Main_View : Gnoga.Gui.View.Console.Console_View_Type;
   begin
      Main_View.Create (Main_Window);
      for C in Last_Parameters.Iterate loop
         begin
            Main_View.Put_Line
              ("POST parameter: " & Gnoga.Types.Data_Maps.Key (C) & " = " & Gnoga.Types.Data_Maps.Element (C));
         end;
      end loop;
      Last_Parameters.Clear;
   end Resultats;

begin
   Gnoga.Application.Title ("hello3 POST File");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   --     Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Multi_Connect.Initialize;
   Gnoga.Application.Multi_Connect.On_Connect_Handler (Formulaires'Unrestricted_Access);
   Gnoga.Application.Multi_Connect.On_Connect_Handler (Resultats'Unrestricted_Access, "/resultats");

   Gnoga.Server.Connection.On_Post_Handler (On_Post'Unrestricted_Access);
   Gnoga.Server.Connection.On_Post_Request_Handler (On_Post_Request'Unrestricted_Access);
   Gnoga.Server.Connection.On_Post_File_Handler (On_Post_File'Unrestricted_Access);

   Gnoga.Application.Multi_Connect.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello3post_file;
