package Connection;

public class Customer 
{
	
	private String cid;
	private String passport;
	private String nationality;
	private String status;
	private String alid;
	public String ticketnum;
	public String aircraft;
	public String date;
	

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAircraft() {
		return aircraft;
	}
	public void setAircraft(String aircraft) {
		this.aircraft = aircraft;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getTicketnum() {
		return ticketnum;
	}
	public void setTicketnum(String ticketnum) {
		this.ticketnum = ticketnum;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAlid() {
		return alid;
	}
	public void setAlid(String alid) {
		this.alid = alid;
	}
}
