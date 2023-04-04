package com.omb.user.delevery.service;

import java.io.IOException;

import com.omb.user.delevery.vo.Delevery;

public interface DeleveryService {
	
	public String companyList() throws IOException;
	
	public String trackingInfo(Delevery delevery) throws IOException;

}
