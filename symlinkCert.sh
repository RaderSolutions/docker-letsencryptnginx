#!/bin/bash

CertPath=/config/keys
LECertPath=/config/keys/letsencrypt
[[ ! -f ${LECertPath}/testfullchain.pem ]] && ln -s ${CertPath}/cert.crt ${LECertPath}/testfullchain.pem
[[ ! -f ${LECertPath}/testprivkey.pem ]] && ln -s ${CertPath}/cert.key ${LECertPath}/testprivkey.pem

