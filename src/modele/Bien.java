package modele;

public class Bien{
	
	private long idbien;
	
	private long idproprietaire;
	
	private String type;
	
	private String adresse;
	
	private float prixmax;
	
	private float prixmin;
	
	private String payement;
	
	private float surfacemax;
	
	private float surfacemin;
	
	private int npieces;
	
	private int netages;
	
	private int nfacades;
	
	private String description;
	
	private String etat;
	
	private String raisonsignal;
	
	private String colocation;
	
	private int capacite;
	
	private String meuble;
	
	private String accessoires;

	public long getIdbien() {
		return idbien;
	}

	public void setIdbien(long idbien) {
		this.idbien = idbien;
	}

	public long getIdproprietaire() {
		return idproprietaire;
	}

	public void setIdproprietaire(long idproprietaire) {
		this.idproprietaire = idproprietaire;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAdresse() {
		return adresse.toLowerCase();
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse.toLowerCase();
	}

	public float getPrixmax() {
		return prixmax;
	}

	public void setPrixmax(float prixmax) {
		this.prixmax = prixmax;
	}

	public float getPrixmin() {
		return prixmin;
	}

	public void setPrixmin(float prixmin) {
		this.prixmin = prixmin;
	}

	public String getPayement() {
		return payement;
	}

	public void setPayement(String payement) {
		this.payement = payement;
	}

	public float getSurfacemax() {
		return surfacemax;
	}

	public void setSurfacemax(float surfacemax) {
		this.surfacemax = surfacemax;
	}

	public float getSurfacemin() {
		return surfacemin;
	}

	public void setSurfacemin(float surfacemin) {
		this.surfacemin = surfacemin;
	}

	public int getNpieces() {
		return npieces;
	}

	public void setNpieces(int npieces) {
		this.npieces = npieces;
	}

	public int getNetages() {
		return netages;
	}

	public void setNetages(int netages) {
		this.netages = netages;
	}

	public int getNfacades() {
		return nfacades;
	}

	public void setNfacades(int nfacades) {
		this.nfacades = nfacades;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public String getRaisonsignal() {
		return raisonsignal;
	}

	public void setRaisonsignal(String raisonsignal) {
		this.raisonsignal = raisonsignal;
	}

	public String getColocation() {
		return colocation;
	}

	public void setColocation(String colocation) {
		this.colocation = colocation;
	}

	public int getCapacite() {
		return capacite;
	}

	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}

	public String getMeuble() {
		return meuble;
	}

	public void setMeuble(String meuble) {
		this.meuble = meuble;
	}

	public String getAccessoires() {
		return accessoires;
	}

	public void setAccessoires(String accessoires) {
		this.accessoires = accessoires;
	}

}
