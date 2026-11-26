#!/bin/bash
# Branding Soporte_Servintex para RustDesk (se ejecuta desde la raiz del repo)
set -e

# 1) Nombre de la app
sed -i 's/RwLock::new("RustDesk".to_owned())/RwLock::new("Soporte_Servintex".to_owned())/' libs/hbb_common/src/config.rs
grep -n 'APP_NAME' libs/hbb_common/src/config.rs | head -3
grep -q 'RwLock::new("Soporte_Servintex"' libs/hbb_common/src/config.rs

# 2) Texto "Con tecnologia de RustDesk" -> Soporte Servintex + telefono
sed -i '/^Widget loadPowered/,/^}/ {
s|launchUrl(Uri.parse(.https://rustdesk.com.));||
s|translate("powered_by_me")|"Soporte Servintex\\nTel. 924 800 117"|
s|overflow: TextOverflow.clip,|textAlign: TextAlign.center,|
s|?.copyWith(fontSize: 9, decoration: TextDecoration.underline)|?.copyWith(fontSize: 12, fontWeight: FontWeight.w600)|
s|opacity: 0.5,|opacity: 0.85,|
s|SystemMouseCursors.click|SystemMouseCursors.basic|
}' flutter/lib/common.dart
grep -q 'Tel. 924 800 117' flutter/lib/common.dart
echo "Branding aplicado"
