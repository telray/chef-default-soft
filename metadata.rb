name              "chef-default-soft"
maintainer        "Rupyshev Vladimir"
maintainer_email  "telrayru@gmail.com"
description       "Installs tools to make the server nicer to work on, quite opinionated"
version           "0.1.0"

recipe "chef-default-soft", "Adds visual flag to production environment as well as htop, vim, mc and zip, also allows for the installation of additional locales"

supports "ubuntu"
