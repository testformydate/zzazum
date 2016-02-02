package com.mydate.zzazum.location.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.location.vo.LocationVo;

public interface ApiLoadInter {
	public ArrayList<LocationVo> apiUpdate() throws IOException, DataAccessException;
}
