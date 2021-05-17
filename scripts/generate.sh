#!/bin/bash

# Execute to generate new certificates
for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)

    case "$KEY" in
            domain_name)              domain_name=${VALUE} ;;
            *)
    esac
done

if [[ -n "${domain_name// /}" ]]
then
  echo "Generating certificates for domain ..: $domain_name"
  rm certificates/private.key
  rm certificates/public.cert
  openssl req -nodes -new -x509 -days 3650 -keyout private.key -out public.cert -subj "//CN=${domain_name}"
#  $generate
else
  echo "Domain name is required please provide domain as follows."
  echo "./cert_generate.sh domain_name=<respective.domain.name>"
fi

