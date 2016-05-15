package cn.com.teb.portal.dao;

import java.util.List;


public interface GlobalAddressDao<GlobalAddress> extends BaseDao<GlobalAddress> {
	List<GlobalAddress> query(String language);
}
