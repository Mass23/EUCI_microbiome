#!/usr/bin/env bash
wget https://data.qiime2.org/2020.8/common/silva-138-99-seqs.qza > silva-138-99-seqs.qza
wget https://data.qiime2.org/2020.8/common/silva-138-99-tax.qza > silva-138-99-tax.qza

conda activate qiime2-2020.8

qiime feature-classifier extract-reads --i-sequences silva-138-99-seqs.qza --p-f-primer CCTACGGGNGGCWGCAG --p-r-primer GACTACHVGGGTATCTAATCC --p-min-length 400 --p-max-length 450 --o-reads silva-138-99_341f-785r_400-450_reads.qza

qiime feature-classifier fit-classifier-naive-bayes --i-reference-reads silva-138-99_341f-785r_400-450_reads.qza --i-reference-taxonomy silva-138-99-tax.qza --o-classifier silva-138-99_341f-785r_400-450_classifier.qza
