package com.bootdo.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bootdo.system.domain.UserOnline;

@Service
public interface SessionService {
	List<UserOnline> list();
}
