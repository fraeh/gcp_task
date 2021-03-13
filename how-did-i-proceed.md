# Wie bin ich vorgegangen?

## VM Erzeugung

- Zuerst habe ich mir in der GCP Console angeschaut, wie eine VM erstellt wird und welche Einstellungen vorzunehmen sind (Maschinentyp, Region, Image, ...)
- Danach habe ich auf terraform.io das einfachste Beispiel angeschaut, wie eine VM erstellt wird
    - https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started
- Erstellung eines Service Account Key, um Terraform auszuführen
    - https://console.cloud.google.com/apis/credentials/serviceaccountkey
- Erste VM per Terraform erstellt und wieder gelöscht 
- Variablen (für Kundenkonfiguration) aus Erzeugungsskript rausziehen. 
- Defaultwerte festlegen
- Weitere Terraform Variablendatei mit geänderter Konfiguration erstellt und getestet

## Netzwerke einrichten
- Gleiches vorgehen wie bei der VM. Zuerst versuchen die Konfiguration in der grafischen Oberfläche aufzubauen.
- VPC Netzwerk(e) mit Terraform erstellen (ohne VM)
- VPC Peerings zwischen zwei Netzen zuweisen. 

## VM und Netze zusammen erzeugen
- Skripte in unterschiedliche Dateien auslagern
- VM einem erzeugten Netzwerk zugewiesen (nicht mehr default)
- Tests ohne bzw. mit den tfvars Dateien durchgeführt. 


