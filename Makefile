.PHONY: install-hooks check push-to-dokku

push-to-dokku:
	git push -f dokku main:main
