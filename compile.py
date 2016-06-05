import jinja2
import pandas

df = pandas.read_csv('SS List - Users.csv')
users = df.T.to_dict()

template = jinja2.Template(open('docker-compose.yml.tpl').read())
open('docker-compose.yml', 'w').write(template.render(users=users))

