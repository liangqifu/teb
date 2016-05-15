package cn.com.teb.portal.service;

import java.util.List;

public interface BannerAdService<BannerAd> extends
		BaseService<BannerAd> {
	List<BannerAd> query(int limit);
}
