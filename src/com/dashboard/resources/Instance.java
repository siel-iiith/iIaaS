package com.dashboard.resources;

import java.util.Set;

import org.jclouds.compute.domain.NodeMetadata.Status;

public class Instance {

	String id;
	String name;
	Set<String> ips;
	int flavorId;
	Status state;
	String zoneId;
	
	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public Instance(String zoneId, String id, String name, Set<String> ips, int flavorId, Status status) {
		super();
		this.zoneId = zoneId;
		this.id = id;
		this.name = name;
		this.ips = ips;
		this.flavorId = flavorId;
		this.state = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<String> getIps() {
		return ips;
	}

	public void setIps(Set<String> ips) {
		this.ips = ips;
	}

	public int getFlavorId() {
		return flavorId;
	}

	public void setFlavorId(int flavorId) {
		this.flavorId = flavorId;
	}

	public Status getState() {
		return state;
	}

	public void setState(Status state) {
		this.state = state;
	}
	
	public String getIp() {
		String ip = "No IP";
		for(String i : getIps()){
			ip = i;
		}
		return ip;
	}
	
}
