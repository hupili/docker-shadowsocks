version: '2'
services:
{% for (key, user) in users.iteritems(): %}
  {{user.SS_ID}}:
    image: hupili/shadowsocks
    build: .
    ports:
      - "{{user.Port}}:3000"
    environment:
      SS_SERVER: 0.0.0.0
      SS_PORT: 3000
      SS_PASSWORD: {{user.Password}}
      SS_ENCRYPTION: {{user.Encryption}}
{% endfor %}
