# Zsofia-SoelDerivatives

The tree structure of ZSOFIA, for The SOEL DERIVATIVES Project.
CLI tools to easily manage and track financial products on a
daily basis.

## Zsofia.sh
Zsofia (Zsofia.sh) is the master file of ZSOFIA.

## The Files
ZSOFIA is made of Zsofia.sh, a bash file encapsulating everything, being the CLI interface
for interaction with ZSOFIA. Atomic tasks are handled with Bash, Julia, Python, R (and soon Rust).
The files are the following:  
 + **Csilla**: (Csilla.py) a Python script used to fetch intraday price action across assets and dump them into **Dailies**. **Csilla** calls **Hludana** (see below).
 + **DebugMeSo**: (DebugMeSo.txt) the debug file, it's connected to the standard error.
 + **Flush**: (flush.R, soon to be flush.jl) is an R (soon to be Julia) script to generate plots. 
 + **Hludana**: (Hludana.jl) a Julia script used to process the output of **Csilla** into a tidy Soelian Structure.
 + **Mercedesz**: (Mercedezs.jl) a Julia script used to perform the daily market data updates on the overnight segment.
 + **Prelude**: (Prelude.jl) a Julia module gathering ZSOFIA's Julia dependencies.
 + **SoelFin**: (SoelFin.R) a Schrödinger's R script (dead and/or alive).
 + **Umercure**: (Umercure.R) an R script used to handle economics data.
 + **Unnur**: (Unnur.yaml) a YAML file to manage/configure the states of ZSOFIA.
 + **Xhea**: (Xhea.sh) a Bash file instanciating the daily fetching routine.
 + **Zsofia**: (Zsofia.sh) the interface.

Everything is built from the bash script *Zsofia.sh* through the option *INIT*: it will build the above mentioned files in \${HOME}/Zsofia/ .

## Assets Classes
| Name | Reference |
|:---:|:---:|
|Artemis|US Stocks and ADRs|
|Demeter|Commodity Futures|
|Euterpe|Equity Indexes|
|Mercure|Economical Metrics|
|Nemesis|Equity Indexes Futures|
|Ophelya|Exchange Traded Funds|
|Origami|Japanese Stocks|
|Phorcys|Currencies|
|Satoshi|Cryptocurrencies|

## Tree Structure
.
└── Zsofia
    └── Hrafnhildur
        ├── Artemis
        │   └── Dailies
        ├── Demeter
        │   └── Dailies
        ├── Euterpe
        │   └── Dailies
        ├── Mercure
        │   └── Dailies
        ├── Nemesis
        │   └── Dailies
        ├── Ophelya
        │   └── Dailies
        ├── Origami
        │   └── Dailies
        ├── Phorcys
        │   └── Dailies
        └── Satoshi
            └── Dailies
