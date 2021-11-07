#
# Makefile for Lektor
#


dependencies  = lektor

venv_root     = venv
venv_pip      = $(venv_root)/bin/pip
venv_lektor   = $(venv_root)/bin/lektor

builddir      = build


.PHONY: help clean all

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  help"
	@echo "  clean-build"
	@echo "  clean-venv"
	@echo "  clean-all"
	@echo "  venv"
	@echo "  build"
	@echo "  all"

clean-build:
	-rm -rf $(builddir)

clean-venv:
	-rm -rf $(venv_root)

clean-all: clean-venv clean-build

venv:
	python3 -m venv $(venv_root)
	$(venv_pip) install --upgrade pip setuptools wheel

venv/bin/lektor:
	$(venv_pip) install lektor

build:
	$(venv_lektor) build --output-path $(builddir)

all: venv clean-build venv/bin/lektor build
