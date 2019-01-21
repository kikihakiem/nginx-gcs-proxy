update-generator:
	git fetch gcs-signed-url-generator master
	git subtree pull --prefix gcs-signed-url-generator gcs-signed-url-generator master --squash

add-generator:
	git remote add -f gcs-signed-url-generator git@github.com:kikihakiem/gcs-signed-url-generator.git
	git subtree add --prefix gcs-signed-url-generator gcs-signed-url-generator master --squash
