
ALTER SEQUENCE casesvc.casegroupseq RESTART WITH 1;
ALTER SEQUENCE casesvc.caseeventseq RESTART WITH 1;
ALTER SEQUENCE casesvc.caseseq RESTART WITH 1;


-- Case group
INSERT INTO casesvc.casegroup(casegrouppk, id, partyid, collectionexerciseid, sampleunitref, sampleunittype) VALUES (nextval('casesvc.casegroupseq'), '9a5f2be5-f944-41f9-982c-3517cfcfef3c', '3b136c4b-7a14-4904-9e01-13364dd7b972', '14fb3e68-4dca-46db-bf49-04b84e07e77c', '49900000000', 'B');

-- Reporting unit ('B') case
INSERT INTO casesvc.case(casepk, id, casegroupfk, casegroupid, partyid, sampleunittype, collectioninstrumentid, statefk, actionplanid, createddatetime, createdby, iac) VALUES (nextval('casesvc.caseseq'), '7bc5d41b-0549-40b3-ba76-42f6d4cf3fdb', 1, '9a5f2be5-f944-41f9-982c-3517cfcfef3c', '3b136c4b-7a14-4904-9e01-13364dd7b972', 'B', '40c7c047-4fb3-4abe-926e-bf19fa2c0a1e', 'INACTIONABLE', 'e71002ac-3575-47eb-b87f-cd9db92bf9a7', current_timestamp, 'SYSTEM', 'fb747cq725lj');

-- Reporting unit ('B') case events
INSERT INTO casesvc.caseevent(caseeventpk, casefk, description, createdby, createddatetime, categoryfk) VALUES (nextval('casesvc.caseeventseq'), 1, 'Case Created', 'SYSTEM', current_timestamp, 'CASE_CREATED');
INSERT INTO casesvc.caseevent(caseeventpk, casefk, description, createdby, createddatetime, categoryfk) VALUES (nextval('casesvc.caseeventseq'), 1, 'Access Code authentication attempted', 'SYSTEM', current_timestamp, 'ACCESS_CODE_AUTHENTICATION_ATTEMPT');
INSERT INTO casesvc.caseevent(caseeventpk, casefk, description, createdby, createddatetime, categoryfk) VALUES (nextval('casesvc.caseeventseq'), 1, 'Account created for respondent', 'SYSTEM', current_timestamp, 'RESPONDENT_ACCOUNT_CREATED');
INSERT INTO casesvc.caseevent(caseeventpk, casefk, description, createdby, createddatetime, categoryfk) VALUES (nextval('casesvc.caseeventseq'), 1, 'Respondent Enroled', 'SYSTEM', current_timestamp, 'RESPONDENT_ENROLED');

-- Respondent ('BI') case
INSERT INTO casesvc.case(casepk, id, casegroupfk, casegroupid, partyid, sampleunittype, collectioninstrumentid, statefk, actionplanid, createddatetime, createdby, iac) VALUES (nextval('casesvc.caseseq'), 'ab548d78-c2f1-400f-9899-79d944b87300', 1, '9a5f2be5-f944-41f9-982c-3517cfcfef3c', 'db036fd7-ce17-40c2-a8fc-932e7c228397', 'BI', '40c7c047-4fb3-4abe-926e-bf19fa2c0a1e', 'ACTIONABLE', '0009e978-0932-463b-a2a1-b45cb3ffcb2a', current_timestamp, 'SYSTEM', 'wsycyxw9kn5g');

-- Respondent ('BI') case events
INSERT INTO casesvc.caseevent(caseeventpk, casefk, description, createdby, createddatetime, categoryfk) VALUES (nextval('casesvc.caseeventseq'), 2, 'Case Created', 'SYSTEM', current_timestamp, 'CASE_CREATED');
INSERT INTO casesvc.caseevent(caseeventpk, casefk, description, createdby, createddatetime, categoryfk) VALUES (nextval('casesvc.caseeventseq'), 2, 'Collection Instrument Downloaded', 'SYSTEM', current_timestamp, 'COLLECTION_INSTRUMENT_DOWNLOADED');

