#!/usr/bin/env cwl-runner

##Peak calling using MACS2 (undockerized version)
## Modified example from https://github.com/common-workflow-language

cwlVersion: v1.0
class: CommandLineTool
baseCommand: /Users/tschafers/CWLPipelines/cwl-atacseq/scripts/peaksort.sh
inputs:
  dir_out:
    type: string
    inputBinding:
      position: 3
      prefix: --dir_out
  file_out:
    type: string
    inputBinding:
      position: 3
      prefix: --file_out
  sample:
    type: string
    inputBinding:
      position: 3
      prefix: --sample

outputs: []
