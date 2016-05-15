package cn.com.teb.common.utils;

import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 按比例缩放图片帮助类
 * @author <a href="mailto:xiegengcai@gmail.com">Xie Gengcai</a>
 * 2012-7-11
 */
public class ImageUtils {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private BufferedImage srcImage = null;
	private File srcFile = null;
	private File destFile = null;
	private String fileSuffix = null;

	private int imageWidth = 0;
	private int imageHeight = 0;

	public ImageUtils(String fileName) throws Exception {
		this(new File(fileName));
	}

	public ImageUtils(File fileName) throws Exception {
		File _file = fileName;
		this.srcFile = _file;
		this.fileSuffix = _file.getName().substring(
				(_file.getName().indexOf(".") + 1), (_file.getName().length()));
		this.destFile = new File(this.srcFile.getPath().substring(0,
				(this.srcFile.getPath().lastIndexOf(".")))
				+ "_thumb." + this.fileSuffix);
		srcImage = ImageIO.read(_file);
		// 得到图片的原始大小， 以便按比例压缩。
		imageWidth = srcImage.getWidth(null);
		imageHeight = srcImage.getHeight(null);
	}

	/**
	 * 强制压缩/放大图片到固定的大小
	 * 
	 * @param w
	 *            int 新宽度
	 * @param h
	 *            int 新高度
	 * @throws IOException
	 */
	public  void resize(int h, int w) {   
        try {   
        	if (imageWidth >= imageHeight) {
    			h = (int) Math.round((imageHeight * w * 1.0 / imageWidth));
    		} else {
    			w = (int) Math.round((imageWidth * h * 1.0 / imageHeight));
    		}
            double ratio = 0; 
            Image itemp = srcImage.getScaledInstance(w, h, BufferedImage.SCALE_SMOOTH);      
            if (imageHeight > imageWidth) {      
                ratio = new Double(h) / imageHeight;      
            } else {      
                ratio = new Double(w) / imageWidth;      
            } 
            AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(ratio, ratio), null);      
            itemp = op.filter(srcImage, null);         
            ImageIO.write((BufferedImage) itemp, fileSuffix, destFile);      
        } catch (IOException e) {   
            e.printStackTrace(); 
            logger.error("压缩/放大图片出错", e);
        }   
    } 
	public static void main(String[] args) throws Exception {
		ImageUtils imgUtils = new ImageUtils("D:\\software\\PHP\\Ecshop\\teb\\src\\main\\webapp\\attachment\\images\\a56dc1be240b8648e4cad01cf817976d.jpg");
		imgUtils.resize(1000, 1000);
	}

}
