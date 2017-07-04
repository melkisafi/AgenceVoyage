package vol.metier.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@IdClass(EscaleId.class)
public class Escale {

	private Date heureDepart;
	private Date heureArrivee;
	private Aeroport aeroport;
	private Vol vol;
	private int version;

	public Escale() {
	}

	public Escale(Date heureDepart, Date heureArrivee, Aeroport aeroport, Vol vol) {
		this.heureDepart = heureDepart;
		this.heureArrivee = heureArrivee;
		this.aeroport = aeroport;
		this.vol = vol;
	}

	@Column(name = "heuredepart")
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern="HH:mm")
//	@NotNull(message="{validator.heureDepart}")
//	@Future(message="{validator.pasFuture}")
	public Date getHeureDepart() {
		return heureDepart;
	}

	public void setHeureDepart(Date heureDepart) {
		this.heureDepart = heureDepart;
	}

	@Column(name = "heurearrivee")
	@DateTimeFormat(pattern="HH:mm")
	@Temporal(TemporalType.TIME)
//	@NotNull(message="{validator.heureArrivee}")
	public Date getHeureArrivee() {
		return heureArrivee;
	}

	public void setHeureArrivee(Date heureArrivee) {
		this.heureArrivee = heureArrivee;
	}

	@Id
	@ManyToOne
	@JoinColumn(name = "aeroport_id")
	public Aeroport getAeroport() {
		return aeroport;
	}

	public void setAeroport(Aeroport aeroport) {
		this.aeroport = aeroport;
	}

	@Id
	@ManyToOne
	@JoinColumn(name = "vol_id")
	public Vol getVol() {
		return vol;
	}

	public void setVol(Vol vol) {
		this.vol = vol;
	}

	@Version
	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
