package com.sist.logger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class Sample {
    final Logger logger = LoggerFactory.getLogger(Sample.class);
    public void run() {
        logger.debug("debug");
        logger.info("info");
    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Sample();
	}
}