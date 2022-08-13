with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Form;
with Gnoga.Types;
with Gnoga.Gui.Base;

procedure hello3evt is
   use all type Gnoga.String;

   Main_Window : Gnoga.Gui.Window.Window_Type;

   type App_Data is new Gnoga.Types.Connection_Data_Type with record
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
   end record;
   type App_Access is access all App_Data;

   procedure On_Cancel (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Main_View.Put_HTML ("<h1>Annulation du formulaire</h1>");
   end On_Cancel;

   procedure On_Submit (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Main_View.Put_Line ("EVT parameter: Mon_Texte_Multi = " & App.Mon_Texte_Multi.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Champ_Cache = " & App.Mon_Champ_Cache.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Case_A_Cocher = " & Gnoga.Image (App.Ma_Case_A_Cocher.Checked));
      App.Main_View.Put_Line ("EVT parameter: Mon_Bouton_Radio1 = " & Gnoga.Image (App.Mon_Bouton_Radio1.Checked));
      App.Main_View.Put_Line ("EVT parameter: Mon_Bouton_Radio2 = " & Gnoga.Image (App.Mon_Bouton_Radio2.Checked));
      App.Main_View.Put_Line ("EVT parameter: Mon_Image = " & App.Mon_Image.Source);
      App.Main_View.Put_Line ("EVT parameter: Mon_Texte = " & App.Mon_Texte.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Mel = " & App.Mon_Mel.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Mot_Passe = " & App.Mon_Mot_Passe.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_URL = " & App.Mon_URL.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Recherche = " & App.Ma_Recherche.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Couleur = " & App.Ma_Couleur.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Date = " & App.Ma_Date.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Heure = " & App.Mon_Heure.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Mois = " & App.Mon_Mois.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Semaine = " & App.Ma_Semaine.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Date_Heure_Locale = " & App.Ma_Date_Heure_Locale.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Nombre = " & App.Mon_Nombre.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Glisseur = " & App.Mon_Glisseur.Value);
      App.Main_View.Put_Line ("EVT parameter: Ma_Selection = " & App.Ma_Selection.Value);
      App.Main_View.Put_Line ("EVT parameter: Mon_Fichier = " & App.Mon_Fichier.File_Name);
      App.Main_View.Put_Line ("EVT parameter: Mon_Téléphone = " & App.Mon_Téléphone.Value);
   end On_Submit;

   procedure On_Change (Object : in out Gnoga.Gui.Base.Base_Type'Class) is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Main_View.Put_Line ("EVT change: Mon_Glisseur = " & App.Mon_Glisseur.Value);
   end On_Change;

   procedure Formulaires (App : App_Access) is
   begin
      Main_Window.Connection_Data (App);
      App.Main_View.Create (Main_Window);
      App.Mon_Formulaire.Create (App.Main_View);
      App.Mon_Formulaire.On_Submit_Handler (On_Submit'Unrestricted_Access);
      App.Mon_Texte_Multi.Create (App.Mon_Formulaire, Value => "Texte multi-ligne...");
      App.Mon_Formulaire.New_Line;
      App.Mon_Champ_Cache.Create (App.Mon_Formulaire, Value => "Valeur0", Name => "Champ0");
      App.Mon_Formulaire.Put ("<- Champ caché.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Bouton.Create (App.Mon_Formulaire, "Annuler");
      App.Mon_Bouton.On_Click_Handler (On_Cancel'Unrestricted_Access);
      App.Mon_Bouton_Envoi.Create (App.Mon_Formulaire, "Envoyer");
      App.Mon_Bouton_RAZ.Create (App.Mon_Formulaire, "RAZ");
      App.Mon_Formulaire.New_Line;
      App.Ma_Case_A_Cocher.Create (App.Mon_Formulaire);
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (App.Mon_Formulaire, App.Ma_Case_A_Cocher, "Case à cocher");
      App.Mon_Formulaire.New_Line;
      App.Mon_Bouton_Radio1.Create (App.Mon_Formulaire, Value => "Choix1", Name => "Choix");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (App.Mon_Formulaire, App.Mon_Bouton_Radio1, "Choix 1");
      App.Mon_Bouton_Radio2.Create (App.Mon_Formulaire, True, Value => "Choix2", Name => "Choix");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (App.Mon_Formulaire, App.Mon_Bouton_Radio2, "Choix 2");
      App.Mon_Formulaire.New_Line;
      App.Mon_Image.Create (App.Mon_Formulaire, "favicon.ico");
      App.Mon_Formulaire.Put ("<- image.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Texte.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- texte sur une ligne.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Mel.Create (App.Mon_Formulaire, Value => "mel@moi.org");
      App.Mon_Formulaire.Put ("<- courriel.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Mot_Passe.Create (App.Mon_Formulaire, Value => "mdp");
      App.Mon_Formulaire.Put ("<- mot de passe.");
      App.Mon_Formulaire.New_Line;
      App.Mon_URL.Create (App.Mon_Formulaire, Value => "http://gnoga.com");
      App.Mon_Formulaire.Put ("<- URL.");
      App.Mon_Formulaire.New_Line;
      App.Ma_Recherche.Create (App.Mon_Formulaire, Value => "gnoga");
      App.Mon_Formulaire.Put ("<- recherche.");
      App.Mon_Formulaire.New_Line;
      App.Ma_Couleur.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- couleur.");
      App.Mon_Formulaire.New_Line;
      App.Ma_Date.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- date yyyy-mm-dd.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Heure.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- heure HH:MM.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Mois.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- mois yyyy-mm.");
      App.Mon_Formulaire.New_Line;
      App.Ma_Semaine.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- semaine yyyy-Www.");
      App.Mon_Formulaire.New_Line;
      App.Ma_Date_Heure_Locale.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.Put ("<- date et heure locale yyyy-mm-ddTHH:MMZ.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Nombre.Create (App.Mon_Formulaire, Value => "99");
      App.Mon_Formulaire.Put ("<- nombre.");
      App.Mon_Formulaire.New_Line;
      App.Mon_Glisseur.Create (App.Mon_Formulaire);
      App.Mon_Glisseur.On_Change_Handler (On_Change'Unrestricted_Access);
      App.Mon_Etiquette.Create (App.Mon_Formulaire, App.Mon_Glisseur, "Glisseur");
      App.Mon_Formulaire.New_Line;
      App.Ma_Selection.Create (App.Mon_Formulaire, Name => "ChampSel");
      App.Ma_Selection.Add_Option ("Valeur1", "Champ 1");
      App.Mon_Option1.Create (App.Mon_Formulaire, App.Ma_Selection, "Valeur2", "Champ 2");
      App.Mon_Option_Groupe.Create (App.Mon_Formulaire, App.Ma_Selection, "Groupe 1");
      App.Mon_Option2.Create (App.Mon_Formulaire, App.Mon_Option_Groupe, "Valeur3", "Champ 3");
      App.Mon_Formulaire.New_Line;
      App.Mon_Fichier.Create (App.Mon_Formulaire);
      App.Mon_Formulaire.New_Line;
      App.Mon_Téléphone.Create (App.Mon_Formulaire, Value => "(33) 699989795");
      App.Mon_Formulaire.Put ("<- numéro de téléphone.");
   end Formulaires;

begin
   Gnoga.Application.Title ("hello3 EVT");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   --     Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Formulaires (new App_Data);

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello3evt;
