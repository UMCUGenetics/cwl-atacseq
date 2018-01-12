#!/usr/bin/env cwl-runner
class: Workflow

cwlVersion: v1.0

inputs:
  - id: treatment
    type:
      type: array
      items: File
  - id: g
    type:
      - 'null'
      - string
  - id: nomodel
    type:
      - 'null'
      -  boolean
  - id: nolambda
    type:
      - 'null'
      - boolean
outputs:
  outfile:
    type: File
    outputSource: macs2-callpeak/output_peak_file

steps:
  macs2-callpeak:
    run: macs2-callpeak.cwl
    in:
      treatment:
        source: treatment
    out: [output_peak_file]

doc: |
  ATACseq pipeline workflow
