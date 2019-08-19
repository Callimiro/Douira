package modele;

public class Facture {
	
	private long idfacture;
	
	private long idcontrat;
	
	private long idlocataire;
	
	private String contenu;

	public long getIdfacture() {
		return idfacture;
	}

	public void setIdfacture(long idfacture) {
		this.idfacture = idfacture;
	}

	public long getIdcontrat() {
		return idcontrat;
	}

	public void setIdcontrat(long idcontrat) {
		this.idcontrat = idcontrat;
	}

	public long getIdlocataire() {
		return idlocataire;
	}

	public void setIdlocataire(long idlocataire) {
		this.idlocataire = idlocataire;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

}
