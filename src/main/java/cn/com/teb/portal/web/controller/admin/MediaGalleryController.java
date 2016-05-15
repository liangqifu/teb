package cn.com.teb.portal.web.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.com.teb.common.Constants;
import cn.com.teb.common.utils.AttachmentUtil;
import cn.com.teb.common.utils.DataGridModel;
import cn.com.teb.common.utils.ImageUtils;
import cn.com.teb.common.utils.JsonPage;
import cn.com.teb.common.utils.MD5Util;
import cn.com.teb.portal.bean.MediaGallery;
import cn.com.teb.portal.service.MediaGalleryService;

@Controller
@RequestMapping(value="admin/media")
public class MediaGalleryController {
	private final Logger log=LoggerFactory.getLogger(getClass());
	
	@Resource
	private MediaGalleryService<MediaGallery> service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(Model model){
		model.addAttribute("media", new MediaGallery());
		return "admin/media";
	}
	
	/**
	 * 新增/保存<br>
	 * admin/media/save
 	 * @param media
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="save", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> save(@ModelAttribute(value="media") MediaGallery media
			, BindingResult result, HttpServletRequest request) throws Exception{
		Map<String, Object> resultMap=new HashMap<String, Object>(); 
		if (result.hasErrors()) {
			log.warn(result.getAllErrors().toString());
			resultMap.put(Constants.ANSWER_CODE, -1);
			return resultMap;
		}
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
		MultipartFile multipartFile = multipartRequest.getFile("file");
		if(media.getId()==0&&(multipartFile==null||multipartFile.getOriginalFilename().length()<=0)){
			log.debug("file must be not empty ...");
			resultMap.put(Constants.ANSWER_CODE, -1);
			return resultMap;
		}
    	if (multipartFile!=null && multipartFile.getOriginalFilename().length()>0) { // 上传文件
    		String prefix=MD5Util.md5Hex(System.nanoTime()+"");
    		String suffix = multipartFile.getOriginalFilename().substring(
    				multipartFile.getOriginalFilename().lastIndexOf("."));
    		String fileName = (prefix + suffix).toLowerCase();// 构建文件名称
    		String hostPath="http://"+request.getServerName();
    		int port = request.getLocalPort();
    		if(port!=80){
    			hostPath+=":"+port;
    		}
    		if (media.getType()==MediaGallery.TYPE_FLV) {
    			media.setUrl(hostPath+Constants.BASE_PATH_FLASH+fileName);
			} else {
				media.setUrl(hostPath+Constants.BASE_PATH_IMAGE+fileName);
			}
    		multipartFile.transferTo(AttachmentUtil.getImageFile(fileName));
    		if (media.getType()==MediaGallery.TYPE_IMG) {
    			ImageUtils imgUtils = new ImageUtils(AttachmentUtil.getImagePath(fileName));
        		imgUtils.resize(250, 200);
    		}
		}
    	service.saveOrUpdate(media);
		resultMap.put(Constants.ANSWER_CODE, 1);
		resultMap.put("url", media.getUrl());
		return resultMap;
	}
	
	/**
	 * 查看<br>
	 * admin/media/view?id={id}
	 * @param id
	 * @return
	 */
	@RequestMapping(value="view", method=RequestMethod.GET)
	@ResponseBody
	public MediaGallery view(@RequestParam int id){
		if (id<=0) {
			log.warn("The param id must be bigger than 0...");
			return null;
		}
		return service.queryById(id);
	}
	
	/**
	 * 删除
	 * admin/media/delete?id=|ids=
	 * @param id
	 * @return
	 */
	@RequestMapping(value="delete", method=RequestMethod.GET)
	@ResponseBody
	public int delete(@RequestParam(required=true) String ids){
		if (StringUtils.hasText(ids)) {
			return service.batchDelete(ids);
		}else {
			throw new IllegalArgumentException("both id and ids are empty...");
		}
	}
	
	/**
	 * 查询
	 * admin/media/query
	 * @return {@link JsonPage<MediaGallery>}
	 */
	@RequestMapping(value="query", method=RequestMethod.GET)
	@ResponseBody
	public JsonPage<MediaGallery> query(@ModelAttribute(value="media") MediaGallery media, BindingResult result,DataGridModel dgm){
		return service.queryByExemple(media, dgm);
	}
}
