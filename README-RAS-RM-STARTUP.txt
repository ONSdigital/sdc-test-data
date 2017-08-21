****************************************************************************************************************************************************
****************************************************************************************************************************************************
This script is taken from Mark Price's startup script to run RAS and RM micro services on his local machine. It's used to get them running locally.
****************************************************************************************************************************************************
****************************************************************************************************************************************************
Edited by: Nicholas Herriot

Introduction

Contents


Step 1 (Get the OAuth2 Server Running Local)
------------------------------------------------------------------------
Pre-requisit
	1) Docker SQL DB running from ras-compose
	2) Git clone https://github.com/ONSdigital/django-oauth2-test
	3) Create virtual env for python 2.7.
	

Setup
1.1)	Migrate DB onto SQL
		/> cd /django-oauth2-test/oauth2server
		/> python manage.py migrate
1.2)	Load test data onto server
		/> python manage.py loaddata apps/credentials/fixtures/ons_credentials.json
1.3)	Create a super user for the server
		/> python manage.py createsuperuser
1.4)	Run the server on localhost 8008
		/> python manage.py runderver 0.0.0.0:8008


Checking
1)		Get a token from the OAuth2 server
curl -X POST localhost:8008/api/v1/tokens/ -d 'grant_type=password&username=testuser@email.com&password=password&client_id=ons@ons.gov&client_secret=password'

2)		Create a new user
curl -X POST http://localhost:8008/api/account/create/ -u ons@ons.gov:password -d 'username=testuser2@email.com&password=password&client_id=ons@ons.gov&client_secret=password&account_verified=true'



Step 2 (Get ras-party-service Server Running Local)
------------------------------------------------------------------------ 
Pre-requisit
	1) OAuth2 Server is running local on port 8008.
	2) Git clone https://github.com/ONSdigital/ras-party
	3) Create virtual env for python 3.5.
	4) rm-case-service is running
	5) rm-iac service is running


2.1)	Migrate a default test database onto ras party service
		/> cd ras-party-service/ras-party
		/> sqlite3 ras-party < scripts/install_test_data.sql 
2.2)	Run Party Service on local port 8081
		/> python run.py
		
[Note: This will use an sqlite DB for storing data. To control this look at the config.yml file]





Step 3 (Get ras-api-gateway Server Running Local)
------------------------------------------------------------------------ 
Pre-requisit
	1) OAuth2 Server is running local on port 8008.
	5) Create virtual env for python 3.5.
	6) Git clone https://github.com/ONSdigital/ras-api-gateway.git


3.1)	Go to base directory and startup the server on 8082
		/> cd ras-api-gateway
		/> PORT=8082 ./scripts/run.sh

		

Step 4 (Get ras-frontstage Server Running Local)
------------------------------------------------------------------------ 
Pre-requisit
	1) OAuth2 Server is running local on port 8008.
	2) ras-party-service is running on 8081
	3) rm-case-service is running
	4) rm-iac service is running
	5) ras-api-gateway is running
	5) Create virtual env for python 3.5.
	6) Git clone https://github.com/ONSdigital/ras-frontstage


Setup
4.1)	Set your environment variable to run in Development Configuration mode:
		/> APP_SETTINGS=config.DevelopmentConfig
		Check it is set by doing:
		/> echo $APP_SETTINGS
		
4.2)	Specify a port for the application to run on and run the application
		PORT=8080 python run.py


Checking
1)		Go to the URL in your browser
		http://localhost:8080/sign-in
		
		

























******************************************************************************************************************************************************

docker run --name ras_postgres_1 -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:9.6





workon ras-party git:(master)

<< ras-party/controllers/controller.py >>

   response = requests.get(case_url, auth=('admin', 'secret'), timeout=0.1) --* as the docker image has basic auth *--



<< local.ini port=8081 db_name=postgres >>

   ONS_ENV=ras-party ./scripts/run.sh






   api-gateway.port: 8083

   gov-uk-notify-service.gov_notify_api_key: 

   gov-uk-notify-service.gov_notify_template_id: 

   gov-uk-notify-service.gov_notify_service_id: 

<< controller.py >>

  request_iac :: response = requests.get(iac_url, auth=('admin', 'secret'), timeout=REQUESTS_GET_TIMEOUT)




PORT=8081 python run.py

curl -X POST \

  http://localhost:8081/party-api/v1/parties \

  -H 'cache-control: no-cache' \

  -H 'content-type: application/json' \

  -d '{"sampleUnitType": "B","sampleUnitRef": "50012345678","attributes": {"contactName": "Mark Price","employeeCount": 50,"enterpriseName": "ACME Limited","facsimile": "+44 1234 567890","fulltimeCount": 35,"legalStatus": "Private Limited Company","name": "ACME Ltd","sic2003": "2520","sic2007": "2520","telephone": "+44 1234 567890","tradingName": "ACME Trading Ltd","turnover": 350}}'







workon ras-collection-instrument git:(TBL081/static_routing)

<< config.ini port=8082 flask_port=8082 api_port=8083 >>

./scripts/run.sh

./scripts/upload.py local 40c7c047-4fb3-4abe-926e-bf19fa2c0a1e 1

http://localhost:8082/collection-instrument-api/1.0.2/ui/

curl -X GET --header 'Accept: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' \

 'http://localhost:8082/collection-instrument-api/1.0.2/download/23935cd4-c953-4999-96d7-e4e45068f63c'












workon ras-frontstage git:(master)

<< app/views/register.py >>

  validate_enrolment_code :: result = requests.get(url, auth=('admin', 'secret'), verify=False) --* as the docker image has basic auth *--

  register_enter_your_details :: 'enrolmentCode': decrypted_enrolment_code

  register_activate_account :: result = requests.put(url)

export API_GATEWAY_CASE_URL=http://localhost:8171/cases/

export API_GATEWAY_COLLECTION_EXERCISE_URL=http://localhost:8145/collectionexercises/

export API_GATEWAY_SURVEYS_URL=http://localhost:8080/surveys/

export API_GATEWAY_IAC_URL=http://localhost:8121/iacs/

export API_GATEWAY_COLLECTION_INSTRUMENT_URL=http://localhost:8082/collection-instrument-api/1.0.2/

export API_GATEWAY_AGGREGATED_SURVEYS_URL=http://localhost:8083/api/1.0.0/surveys/

export API_GATEWAY_PARTY_URL=http://localhost:8081/party-api/v1/

export OAUTHLIB_INSECURE_TRANSPORT=1

export ONS_OAUTH_PROTOCOL=http://

export ONS_OAUTH_SERVER=localhost:8040

export RAS_FRONTSTAGE_CLIENT_ID=ons@ons.gov

export RAS_FRONTSTAGE_CLIENT_SECRET=password

export RM_CASE_SERVICE_HOST=localhost

export RM_CASE_SERVICE_PORT=8171

export RM_CASE_SERVICE_PROTOCOL=http

export RAS_COLLECTION_INSTRUMENT_SERVICE_HOST=localhost

export RAS_COLLECTION_INSTRUMENT_SERVICE_PORT=8082

export RAS_COLLECTION_INSTRUMENT_SERVICE_PROTOCOL=http

export RAS_API_GATEWAY_SERVICE_HOST=localhost

export RAS_API_GATEWAY_SERVICE_PORT=8083

export RAS_API_GATEWAY_SERVICE_PROTOCOL=http

export RM_IAC_SERVICE_HOST=localhost

export RM_IAC_SERVICE_PORT=8121

export RM_IAC_SERVICE_PROTOCOL=http

export RAS_PARTY_SERVICE_HOST=localhost

export RAS_PARTY_SERVICE_PORT=8081

export RAS_PARTY_SERVICE_PROTOCOL=http

export RM_COLLECTION_EXERCISE_SERVICE_HOST=localhost

export RM_COLLECTION_EXERCISE_SERVICE_PORT=8145

export RM_COLLECTION_EXERCISE_SERVICE_PROTOCOL=http

export RM_SURVEY_SERVICE_HOST=localhost

export RM_SURVEY_SERVICE_PORT=8080

export RM_SURVEY_SERVICE_PROTOCOL=http

PORT=5001 python run.py

http://localhost:5001/sign-in

docker run --name ras_postgres_2 -p 5433:5432 -e POSTGRES_PASSWORD=postgres -d postgres:9.6

workon ras-secure-message git:(master)

export RAS_SM_PATH=/Users/pricem/development/ons/ras-compose/ras-secure-message

export SECURE_MESSAGING_DATABASE_URL=postgresql://postgres:postgres@localhost:5433/postgres

export SM_JWT_ENCRYPT=0

python run.py

TCH RM

------

curl -v -u admin:secret http://localhost:8121/iacs/<iac-code>




















******************************************************************************************************************************************************
******************************************************************************************************************************************************
											Environment variable settings
******************************************************************************************************************************************************
******************************************************************************************************************************************************
export OAUTHLIB_INSECURE_TRANSPORT=1
export ONS_OAUTH_PROTOCOL=http://
export ONS_OAUTH_SERVER=localhost:8040
export RAS_FRONTSTAGE_CLIENT_ID=ons@ons.gov
export RAS_FRONTSTAGE_CLIENT_SECRET=password

export RM_CASE_SERVICE_HOST=localhost
export RM_CASE_SERVICE_PORT=8171
export RM_CASE_SERVICE_PROTOCOL=http

export RAS_COLLECTION_INSTRUMENT_SERVICE_HOST=localhost
export RAS_COLLECTION_INSTRUMENT_SERVICE_PORT=8082
export RAS_COLLECTION_INSTRUMENT_SERVICE_PROTOCOL=http

export RM_IAC_SERVICE_HOST=localhost
export RM_IAC_SERVICE_PORT=8121
export RM_IAC_SERVICE_PROTOCOL=http

export RAS_PARTY_SERVICE_HOST=localhost
export RAS_PARTY_SERVICE_PORT=8081
export RAS_PARTY_SERVICE_PROTOCOL=http

export RM_COLLECTION_EXERCISE_SERVICE_HOST=localhost
export RM_COLLECTION_EXERCISE_SERVICE_PORT=8145
export RM_COLLECTION_EXERCISE_SERVICE_PROTOCOL=http

export RM_SURVEY_SERVICE_HOST=localhost
export RM_SURVEY_SERVICE_PORT=8080
export RM_SURVEY_SERVICE_PROTOCOL=http

export API_GATEWAY_CASE_URL=http://localhost:8171/cases/
export API_GATEWAY_COLLECTION_EXERCISE_URL=http://localhost:8145/collectionexercises/
export API_GATEWAY_SURVEYS_URL=http://localhost:8080/surveys/
export API_GATEWAY_IAC_URL=http://localhost:8121/iacs/
export API_GATEWAY_COLLECTION_INSTRUMENT_URL=http://localhost:8082/collection-instrument-api/1.0.2/
export API_GATEWAY_AGGREGATED_SURVEYS_URL=http://localhost:8083/api/1.0.0/surveys/
export API_GATEWAY_PARTY_URL=http://localhost:8081/party-api/v1/

export RAS_API_GATEWAY_SERVICE_HOST=localhost
export RAS_API_GATEWAY_SERVICE_PORT=8083
export RAS_API_GATEWAY_SERVICE_PROTOCOL=http

