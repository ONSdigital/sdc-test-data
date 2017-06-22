-- Sample summary
INSERT INTO sample.samplesummary(samplesummarypk, surveyref, effectivestartdatetime, effectiveenddatetime, state, ingestdatetime) VALUES (1, '221', current_timestamp, current_timestamp, 'ACTIVE', current_timestamp);

-- Sample unit
INSERT INTO sample.sampleunit(sampleunitpk, samplesummaryfk, sampleunitref, sampleunittype, formtype, state) VALUES (1, 1, '49900000000', 'B', '112', 'DELIVERED');