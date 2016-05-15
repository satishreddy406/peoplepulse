package com.cir.services.rest.v1.db;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

/**
 * @author macuser
 *
 */
public abstract class AbstractBaseDAO {
	@Autowired
	protected DataSourceTransactionManager transactionManager;
	protected JdbcTemplate jdbcTemplate;
	private PropDBReader propDBReader;
	@Autowired
	public void createTemplate(@Qualifier("dataSource") DataSource dataSource,@Qualifier("cdsDBProperties") PropDBReader propDBReader) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.propDBReader = propDBReader;
	}
	/**
	 * @param key
	 * @return
	 */
	protected String getQuery(String key) {
		return this.propDBReader.getProps().getProperty(key);
	}
}
