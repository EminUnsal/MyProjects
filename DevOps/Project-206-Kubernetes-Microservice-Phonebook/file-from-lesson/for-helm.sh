curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm create phonebook
rm -rf phonebook/templates/*
helm install my-phonebook phonebook/