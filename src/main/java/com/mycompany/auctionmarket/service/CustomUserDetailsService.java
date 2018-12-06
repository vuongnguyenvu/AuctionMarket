/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.auctionmarket.service;

import com.mycompany.auctionmarket.entity.RoleEntity;
import com.mycompany.auctionmarket.entity.UserEntity;
import com.mycompany.auctionmarket.repository.RoleRepository;
import com.mycompany.auctionmarket.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author VUKE
 */
@Service
public class CustomUserDetailsService implements UserDetailsService{
  @Autowired
  UserRepository userRepo;
  @Autowired
  RoleRepository roleRepo;
  @Autowired
  UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = userService.getUserByUsername(username);
		if(null == user) {
			throw new UsernameNotFoundException(String.format("NOT FOUND User infor with [ USER_NAME = %s ].", username));
		}

		RoleEntity role = user.getRole();
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		if(null == role) {
			throw new RuntimeException("Have no role for this User.");
		} else {
				GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(
						role.getRole_name());
				authorities.add(grantedAuthority);
		}

		UserDetails userDetails = new org.springframework.security.core.userdetails.User(
				user.getUsername(), user.getPassword(), authorities);
		return userDetails;
    }
}
