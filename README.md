# Survey Data Collection Platform Test Data
This repository contains test data for the Respondent Account Services (RAS) and Response Management (RM) microservices that make up the Survey Data Collection (SDC) platform. This test data contains a single loaded sample unit and reflects the stage in the lifecycle at which a respondent has successfully enroled for the BRES collection exercise.

## Action Service
The Action service is seeded with two action plans:

### Reporting unit action plan
* id: `e71002ac-3575-47eb-b87f-cd9db92bf9a7`
* name: `Enrolment`

### Respondent action plan
* id: `0009e978-0932-463b-a2a1-b45cb3ffcb2a`
* name: `BRES`

## Case Service
Execute `case/install_test_data.sql` to load a reporting unit (*B*) case and associated events, respondent (*BI*) case and associated events, and parent case group into the Case service.

### Case group
* id: `9a5f2be5-f944-41f9-982c-3517cfcfef3c`

### Reporting unit case (inactionable)
* id: `7bc5d41b-0549-40b3-ba76-42f6d4cf3fdb`

### Respondent case (actionable)
* id: `ab548d78-c2f1-400f-9899-79d944b87300`

## Collection Exercise Service
The Collection Exercise service is seeded with standing data for one collection exercise:

* id: `14fb3e68-4dca-46db-bf49-04b84e07e77c`
* name: `BRES_2016`

## Collection Instrument Service
Execute `collectioninstrument/install_test_data.sql` to load a collection instrument.

* id: `40c7c047-4fb3-4abe-926e-bf19fa2c0a1e`

## Party Service
Execute `party/install_test_data.sql` to load a reporting unit (*B*) party, respondent (*BI*) party and the enrolment association between them into the Party service.

### Reporting unit party
* id: `3b136c4b-7a14-4904-9e01-13364dd7b972`

### Respondent party
* id: `db036fd7-ce17-40c2-a8fc-932e7c228397`

## Sample Service
Execute `sample/install_test_data.sql` to load a sample unit for reporting unit `49900000000`.

## Survey Service
The Survey service is seeded with standing data for the BRES survey:

* id: `cb0711c3-0ac8-41d3-ae0e-567e5ea1ef87`
* name: `BRES`
* surveyRef: `221`

## Copyright
Copyright (C) 2017 Crown Copyright (Office for National Statistics)