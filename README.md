# 📡 Análisis de Parámetros Dinámicos de un ADC de 12 Bits

## 📖 Descripción

Este repositorio presenta el desarrollo de una práctica de laboratorio de **Comunicaciones Digitales**, enfocada en la caracterización dinámica del **ADC de 12 bits** integrado en el microcontrolador **RP2350** de la **Raspberry Pi Pico 2 W**.

El proyecto analiza experimentalmente la **frecuencia de muestreo**, el **jitter** y el comportamiento espectral del ADC mediante la **Transformada Rápida de Fourier (FFT)**. También se calculan parámetros como **SNR, THD, SINAD, ENOB y SFDR**, comparando los resultados experimentales con los valores teóricos de un ADC ideal.

---

## 🎯 Objetivos

* 📊 Determinar experimentalmente la **frecuencia de muestreo (Fs)**.
* ⏱️ Evaluar la estabilidad temporal mediante el **jitter**.
* 📈 Analizar el comportamiento espectral utilizando **FFT**.
* 🔊 Determinar el **piso de ruido** y la ganancia de procesamiento.
* 📐 Calcular **SNR, THD, SINAD, ENOB y SFDR**.
* 🔬 Comparar los resultados obtenidos con los límites teóricos de un ADC ideal de 12 bits.

---

## 🛠️ Hardware utilizado

| 🔧 Elemento                         | 📌 Descripción                          |
| ----------------------------------- | --------------------------------------- |
| 🟢 Raspberry Pi Pico 2 W            | Dispositivo bajo prueba                 |
| 📡 Generador de funciones           | Generación de señal senoidal            |
| 📺 Osciloscopio Tektronix TDS 2012B | Verificación de la señal y del muestreo |
| 💻 Computador                       | Adquisición y procesamiento de datos    |

La señal de entrada se conectó al **GP27** del ADC, mientras que el **GP15** se utilizó para observar el tren de pulsos asociado al proceso de muestreo.

---

## 💻 Software utilizado

* 🐍 **Python** — adquisición de muestras mediante `ADC_testing_1.py`.
* 📊 **MATLAB** — procesamiento, análisis y visualización de los datos.
* 📄 **Archivos CSV** — almacenamiento de muestras, resultados de FFT y métricas.

---

## 🔬 Metodología

### 1️⃣ Fase 1 — Verificación del muestreo

Se utilizó una señal senoidal de **250 Hz**, con una frecuencia de muestreo objetivo de **2000 Hz**.

Durante esta fase se verificaron:

* ⚡ Frecuencia de muestreo.
* ⏱️ Periodo de muestreo.
* 📉 Jitter temporal.
* 🔄 Número de muestras por ciclo.
* 📏 Niveles de tensión de la señal.

La frecuencia de muestreo obtenida fue de **2000,376 Hz**, correspondiente a un error relativo de **0,0188 %**. El jitter medido fue de aproximadamente **2,44 µs**.

---

### 2️⃣ Fase 2 — Análisis espectral

Se realizaron diferentes pruebas variando el número de muestras utilizadas para el procesamiento mediante FFT:

| 🧪 Prueba | 📥 Muestras | 📊 Puntos FFT |
| --------- | ----------: | ------------: |
| 1️⃣       |         128 |           128 |
| 2️⃣       |         256 |           256 |
| 3️⃣       |         512 |           512 |
| 4️⃣       |        1024 |          1024 |

Para cada configuración se analizaron el **piso de ruido** y los principales parámetros dinámicos del ADC.

---

## 📊 Resultados

### 🔊 Piso de ruido

Al incrementar el número de puntos de la FFT de **128 a 1024**, el piso de ruido medido pasó de:

**−69,68 dBFS/bin → −78,75 dBFS/bin**

Esto representa una reducción de aproximadamente **9,07 dB**, valor cercano a los **9,03 dB** esperados teóricamente.

📈 Este resultado evidencia experimentalmente el efecto de la **ganancia de procesamiento de la FFT**.

---

### 📐 Parámetros dinámicos

|  FFT |      SNR |     THD |    SINAD |      ENOB |      SFDR |
| ---: | -------: | ------: | -------: | --------: | --------: |
|  128 | 58,76 dB | 0,211 % | 52,38 dB | 8,41 bits | 60,32 dBc |
|  256 | 52,33 dB | 0,080 % | 51,88 dB | 8,33 bits | 61,26 dBc |
|  512 | 49,38 dB | 0,107 % | 48,97 dB | 7,84 bits | 60,00 dBc |
| 1024 | 49,41 dB | 0,076 % | 49,20 dB | 7,88 bits | 63,26 dBc |

Los resultados completos, gráficas y análisis de cada prueba se encuentran en el informe de laboratorio.

---

## 📌 Conclusiones

✅ La frecuencia de muestreo experimental se mantuvo muy cercana al valor configurado de **2000 Hz**, con un error relativo de **0,0188 %**.

✅ El jitter obtenido fue de aproximadamente **2,44 µs**, permitiendo evaluar la estabilidad temporal del proceso de adquisición.

✅ El incremento del número de puntos de la FFT produjo una disminución del piso de ruido por bin.

✅ Entre **M = 128** y **M = 1024** se obtuvo una reducción de **9,07 dB**, cercana al valor teórico de **9,03 dB**.

⚠️ El piso de ruido experimental se encontró aproximadamente **20 dB por encima del límite teórico**, lo que evidencia la presencia de fuentes adicionales de ruido e interferencias en las condiciones reales de medición.

🔎 Los espurios identificados se concentraron principalmente en componentes de baja frecuencia, permitiendo analizar posibles fuentes externas al comportamiento ideal del ADC.

---

## 👥 Autores

**Harol Felipe Riveros Sierra 1401660**

**Salome Bohórquez Blanco 1401654**

###  Docente

**Ing. José de Jesús Rugeles Uribe**

* **Programa:** Ingeniería en Telecomunicaciones
* **Asignatura:** Comunicaciones Digitales
* **Universidad:** Universidad Militar Nueva Granada
* **Periodo:** 2026-2

---
