package com.freshcoffee.dto;

import java.util.Date;

public class MemberDTO {
	
	private String id; 
    private String pw;	 
    private String name; 
    private String phone; 
    private String email; 
    private String email_url;
    private String zipcode;
    private String addr1;
    private String addr2;
    private String bir1;
    private String bir2;
    private String bir3;
    private Date regdate;
    
    
    
    public MemberDTO(String id, String pw, String name, String phone, String email, String email_url, String zipcode,
			String addr1, String addr2, String bir1, String bir2, String bir3, Date regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.email_url = email_url;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.bir1 = bir1;
		this.bir2 = bir2;
		this.bir3 = bir3;
		this.regdate = regdate;
	}
    
    

	public MemberDTO(String id, String pw, String name, String phone, String email, String email_url, String zipcode,
			String addr1, String addr2, String bir1, String bir2, String bir3) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.email_url = email_url;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.bir1 = bir1;
		this.bir2 = bir2;
		this.bir3 = bir3;
	}



	public MemberDTO(String id,String name, String phone, String email, String email_url, String zipcode,
			String addr1, String addr2, String bir1, String bir2, String bir3) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.email_url = email_url;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.bir1 = bir1;
		this.bir2 = bir2;
		this.bir3 = bir3;
	}



	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", email_url=" + email_url + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", bir1=" + bir1
				+ ", bir2=" + bir2 + ", bir3=" + bir3 + ", regdate=" + regdate + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail_url() {
		return email_url;
	}

	public void setEmail_url(String email_url) {
		this.email_url = email_url;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getBir1() {
		return bir1;
	}

	public void setBir1(String bir1) {
		this.bir1 = bir1;
	}

	public String getBir2() {
		return bir2;
	}

	public void setBir2(String bir2) {
		this.bir2 = bir2;
	}

	public String getBir3() {
		return bir3;
	}

	public void setBir3(String bir3) {
		this.bir3 = bir3;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public MemberDTO() {}


    
}
