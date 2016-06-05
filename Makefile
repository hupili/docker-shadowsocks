compile:
	# Make sure file exsits 'SS List - Users.csv'
	python compile.py

sync:
	docker-compose up -d --remove-orphans

email:
	mgcli.py send_template hupili 'ShadowSocks for {{Name}}' email.html SS\ List\ -\ Users.csv

