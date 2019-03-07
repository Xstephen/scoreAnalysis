package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.AdministratorMapper;
import com.sse.scoreAnalysis.model.Administrator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdministratorServiceImpl implements AdministratorService {
    @Autowired
    AdministratorMapper administratorMapper;
    @Override
    public Administrator getAdministratorInfo(String administratorId) {
        return administratorMapper.selectByPrimaryKey(administratorId);
    }
}
