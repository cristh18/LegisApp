// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.dao.FavoriteDAO;
import com.legis.demo.domain.FavoriteDataOnDemand;
import com.legis.demo.domain.FavoriteIntegrationTest;
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

privileged aspect FavoriteIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FavoriteIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FavoriteIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FavoriteIntegrationTest: @Transactional;
    
    @Autowired
    FavoriteDataOnDemand FavoriteIntegrationTest.dod;
    
    @Autowired
    FavoriteDAO FavoriteIntegrationTest.favoriteDAO;
    
    @Test
    public void FavoriteIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", dod.getRandomFavorite());
        long count = favoriteDAO.count();
        Assert.assertTrue("Counter for 'Favorite' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FavoriteIntegrationTest.testFind() {
        Favorite obj = dod.getRandomFavorite();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to provide an identifier", id);
        obj = favoriteDAO.findOne(id);
        Assert.assertNotNull("Find method for 'Favorite' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Favorite' returned the incorrect identifier", id, obj.getId_());
    }
    
    @Test
    public void FavoriteIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", dod.getRandomFavorite());
        long count = favoriteDAO.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Favorite', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Favorite> result = favoriteDAO.findAll();
        Assert.assertNotNull("Find all method for 'Favorite' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Favorite' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FavoriteIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", dod.getRandomFavorite());
        long count = favoriteDAO.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Favorite> result = favoriteDAO.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Favorite' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Favorite' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FavoriteIntegrationTest.testFlush() {
        Favorite obj = dod.getRandomFavorite();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to provide an identifier", id);
        obj = favoriteDAO.findOne(id);
        Assert.assertNotNull("Find method for 'Favorite' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFavorite(obj);
        Integer currentVersion = obj.getVersion();
        favoriteDAO.flush();
        Assert.assertTrue("Version for 'Favorite' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FavoriteIntegrationTest.testSaveUpdate() {
        Favorite obj = dod.getRandomFavorite();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to provide an identifier", id);
        obj = favoriteDAO.findOne(id);
        boolean modified =  dod.modifyFavorite(obj);
        Integer currentVersion = obj.getVersion();
        Favorite merged = (Favorite)favoriteDAO.save(obj);
        favoriteDAO.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId_(), id);
        Assert.assertTrue("Version for 'Favorite' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FavoriteIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", dod.getRandomFavorite());
        Favorite obj = dod.getNewTransientFavorite(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Favorite' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Favorite' identifier to be null", obj.getId_());
        try {
            favoriteDAO.save(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        favoriteDAO.flush();
        Assert.assertNotNull("Expected 'Favorite' identifier to no longer be null", obj.getId_());
    }
    
    @Test
    public void FavoriteIntegrationTest.testDelete() {
        Favorite obj = dod.getRandomFavorite();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'Favorite' failed to provide an identifier", id);
        obj = favoriteDAO.findOne(id);
        favoriteDAO.delete(obj);
        favoriteDAO.flush();
        Assert.assertNull("Failed to remove 'Favorite' with identifier '" + id + "'", favoriteDAO.findOne(id));
    }
    
}
