package cn.com.teb.portal.service;

import javax.annotation.Resource;

import org.junit.Test;

import cn.com.teb.common.utils.DataGridModel;
import cn.com.teb.portal.BaseTestCase;
import cn.com.teb.portal.bean.SupportLanguage;
import cn.com.teb.portal.service.SupportLanguageService;

public class SupportLanguageServiceTestCase extends
		BaseTestCase<SupportLanguage> {

	@Resource
	private SupportLanguageService<SupportLanguage> service;
	
	@Override
	@Test
	public void saveOrUpdate() throws Exception {
		SupportLanguage t=new SupportLanguage();
		t.setIsoCode("cn");
		t.setName("简体中文");
		t.setStatus(1);
		service.saveOrUpdate(t);
		
		t.setId(1);
		t.setIsoCode("tw");
		service.saveOrUpdate(t);
	}

	@Override
	@Test
	public void delete() {
		service.delete(1);
	}

	@Override
	@Test
	public void batchDelete() {
		service.batchDelete("1, 2, 3, 4");
	}

	@Override
	@Test
	public void queryById() {
		System.out.println(service.queryById(1));
	}

	@Override
	@Test
	public void queryByExemple() {
		SupportLanguage t=new SupportLanguage();
		t.setIsoCode("cn");
		t.setName("简体中文");
		t.setStatus(1);
		System.out.println(service.queryByExemple(t, new DataGridModel()));
		System.out.println(service.queryByExemple(t));
	}

	@Override
	@Test
	public void queryAll() {
		System.out.println(service.queryAll());
	}

}
