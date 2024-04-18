#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

library(openxlsx)

template_path <- args[1]
names_path <- args[2]
xml_path <- args[3]

tmp_folder <- tempdir()
tmp_file <- tempfile()

names <- openxlsx::read.xlsx(names_path)

# 1-named certificate

