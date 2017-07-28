#!/usr/bin/env python3

#  CF_API=https://api.system.devtest.onsclofo.uk CF_USER=(your user id) CF_PASS=(your password) ./data_load.py <environment> <instance> <script>
# cat <file-name.psql> | PGPASSWORD=4j8uzhgvr0nkzda2c27ggql3d psql -h localhost -p 3333 dbfctdqibhwvnje25 -U u17ityeadf4gfadt

from cloudfoundry_client.client import CloudFoundryClient
from sys import argv
import os
import time
import subprocess

def usage():
	print('Usage: {} <space> <app> <sql>'.format(argv[0]))
	exit()

if len(argv) < 4:
	usage()

cf_api = os.getenv('CF_API', None)
if not cf_api:
	print('You need to set the CF_API environment variable')
	exit()

cf_user = os.getenv('CF_USER', None)

if not cf_user:
	print('You need to set the CF_USER environment variable')
	exit()

cf_pass = os.getenv('CF_PASS', None)

if not cf_pass:
	print('You need to set the CF_PASS environment variable')
	exit()


client = CloudFoundryClient(cf_api, skip_verification=True)
client.init_with_user_credentials(cf_user, cf_pass)


for organization in client.organizations:
	for space in organization.spaces():
		space_name = space['entity']['name']

		if space_name != argv[1]:
			continue
		for app in space.apps():

			app_name = app['entity']['name']

			if app_name != argv[2]:

				continue

			guid = app['metadata']['guid']

			env = client.apps.get_env(guid)

			services = env['system_env_json']['VCAP_SERVICES']

			if 'rds' not in services.keys():

				print('No "rds" binding for this instance')

				exit()

			db = services['rds'][0]['credentials']



			print("cf ssh -L 3333:{}:5432 {}".format(db['host'], app_name))

			print("cat {} | PGPASSWORD={} psql -h localhost -p 3333 {} -U {}".format(argv[3], db['password'], db['db_name'], db['username']))
