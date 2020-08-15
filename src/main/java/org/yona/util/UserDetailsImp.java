package org.yona.util;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


/*
 * UserDetails -> 사용자 정보를 담는 인터페이스
*/
@SuppressWarnings("serial")
public class UserDetailsImp implements UserDetails{
	
	private String ID;
	private String Password;
	private String Name;
	private String Authority;
	private boolean Enabled;
	
//	계정이 갖고 있는 권한을 리턴
	@Override 
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(Authority));
		return auth;
	}

	@Override
	public String getPassword() {
		return "{noop}"+Password;
	}

	@Override
	public String getUsername() {
		return ID;
	}

//	계정이 만료되지 않았는 지 리턴
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

//	계정이 잠겨있지 않았는 지 리턴
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

//	비밀번호가 만료되지 않았는 지 리턴
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

//	계정이 사용가능한 지 리턴
	@Override
	public boolean isEnabled() {
		return Enabled;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
	
}
