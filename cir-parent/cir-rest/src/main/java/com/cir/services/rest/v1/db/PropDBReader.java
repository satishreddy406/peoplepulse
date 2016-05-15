package com.cir.services.rest.v1.db;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;

/**
 * @author macuser
 *
 */
public class PropDBReader {

	private static Logger logger = LoggerFactory.getLogger(PropDBReader.class);
	private Properties props = null;

	public PropDBReader(Resource fileLocation) {

		if (logger.isDebugEnabled()) {
			logger.debug("START: PropDBReader : PropDBReader()");
		}
		Properties dbProperties = null;
		InputStream fr = null;
		try {
			fr = fileLocation.getInputStream();
			dbProperties = new Properties();
			dbProperties.load(fr);
			props = dbProperties;
		} catch (FileNotFoundException e) {
			logger.error("ERROR: PropDBReader : PropDBReader() exception occured", e);
		} catch (IOException e) {
			logger.error("ERROR: PropDBReader : PropDBReader() exception occured", e);
		} finally {
			if (fr != null) {
				try {
					fr.close();
				} catch (IOException e) {
					logger.error("ERROR: PropDBReader : PropDBReader() exception occured", e);
				}

			}
		}
		if (logger.isDebugEnabled()) {
			logger.debug("END: PropDBReader : PropDBReader()");
		}
	}

	public Properties getProps() {
		return props;
	}

	public void setProps(Properties props) {
		this.props = props;
	}
}
