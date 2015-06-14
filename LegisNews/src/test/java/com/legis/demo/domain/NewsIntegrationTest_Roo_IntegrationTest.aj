// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.dao.NewsDAO;
import com.legis.demo.domain.NewsDataOnDemand;
import com.legis.demo.domain.NewsIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect NewsIntegrationTest_Roo_IntegrationTest {
    
    declare @type: NewsIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: NewsIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: NewsIntegrationTest: @Transactional;
    
    @Autowired
    NewsDataOnDemand NewsIntegrationTest.dod;
    
    @Autowired
    NewsDAO NewsIntegrationTest.newsDAO;
    
    @Test
    public void NewsIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", dod.getRandomNews());
        long count = newsDAO.count();
        Assert.assertTrue("Counter for 'News' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void NewsIntegrationTest.testFind() {
        News obj = dod.getRandomNews();
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'News' failed to provide an identifier", id);
        obj = newsDAO.findOne(id);
        Assert.assertNotNull("Find method for 'News' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'News' returned the incorrect identifier", id, obj.getId_());
    }
    
    @Test
    public void NewsIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", dod.getRandomNews());
        long count = newsDAO.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'News', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<News> result = newsDAO.findAll();
        Assert.assertNotNull("Find all method for 'News' illegally returned null", result);
        Assert.assertTrue("Find all method for 'News' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void NewsIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", dod.getRandomNews());
        long count = newsDAO.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<News> result = newsDAO.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'News' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'News' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void NewsIntegrationTest.testFlush() {
        News obj = dod.getRandomNews();
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'News' failed to provide an identifier", id);
        obj = newsDAO.findOne(id);
        Assert.assertNotNull("Find method for 'News' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyNews(obj);
        Integer currentVersion = obj.getVersion();
        newsDAO.flush();
        Assert.assertTrue("Version for 'News' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void NewsIntegrationTest.testSaveUpdate() {
        News obj = dod.getRandomNews();
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'News' failed to provide an identifier", id);
        obj = newsDAO.findOne(id);
        boolean modified =  dod.modifyNews(obj);
        Integer currentVersion = obj.getVersion();
        News merged = (News)newsDAO.save(obj);
        newsDAO.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId_(), id);
        Assert.assertTrue("Version for 'News' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void NewsIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", dod.getRandomNews());
        News obj = dod.getNewTransientNews(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'News' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'News' identifier to be null", obj.getId_());
        try {
            newsDAO.save(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        newsDAO.flush();
        Assert.assertNotNull("Expected 'News' identifier to no longer be null", obj.getId_());
    }
    
    @Test
    public void NewsIntegrationTest.testDelete() {
        News obj = dod.getRandomNews();
        Assert.assertNotNull("Data on demand for 'News' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'News' failed to provide an identifier", id);
        obj = newsDAO.findOne(id);
        newsDAO.delete(obj);
        newsDAO.flush();
        Assert.assertNull("Failed to remove 'News' with identifier '" + id + "'", newsDAO.findOne(id));
    }
    
}
