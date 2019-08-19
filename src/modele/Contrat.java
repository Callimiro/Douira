package modele;

import java.io.Serializable;

public class Contrat implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2511000980290030758L;

	private long idcontrat;
	
	private long idbien;
	
	private String datecontrat;
	
	private String datedebut;
	
	private int dureebail;
	
	private String contenu;
	
	private String etat;

	public long getIdcontrat() {
		return idcontrat;
	}

	public void setIdcontrat(long idcontrat) {
		this.idcontrat = idcontrat;
	}

	public long getIdbien() {
		return idbien;
	}

	public void setIdbien(long idbien) {
		this.idbien = idbien;
	}

	public String getDatecontrat() {
		return datecontrat;
	}

	public void setDatecontrat(String datecontrat) {
		this.datecontrat = datecontrat;
	}

	public String getDatedebut() {
		return datedebut;
	}

	public void setDatedebut(String datedebut) {
		this.datedebut = datedebut;
	}

	public int getDureebail() {
		return dureebail;
	}

	public void setDureebail(int dureebail) {
		this.dureebail = dureebail;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

}
