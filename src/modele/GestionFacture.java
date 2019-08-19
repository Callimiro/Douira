package modele;

import java.sql.Statement;

public class GestionFacture {
	
	Connexion con = new Connexion();

	public String ajouterFacture(Facture facture, int nbfactures, int payement, String datedebut) {
		
		Statement st = con.connect();
		
		try
		{
			
			for(int i=0; i<nbfactures; i++)
			{
				if(i==0)
				{
					System.out.println(i);
					st.executeUpdate("insert into facture(idcontrat, idlocataire, datefacture, contenu)values(" + facture.getIdcontrat() + ", " + facture.getIdlocataire() + ", '" + datedebut + "', '" + facture.getIdcontrat() + " " + facture.getIdlocataire() + "');");
				}
				else
				{
					System.out.println(i);
					System.out.println(payement);
					st.executeUpdate("insert into facture(idcontrat, idlocataire, datefacture, contenu)values(" + facture.getIdcontrat() + ", " + facture.getIdlocataire() + ", adddate('" + datedebut + "', interval " + i*payement  + " day), '" + facture.getIdcontrat() + " " + facture.getIdlocataire() + "');");
				}
			}
			
			return "Bien loué avec succès ! Veuillez vous présenter dans un délai de 24h à notre agence pour compléter la procédure de la location";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "Location échouée";
	}

}
