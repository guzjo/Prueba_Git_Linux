#!/bin/bash

# ==============================================================================
# Script de Control de Calidad para archivos FASTQ usando FastQC y MultiQC
# ==============================================================================

# 1. Definir variables (Puedes modificar estas rutas según tus necesidades)
INPUT_DIR="../fq"      # Carpeta donde están tus archivos FASTQ
OUTPUT_DIR="../results"   # Carpeta donde se guardarán los reportes
THREADS=1                      # Número de núcleos del procesador a utilizar

# 2. Crear el directorio de salida si no existe
echo "Verificando/Creando el directorio de salida: $OUTPUT_DIR"
mkdir -p "${OUTPUR_DIR}"

# 3. Ejecutar FastQC
echo "------------------------------------------------------------"
echo "Iniciando análisis individual con FastQC..."
echo "------------------------------------------------------------"
# Busca archivos .fastq o .fastq.gz en el directorio de entrada
# -t especifica los hilos, -o el directorio de salida
fastqc -t "$THREADS" -o "$OUTPUT_DIR" "$INPUT_DIR"/*.fastq*

# 4. Ejecutar MultiQC
echo "------------------------------------------------------------"
echo "Agregando resultados con MultiQC..."
echo "------------------------------------------------------------"
# MultiQC escaneará el directorio de salida de FastQC y creará el resumen ahí mismo
multiqc -o "$OUTPUT_DIR" "$OUTPUT_DIR"

echo "------------------------------------------------------------"
echo "¡Proceso completado con éxito!"
echo "Puedes encontrar el reporte interactivo en: $OUTPUT_DIR/multiqc_report.html"
echo "------------------------------------------------------------"
