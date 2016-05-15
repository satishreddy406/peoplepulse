package com.cir.services.rest.v1.resource;

import org.glassfish.jersey.server.ResourceConfig;

public class CIRAppResourceConfig extends ResourceConfig {

	public CIRAppResourceConfig() {
		register(UserResource.class);
	}

}
