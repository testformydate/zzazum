package com.mydate.zzazum.location.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.location.vo.LocationVo;

public interface LocationUpdateDao {
	
	@Select("select * from md_locaiton")
	public List<LocationVo> selectAllData();
	
	@Select("select * from md_location where like concat('%',#{p_name},'%')")
	public List<LocationVo>  selectSearchData(LocationVo location);
	
	@Select("select max(p_no) from md_location")
	public String selectMaxNo();
	
	@Insert("insert into md_location(p_no,p_name,p_addr,p_lat,p_lng,p_image) values(#{p_no},#{p_name},#{p_addr},#{p_lat},#{p_lng},#{p_image})")
	public boolean insertApiData(LocationVo location);
}
