# SAR ADC GF180
12-bit SAR ADC targetting the open-source GlobalFoundries 180nm PDK for the SSCS “PICO” Open-Source Chipathon.

[Proposal](https://github.com/sscs-ose/sscs-ose-chipathon.github.io/blob/main/initial_notebooks_2023/submitted_notebooks/labbench-on-chip-sar-adc/SAR_ADC_proposal.ipynb)

## Directory structure
    .
    ├── klayout             # Layout files
    │   ├── python          # Python generation
    │   ├── gds             # Output layout
    ├── lvs                 # LVS logs and scripts
    ├── magic               # Magic files
    │   ├── extract         # Extraction files
    │   └── tcl             # Scripts
    ├── notebooks           # Jupyter notebooks
    ├── openlane            # Scripts
    │   ├── rtl             # HDL
    │   └── test            # Testbenches
    └── xschem              # Schematics and symbols
        ├── test            # Testbenches
        ├── python          # Python programs
        └── spice           # Netlists

