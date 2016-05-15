package cn.com.teb.portal.dao;

import java.util.List;


public interface DemoVideoDao<DemoVideo> extends BaseDao<DemoVideo> {
	
	List<DemoVideo> queryNewest(int limit);
}
