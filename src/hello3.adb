with Gnoga.Application.Singleton;
with Gnoga.Gui.Window;
with Gnoga.Gui.View.Console;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.Element.Form;

procedure hello3 is
   Main_Window : Gnoga.Gui.Window.Window_Type;
   Main_View   : Gnoga.Gui.View.Console.Console_View_Type;

   procedure Elements_Basics is
      Mon_Lien       : Gnoga.Gui.Element.Common.A_Type;
      Mon_Boutton    : Gnoga.Gui.Element.Common.Button_Type;
      Mon_Bloc       : Gnoga.Gui.Element.Common.DIV_Type;
      Mon_Paragraphe : Gnoga.Gui.Element.Common.P_Type;
      Mon_Image      : Gnoga.Gui.Element.Common.IMG_Type;
      Ma_Séparation  : Gnoga.Gui.Element.Common.HR_Type;
      Mon_Retour     : Gnoga.Gui.Element.Common.BR_Type;
      Ma_Jauge       : Gnoga.Gui.Element.Common.Meter_Type;
      Ma_Barre       : Gnoga.Gui.Element.Common.Progress_Bar_Type;
      Mon_Texte      : Gnoga.Gui.Element.Common.Span_Type;
   begin
      Mon_Lien.Create (Main_View, "http://gnoga.com", "Gnoga");
      Mon_Boutton.Create (Main_View, "OK");
      Mon_Bloc.Create (Main_View, "En bloc.");
      Mon_Paragraphe.Create (Main_View, "En paragraphe.");
      Mon_Image.Create (Main_View, "favicon.ico");
      Ma_Séparation.Create (Main_View);
      Main_View.Put ("Retour à la ligne :");
      Mon_Retour.Create (Main_View);
      Ma_Jauge.Create (Main_View, 30);
      Ma_Barre.Create (Main_View, 60);
      Mon_Texte.Create (Main_View, "En ligne.");
   end Elements_Basics;

   procedure Formulaires is
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
      Mon_Formulaire.Create (Main_View);
      Mon_Texte_Multi.Create (Mon_Formulaire, Value => "Texte multi-ligne...");
      Mon_Formulaire.New_Line;
      Mon_Champ_Cache.Create (Mon_Formulaire, Value => "Valeur0", Name => "Champ0");
      Mon_Formulaire.Put ("<- Champ caché.");
      Mon_Formulaire.New_Line;
      Mon_Bouton.Create (Mon_Formulaire, "Annuler");
      Mon_Bouton_Envoi.Create (Mon_Formulaire, "Envoyer");
      Mon_Bouton_RAZ.Create (Mon_Formulaire, "RAZ");
      Mon_Formulaire.New_Line;
      Ma_Case_A_Cocher.Create (Mon_Formulaire);
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (Mon_Formulaire, Ma_Case_A_Cocher, "Case à cocher");
      Mon_Formulaire.New_Line;
      Mon_Bouton_Radio1.Create (Mon_Formulaire, Value => "Choix1", Name => "Choix");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (Mon_Formulaire, Mon_Bouton_Radio1, "Choix 1");
      Mon_Bouton_Radio2.Create (Mon_Formulaire, True, Value => "Choix2", Name => "Choix");
      Gnoga.Gui.Element.Form.Label_Access'(new Gnoga.Gui.Element.Form.Label_Type).Create
        (Mon_Formulaire, Mon_Bouton_Radio2, "Choix 2");
      Mon_Formulaire.New_Line;
      Mon_Image.Create (Mon_Formulaire, "favicon.ico");
      Mon_Formulaire.Put ("<- image.");
      Mon_Formulaire.New_Line;
      Mon_Texte.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- texte sur une ligne.");
      Mon_Formulaire.New_Line;
      Mon_Mel.Create (Mon_Formulaire, Value => "mel@moi.org");
      Mon_Formulaire.Put ("<- courriel.");
      Mon_Formulaire.New_Line;
      Mon_Mot_Passe.Create (Mon_Formulaire, Value => "mdp");
      Mon_Formulaire.Put ("<- mot de passe.");
      Mon_Formulaire.New_Line;
      Mon_URL.Create (Mon_Formulaire, Value => "http://gnoga.com");
      Mon_Formulaire.Put ("<- URL.");
      Mon_Formulaire.New_Line;
      Ma_Recherche.Create (Mon_Formulaire, Value => "gnoga");
      Mon_Formulaire.Put ("<- recherche.");
      Mon_Formulaire.New_Line;
      Ma_Couleur.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- couleur.");
      Mon_Formulaire.New_Line;
      Ma_Date.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- date yyyy-mm-dd.");
      Mon_Formulaire.New_Line;
      Mon_Heure.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- heure HH:MM.");
      Mon_Formulaire.New_Line;
      Mon_Mois.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- mois yyyy-mm.");
      Mon_Formulaire.New_Line;
      Ma_Semaine.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- semaine yyyy-Www.");
      Mon_Formulaire.New_Line;
      Ma_Date_Heure_Locale.Create (Mon_Formulaire);
      Mon_Formulaire.Put ("<- date et heure locale yyyy-mm-ddTHH:MMZ.");
      Mon_Formulaire.New_Line;
      Mon_Nombre.Create (Mon_Formulaire, Value => "99");
      Mon_Formulaire.Put ("<- nombre.");
      Mon_Formulaire.New_Line;
      Mon_Glisseur.Create (Mon_Formulaire);
      Mon_Etiquette.Create (Mon_Formulaire, Mon_Glisseur, "Glisseur");
      Mon_Formulaire.New_Line;
      Ma_Selection.Create (Mon_Formulaire, Name => "ChampSel");
      Ma_Selection.Add_Option ("Valeur1", "Champ 1");
      Mon_Option1.Create (Mon_Formulaire, Ma_Selection, "Valeur2", "Champ 2");
      Mon_Option_Groupe.Create (Mon_Formulaire, Ma_Selection, "Groupe 1");
      Mon_Option2.Create (Mon_Formulaire, Mon_Option_Groupe, "Valeur3", "Champ 3");
      Mon_Formulaire.New_Line;
      Mon_Fichier.Create (Mon_Formulaire, Name => "Fichier");
      Mon_Formulaire.New_Line;
      Mon_Téléphone.Create (Mon_Formulaire, Value => "(33) 699989795", Name => "Téléphone");
   end Formulaires;

begin
   Gnoga.Application.Title ("hello3");
   Gnoga.Application.HTML_On_Close ("<b>Connection to Application has been terminated</b>");

   --     Gnoga.Application.Open_URL ("http://127.0.0.1:8080");
   Gnoga.Application.Singleton.Initialize (Main_Window, Port => 8080);

   Main_View.Create (Main_Window);
   Elements_Basics;
   Main_View.Horizontal_Rule;
   Formulaires;

   Gnoga.Application.Singleton.Message_Loop;
exception
   when E : others =>
      Gnoga.Log (E);
end hello3;
