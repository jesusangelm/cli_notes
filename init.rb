#!/usr/bin/env ruby
# encoding: utf-8

# Notes
# Simple CLI application for note taking
# ======================================

# constante que almacena el directorio actual de la aplicacion,
APP_ROOT = File.dirname(__FILE__)

# carga la carpeta lib y sus contenidos para luego requerirlos  y poder
# usarlos en la aplicacion.
$:.unshift( File.join(APP_ROOT, "lib") )
require "cli"

cli = Cli.new("notas.txt")
cli.launch!
