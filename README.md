# 🎛️ Stream Deck - Windows System Scripts

Colección de scripts `.bat` para automatizar acciones del sistema en **Windows**, pensados para integrarse fácilmente con **Stream Deck** u otros launchers.

## 📌 Descripción

Este repositorio contiene scripts simples en Batch (`.bat`) que ejecutan acciones directas del sistema operativo Windows, como apagar el equipo, reiniciar, suspender, bloquear pantalla, entre otras.

Son ideales para:

- Integración con Stream Deck
- Automatización rápida
- Atajos físicos personalizados
- Entornos de productividad

---

## ⚙️ Requisitos

- Windows 10 / Windows 11
- Permisos de usuario estándar (algunos scripts pueden requerir administrador)
- Stream Deck (opcional)

---

## 📂 Scripts Incluidos

| Script | Función |
|--------|---------|
| `apagar.bat` | Apaga el equipo inmediatamente |
| `reiniciar.bat` | Reinicia el equipo |
| `suspender.bat` | Suspende el sistema |
| `bloquear.bat` | Bloquea la pantalla |
| `cerrar_ventanas.ps1` | Cierra todas las ventanas|
---

## 🚀 Cómo usar con Stream Deck

1. Abre el software de Stream Deck.
2. Arrastra la acción **"Open"** o **"System > Open"**.
3. Selecciona el archivo `.bat`.
4. Opcional: activa "Run as Administrator" si el script lo requiere.
5. Asigna un icono personalizado.

---

## 🛠️ Personalización

Puedes modificar los tiempos de espera agregando:

shutdown /s /t 10


Donde `10` es el número de segundos antes de ejecutar la acción.

---


## 📄 Licencia

Uso libre para proyectos personales y educativos.

---

## 👨‍💻 Autor

Angel Gabriel Crispin Valdivia  
Backend Developer | Automatizacion