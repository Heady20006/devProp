resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'devProp'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'sv.lua'
}

client_scripts {
	'cl.lua'
}

dependencies {
	'es_extended'
}