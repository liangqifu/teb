package cn.com.teb.portal.dao;

import java.util.List;

public interface BannerAdDao<BannerAd> extends BaseDao<BannerAd> {
	
	List<BannerAd> query(int limit);
}
