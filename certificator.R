#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

template <- args[1]
names <- args[2]
text_path <- args[3]
tmp_folder <- tempdir()
tmp_file <- tempfile()

