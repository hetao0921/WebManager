package fxdigital.dbsync.domains.client.service;

import java.util.List;
import java.util.Map;
import java.util.Timer;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fxdigital.db.dao.IncrementdataInfotabDao;
import com.fxdigital.db.dao.LocalCenterDao;
import com.fxdigital.manager.LocalCenter;
import com.fxdigital.util.ConfigUtil;

@Component
public class AutoIncrementServer {
	private static Logger logger = Logger.getLogger(AutoIncrementServer.class);

	private LocalCenter localCenter;
	@Autowired
	private LocalCenterDao localCenterDao;

	@Autowired
	private IncrementdataInfotabDao incrementdataInfotabDao;
	// 默认定时的时间
	private static String TIME_AUTODOWN_DELAY = "1000";
	private static String TIME_AUTODOWN_INTEVAL = "300000";

//	@PostConstruct
	public void afterInit() {

		int autodowndelay = Integer.valueOf(null == ConfigUtil
				.getString("autodown.delay") ? TIME_AUTODOWN_DELAY : ConfigUtil
				.getString("autodown.delay"));
		int autodowninteval = Integer.valueOf(null == ConfigUtil
				.getString("autodown.inteval") ? TIME_AUTODOWN_INTEVAL
				: ConfigUtil.getString("autodown.inteval"));
		logger.info("localCenter begin.......");
		localCenter = new LocalCenter();
		localCenter = localCenterDao.queryInfo();
		logger.info("localCenter end.......");
		
		Timer timer = new Timer();
		timer.schedule(new TimerTask(), autodowndelay, 30000);

	}

	class TimerTask extends java.util.TimerTask {

		@Override
		public void run() {
			logger.info("start AutoIncrementServer timertask...");
			// 下载版本
//			startAutoIncrementScan();
		}

	}

	public void startAutoIncrementScan() {
		logger.info("start AutoIncrementServer timertask xxxxxxxxxxxxxxxxxxx...");
		logger.info("start AutoIncrementServer timertask begin..."
				+ localCenter.getId());
		List<Map<String, Object>> incrementdataInfo = incrementdataInfotabDao
				.queryIncrementData();
		MsgClientService.getInstance().sendIncrementCommand(incrementdataInfo,localCenter);
		logger.info("start AutoIncrementServer timertask end..."
				+ localCenter.getId());
	}

}
