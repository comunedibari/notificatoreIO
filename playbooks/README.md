# Prerequisiti
1. Server con sistema operativo RH compatibile (es. Almalinux,Centos,OracleLinux) su cui installare il notificatore
2. Server Database MySQL (eventualmente può coincidere con quello del notificatore)
3. Caricare l'SQL (sq/notificatoreio_mysql.sql) sul database MySQL
4. Hostname con cui esporre gli applicativi Govhub, certificato x509 associato all'hostaneme e relativa chiave privata

# Prima installazione
1. Scaricare le componenti software per il notificatore in una directory (vedi elenco dei repositori github delle componenti nel file README.md nella cartella radice). Per ogni componente di frontend va effettuata compilazione e confezionamento in tgz (compressione della dist/*), mentre per le componenti di backend va generato l'equivalente file nomeapplicazione-versione.war tramite goal maven.
2. Installa re ansible sul server notificatore
```
sudo dnf -y install epel-release
sudo dnf -y install ansible
```
3. Editare il file software.yml e verificare che le applicazioni da installare (e le relative versioni) siano corrette
4. Editare il file inventory.yml valorizzando correttamente le variabili:
   - govhub_software_dir
   - govhub_application_jdbc_url
   - govhub_application_dbuser
   - govhub_application_dbpass
   - govhub_hostname
5. Copiare certificato x509 e relativa chiave privata sui path indicati:
   - chiave privata   : /etc/pki/tls/private/{{ govhub_hostname }}-key.pem
   - certificato x509 : /etc/pki/tls/certs/{{ govhub_hostname }}-cert.pem
   - TRUSTSTORE : /etc/pki/tls/certs/{{ govhub_hostname }}-cert.pem (inizialmente creare il file vuoto)

6. Avviare l'installazione con il playbook govhub-firstinstall.yml
```bash
ansible-playbook govhub-firstinstall.yml
```
7. Avviare ii servizi
```bash
systemctl enable --now tomcat
systemctl enable --now nginx
```

# Aggiornamenti
1. Scaricare il software da installare nella directory configurata in precedenza
2. Avviare l'aggiornamento con il playbook govhub-update.yml
```bash
ansible-playbook govhub-update.yml
```
  il playbook e' interattivo, quindi e' sufficiente rispondere alle richieste
