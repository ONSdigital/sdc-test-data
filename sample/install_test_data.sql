-- Sample summary
INSERT INTO sample.samplesummary(samplesummarypk, surveyref, effectivestartdatetime, effectiveenddatetime, statefk, ingestdatetime) VALUES (nextval('sample.samplesummaryseq'), '221', current_timestamp, current_timestamp, 'ACTIVE', current_timestamp);
-- Sample unit
INSERT INTO sample.sampleunit(sampleunitpk, samplesummaryfk, sampleunitref, sampleunittype, formtype, statefk) VALUES (nextval('sample.sampleunitseq'), currval('sample.samplesummaryseq'), '49900000000', 'B', '112', 'DELIVERED');
