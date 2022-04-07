CONFIG       := config.tf
LOCKFILE     := .terraform.lock.hcl

.PHONY: init
init: $(LOCKFILE)

.PHONY: plan
plan: $(LOCKFILE)
	terraform plan

.PHONY: apply
apply: $(LOCKFILE)
	terraform apply

.PHONY: fmt
fmt:
	terraform fmt -recursive

$(LOCKFILE): $(CONFIG)
	terraform init
ifeq ($(OS),Windows_NT)
	powershell -NoProfile -Command "(Get-Item $(LOCKFILE)).LastWriteTime = Get-Date"
else
	touch $(LOCKFILE)
endif
