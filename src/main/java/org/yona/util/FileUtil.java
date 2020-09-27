package org.yona.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class FileUtil {

	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

	@Resource(name = "uploadPath")
	private static String uploadPath;
	
	public static String uploadFile(String string, byte[] fileData) throws Exception {

//		중복되지 않는 고유한 키값 생성
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + string;

		String savedPath = calcPath();

		File target = new File(uploadPath + savedPath, savedName);

//		데이터가 담긴 바이트의 배열을 파일에 기록한다
		FileCopyUtils.copy(fileData, target);

		String uploadedFileName = null;

		return uploadedFileName;

	}

	private static String calcPath() {

		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}

	private static void makeDir(String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

}
