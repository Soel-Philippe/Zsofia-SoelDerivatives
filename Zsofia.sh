zsofia_prompt () {
clear
echo -ne "\n\t"
for j in {1..40}; do
echo -ne "#"
done
echo -ne "\n\t"
echo -ne "#  ZSOFIA, powered by SOEL DERIVATIVES #\n"
echo -ne "\t"
for j in {1..40}; do
echo -ne "#"
done
echo -e "\n"
}
[ $# -gt 0 ] && echo "Usage: $0\nAny argument will be ignored"
Bunch=( Csilla.py Hludana.jl Mercedesz.jl Prelude.jl SoelFin.R Umercure.R Unnur.yaml Xhea.sh )
CheckMe=()
Err="${HOME}/Zsofia/DebugMeSo.txt"
for j in ${Bunch[@]}; do
! [ -f "$j" ] && CheckMe+=( "$j" )
done
if [ ${#CheckMe[@]} -gt 0 ]; then
echo "The following files are missing in $PWD :"
echo "*******************"
for j in ${CheckMe[@]}; do
printf '*  %-15s*\n' "$j"
for k in {1..19}; do echo -ne "*"; done
echo ""
done
echo -e "\nMaybe Zsofia is not yet installed on your system.\n Use INIT from the MENU below to install'em." && sleep 2
fi
echo -e "\nZsofia 0.1.0\nDeveloper: Soel Philippe (soelderivatives@skiff.com)\nMaintainer: <S>\n"
Bunch=( Artemis Demeter Euterpe Mercure Nemesis Ophelya Origami Phorcys Satoshi Quit )
BunchD=( "US Stocks" "Commodity Futures" "Equity Indexes, spot" "Economical metrics" "Equity Indexes, Futures" "ETFs, mainly" "Japan Stocks" "Currencies against USD" "Cryptocurrencies against USD" "Quit" )
oneD=( \"AAPL\", \"BYND\", \"COP\", \"PLTR\", \"TSLA\", \"XOM\" )
MenuM=( "LAST" "ADD" "XHEA" "INIT" "REMOVE" "CLEAN" "REPORTING" "QUIT" )
Pathee="${HOME}/Zsofia/"
Err="${Pathee}DebugMeSo.txt"
PS3="Choose an option:  "
echo -ne "\n\n"
read -p "Press ENTER to continue..."
while true; do
hraf=".Hrafnhildur"
zsofia_prompt
select r in ${MenuM[@]}; do
case $r in
INIT)
  echo "This will install ZSOFIA on your system."
  read -p "Continue? [y/n]: " y
  if [[ $y = 'y' || $y = 'Y' || $y = 'yes' || $y = 'Yes' ]]; then
  read -p "Install Zsofia in $HOME ? [y/n/c]:  " y
  if ! [[ $y = 'y' || $y = 'Y' || $y = 'yes' || $y = 'Yes' ]]; then
  [[ $y != 'n' && $y != 'N' && $y != 'No' ]] && break
  read -p "Enter the installation path:  " Pathee
  ## Potential ERROR here, try to fix the DOUBLE SLASH EVENTUALITY
  Pathee+="/Zsofia/"
  else
  Pathee="${HOME}/Zsofia/"
  fi
  echo "Installation will be done in $Pathee ..."
  sleep 1
  ! [ -d "$Pathee" ] && mkdir -v "$Pathee"
  cd "$Pathee" && echo "Moving into $Pathee ..."
  julia -e "println(\"Hello ${USER}\")"
  ! [ $? ] &&  echo -e "It looks like Julia is not installed.\nPlease install it and required packages before continue.\nSee: www.julialang.org" && break
  sleep 1
  echo "Creating Hrafnhildur..."
  hraf=".Hrafnhildur"
  mkdir -v $hraf
  echo "Creating Bunchies..."
  sleep 1
  for j in ${Bunch[@]}; do
  [[ $j != ${Bunch[-1]} ]] && echo "... making $j ..."
  [[ $j != ${Bunch[-1]} ]] && mkdir ./$hraf/$j
  echo "Success."
  done
  ### HERE, FIND A WAY TO BUILD Csilla.py, Mercedesz.jl, Prelude.jl,  Hludana.jl,
  ### SoelFin.R, SoT_load.R, Unnur.yaml, and Xhea.bash
  ## Unnur.yaml
  echo "Making Unnur.yaml..."
  sleep 1
  touch Unnur.yaml
  echo "## This is the config file of ZSOFIA 0.1.0" > Unnur.yaml
  echo -ne "## Creation date:\t" >> Unnur.yaml
  echo $( date +"%b %d, %Y" ) >> Unnur.yaml
  echo "---" >> Unnur.yaml
  echo "author: Soel Philippe" >> Unnur.yaml
  echo "maintainer: Soel Philippe" >> Unnur.yaml
  echo "e_mail: soelderivatives@skiff.com" >> Unnur.yaml
  echo "copyright: SOEL DERIVATIVES" >> Unnur.yaml
  echo "in_production: true" >> Unnur.yaml
  echo "fred_api_key: 0101010101010101010101010101010101010" >> Unnur.yaml
  echo "fred_api_cols: [\"frequency\", \"frequency_short\", \"id\", \"last_updated\", \"notes\", \"observation_end\", \"observation_start\", \"popularity\", \"realtime_end\", \"realtime_start\", \"seasonal_adjustement\", \"seasonal_adjustment_short\", \"title\", \"units\"]" >> Unnur.yaml
  echo "R_BasePkg: [\"lubridate\", \"tidyverse\", \"tidyquant\"]" >> Unnur.yaml
  echo -ne "Hrafnhildur: [" >> Unnur.yaml
  for j in ${Bunch[@]}; do
  [[ $j != ${Bunch[-1]} ]] && [[ $j != ${Bunch[-2]} ]] && echo -ne "\"$j\", " >> Unnur.yaml
  [[ $j != ${Bunch[-1]} ]] && [[ $j = ${Bunch[-2]} ]] && echo -ne "\"$j\"]\n" >> Unnur.yaml
  done
  echo "description_Hrafnhildur:" >> Unnur.yaml
  for j in `seq 0 $(( ${#Bunch[@]}-2 ))`; do
  echo "  ${Bunch[j]}: \"${BunchD[j]}\"" >> Unnur.yaml
  done
  echo -ne "\n" >> Unnur.yaml
  for j in ${Bunch[@]}; do
  [[ $j = ${Bunch[0]} ]] &&  echo "$j: [${oneD[@]}]" >> Unnur.yaml
  ! [[ $j = ${Bunch[0]} ]] && echo "$j: []" >> Unnur.yaml
  done
  echo "Silk: ${Pathee}$hraf/" >> Unnur.yaml
  echo "CsillaTracker: \"Csilla\"" >> Unnur.yaml
  echo "TirawID: \"MarketTiming\"" >> Unnur.yaml
  echo "DailiesID: \"Dailies\"" >> Unnur.yaml
  echo "Aklass: [\"STK\", \"FUT\", \"IDX\", \"ECN\", \"ETF\", \"FOX\", \"CRY\"]" >> Unnur.yaml
  echo "DefaultFiles:" >> Unnur.yaml
  echo "  - \"Unnur.yaml\"" >> Unnur.yaml
  echo "  - \"Mercedesz.jl\"" >> Unnur.yaml
  echo "  - \"Prelude.jl\"" >> Unnur.yaml
  echo "  - \"Tiraw.jl\"" >> Unnur.yaml
  echo "  - \"Hludana.jl\"" >> Unnur.yaml
  echo "  - \"Csilla.py\"" >> Unnur.yaml
  echo "  - \"SoT_load.R\"" >> Unnur.yaml
  echo "  - \"flush.R\"" >> Unnur.yaml
  echo "ErrorFile: \"${Pathee}DebugMeSo.txt\"" >> Unnur.yaml
  echo "ThaStocks: [${oneD[@]}]" >> Unnur.yaml
  echo 'Unnur.yaml has been generated!'
  sleep 1
  ## Csilla.py
  echo "Making Csilla.py..."
  sleep 1
  touch Csilla.py
  echo "## This is the new Dundee, by SOEL DERIVATIVES" > Csilla.py
  echo -ne "import os\nimport sys\n" >> Csilla.py
  echo "try:\n  import yaml\nexcept:\n  os.system(\"pip install yaml\")\n  import yaml" >> Csilla.py
  echo "try:\n  import numpy as np\nexcept:\n  os.system(\"pip install numpy\")\n  import numpy as np" >> Csilla.py
  echo "try:\n  import pandas as pd\nexcept:\n  os.system(\"pip install pandas\")\n  import pandas as pd" >> Csilla.py
  echo "try:\n  import yfinance as yf\nexcept:\n  os.system(\"pip install yfinance\")\n  import yfinance as yf" >> Csilla.py
  echo "try:\n  import math\nexcept:\n  os.system(\"pip install math\")\n  import math" >> Csilla.py
  echo "try:\n  import time\nexcept:\n  os.system(\"pip install time\")\n  import time" >> Csilla.py
  echo "try:\n  from datetime import datetime as dttm\nexcept:\n  os.system(\"pip install datetime\")\n  from datetime import datetime as dttm" >> Csilla.py
  echo "from datetime import timedelta" >> Csilla.py
  echo "try:\n  import multiprocessing as mp\nexcept:\n  os.system(\"pip install multiprocessing\")\n  import multiprocessing as mp" >> Csilla.py
  echo "tee0 = time.time()" >> Csilla.py
  echo "dailyMe = dict()" >> Csilla.py
  echo "ThoriMe = dict()" >> Csilla.py
  echo "SveaFix = dict()" >> Csilla.py
  echo "SveaFix.update({'Artemis':(lambda x: x)})" >> Csilla.py
  echo "SveaFix.update({'Demeter':(lambda x: x+\"=F\")})" >> Csilla.py
  echo "SveaFix.update({'Euterpe':(lambda x: \"^\"+x)})" >> Csilla.py
  echo "SveaFix.update({'Mercure':(lambda x: x)})" >> Csilla.py
  echo "SveaFix.update({'Nemesis':(lambda x: x+\"=F\")})" >> Csilla.py
  echo "SveaFix.update({'Ophelya':(lambda x: x)})" >> Csilla.py
  echo "SveaFix.update({'Origami':(lambda x: x)})" >> Csilla.py
  echo "SveaFix.update({'Phorcys':(lambda x: x+\"=X\")})" >> Csilla.py
  echo "SveaFix.update({'Satoshi':(lambda x: x+\"-USD\")})" >> Csilla.py
  echo -ne "with open('Unnur.yaml') as _:\n  Unnur=yaml.safe_load(_)" >> Csilla.py
  echo "Err = Unnur.get('ErrorFile')" >> Csilla.py
  echo "Silk = Unnur.get('Silk')" >> Csilla.py
  echo "Bunch = Unnur.get('Hrafnhildur')" >> Csilla.py
  echo "dailyID = Unnur.get('DailiesID')" >> Csilla.py
  echo "if len(sys.argv) < 3:" >> Csilla.py
  echo '  print("Too few arguments provided!\nThe script requires exactly three arguments!")' >> Csilla.py
  echo '  raise Exception("Damn, something gone wrong!")' >> Csilla.py
  echo "else:" >> Csilla.py
  echo "  Csi = sys.argv[1]" >> Csilla.py
  echo "if Csi not in Bunch:" >> Csilla.py
  echo '  raise Exception(f"Something gone wrong, you entered something crazy.\n Non valid fourth argument in {Bunch}")' >> Csilla.py
  echo "for j in Bunch:" >> Csilla.py
  echo '  dailyMe.update({j: j[0:3].upper()})' >> Csilla.py
  echo "ThoriMe.update({ ${Bunch[0]}: \"ThaStocks\"})" >> Csilla.py
  echo "for j in Bunch:" >> Csilla.py
  echo "  if j not in [\"${Bunch[0]}\"]:" >> Csilla.py
  echo "    ThoriMe.update({j:j})" >> Csilla.py
  echo "_1, _2 = dttm.strptime(sys.argv[2], \"%Y-%m-%d\").date(), dttm.strptime(sys.argv[2], \"%Y-%m-%d\").date() + timedelta(1)" >> Csilla.py
  echo "_1, _2 = ''.join(str(_1).split(' ')), ''.join(str(_2).split(' '))" >> Csilla.py
  echo "pathee = Silk+Csi+\"/Csilla-\"+_1+\"/\"" >> Csilla.py
  echo "def ErrMe(msg, Err=\"DebugMeSo.txt\"):" >> Csilla.py
  echo "  with open(Err, 'a') as _:" >> Csilla.py
  echo "    _.write(str(dttm.now())+' :: '+msg+\"\n\")" >> Csilla.py
  echo "def Svea(x):" >> Csilla.py
  echo "  try:" >> Csilla.py
  echo "    print(f\"In CSILL of {Csi}, gettin \", x, \"...\")" >> Csilla.py
  echo "    __ = yf.download(tickers=SveaFix.get(Csi)(x), start = _1, end = _2, interval = '1m', threads=False, ignore_tz=True)" >> Csilla.py
  echo "    if len(__) < 3:" >> Csilla.py
  echo '      raise Exception("This shit been in trouble!")' >> Csilla.py
  echo "    else:" >> Csilla.py
  echo "      __.to_csv(pathee+x+\".csv\")" >> Csilla.py
  echo "      return x" >> Csilla.py
  echo "  except Exception as err:" >> Csilla.py
  echo '    ErrMe(f"In CSILLA of {Csi}, prollems with {x}.\nError candidates are:\n {str(err)}", Err)' >> Csilla.py
  echo "X=Unnur.get(ThoriMe.get(Csi))" >> Csilla.py
  echo "CsillaT=Unnur.get('CsillaTracer')" >> Csilla.py
  echo "print(\"<<<< STARTING CSILLA of {Csi} >>>>\n    powered by SOEL DERIVATIVES\")" >> Csilla.py
  echo "print(f\"In CSILLA of {Csi}, TRADING SESSION: {_1}\")" >> Csilla.py
  echo "ErrMe(f\"<<<< STARTING CSILLA of {Csi} >>>>\", Err)" >> Csilla.py
  echo "ErrMe(f\"In Csilla of {Csi}, BEGIN Trading Session: {_1}\", Err)" >> Csilla.py
  echo "os.system(f\"mkdir {pathee}\")" >> Csilla.py
  echo "if __name__ == '__main__':" >> Csilla.py
  echo "  ______ = mp.Pool(4)" >> Csilla.py
  echo "  gretta = ______.map(Svea, X)" >> Csilla.py
  echo "with open(Silk+Csi+\"/\"+dailyID+\"/\"+CsillaT+dailyMe[Csi]+\".txt\", 'a') as xi:" >> Csilla.py
  echo "  xi.write(str(dttm.now().date())+\": \")" >> Csilla.py
  echo "  n=len(gretta)" >> Csilla.py
  echo "  for j in range(0, n)" >> Csilla.py
  echo "    xi.gretta(gretta[j]) if j == n-1 else xi.write(gretta[j]+', ')" >> Csilla.py
  echo "  xi.write(\"\n\")" >> Csilla.py
  echo "print(\"Copying Hludana...\")" >> Csilla.py
  echo "os.system(f\"cp Hludana.jl {pathee}\")" >> Csilla.py
  echo "os.system(f\"cp Prelude.jl {pathee}\")" >> Csilla.py
  echo "os.system(f\"cp Unnur.yam {pathee}\")" >> Csilla.py
  echo "tee1 = time.time()" >> Csilla.py
  echo 'print(f"\nTime elapsed: {tee1-tee0} seconds!\nCsilla, powered by SOEL DERIVATIVES")' >> Csilla.py
  echo "os.chdir(pathee)" >> Csilla.py
  echo "os.system(f\"julia Hludana.jl {Csi}\")" >> Csilla.py
  echo "os.chdir(\"${Pathee}\")" >> Csilla.py
  echo "print(f\"Author: {__author__}\")" >> Csilla.py
  echo "print(f\"Maintainer: {__maintainer__}\")" >> Csilla.py
  echo "print(f\"e-mail: {__email__}\")" >> Csilla.py
  echo "ErrMe(f\"<<<< ENDING CSILLA of {Csi} >>>>\", Err)" >> Csilla.py
  echo 'Csilla.py has been generated!'
  sleep 1
  ## Making Xhea.bash or Xhea.sh
  echo "Making XHEA..."
  sleep 1
  touch Xhea.sh
  echo "echo \"\\n\\t XHEA, powered by SOEL DERIVATIVES\\n\"" > Xhea.sh
  echo "read -p \"Press any key to continue...\"" >> Xhea.sh
  echo "[[ \"\$#\" -ne 1 ]] && echo \"\n************\n** ARGC ERROR, exiting...**\n************\n\" && sleep 2 && exit 1" >> Xhea.sh
  echo "Bunch=( ${Bunch[@]:0:$(( ${#Bunch[@]} - 1 )) } )" >> Xhea.sh
  echo "Rscript Umercure.R &" >> Xhea.sh
  echo "echo \"------\n Beginning of Xhea :: \$1 \n------\n\" >> $Err" >> Xhea.sh
  echo "for j in \$\{Bunch[@]\}; do" >> Xhea.sh
  echo "python3 Csilla.py \$j \$1 &" >> Xhea.sh
  echo "done" >> Xhea.sh
  echo "for j in \${Bunch[@]}; do" >> Xhea.sh
  echo "julia Mercedesz.jl \$j" >> Xhea.sh
  echo "done" >> Xhea.sh
  echo 'Xhea.sh has been generated!'
  sleep 1
  ## Making Mercedesz.jl
  echo "Making MERCEDESZ..."
  sleep 1
  touch Mercedesz.jl
  echo "include(\"Prelude.jl\")" > Mercedesz.jl
  echo "tBg = Dates.now()" >> Mercedesz.jl
  echo "using Dates, DataFrames, MarketData, CSV, YAML, Statistics" >> Mercedesz.jl
  echo "vEEE = Vector{String}(undef, 0)" >> Mercedesz.jl
  echo "Err = YAML.load_file(\"Unnur.yaml\")[\"ErrorFile\"]" >> Mercedesz.jl
  echo "Bunch = YAML.load_file(\"Unnuer.yaml.\")[\"ErrorFile\"]" >> Mercedesz.jl
  echo "KlassMe = Dict(\"Artemis\" => \"STK\"," >> Mercedesz.jl
  echo "                \"Demeter\" => \"FUT\"," >> Mercedesz.jl
  echo "                \"Euterpe\" => \"IDX\"," >> Mercedesz.jl
  echo "                \"Mercure\" => \"ECN\"," >> Mercedesz.jl
  echo "                \"Nemesis\" => \"FUT\"," >> Mercedesz.jl
  echo "                \"Ophelya\" => \"STK\"," >> Mercedesz.jl
  echo "                \"Origami\" => \"STK\"," >> Mercedesz.jl
  echo "                \"Phorcys\" => \"FOX\"," >> Mercedesz.jl
  echo "                \"Satoshi\" => \"CRY\")" >> Mercedesz.jl
  echo "printstyled(\"#\"^50, \"\n#\", \" \"^5, \"MERCEDESZ, powered by SOEL DERIVATIVES\"*\" \"^4*\"#\n\", \"#\"^50, \"\n\", color=:yellow, bold=true)" >> Mercedesz.jl
  echo "println(\"Drink coffee...\")" >> Mercedesz.jl
  echo "println(\"Some sips of coffee...\n\")" >> Mercedesz.jl
  echo "a = \"-\"" >> Mercedesz.jl
  echo 'if !isempty(ARGS)' >> Mercedesz.jl
  echo "  a = ARGS[1]" >> Mercedesz.jl
  echo '  if !(a in Bunch)' >> Mercedesz.jl
  echo "    @error \"Arg should be one of \$Bunch \"" >> Mercedesz.jl
  echo "  end" >> Mercedesz.jl
  echo "  println(\"\$a will be read from Unnur.yaml\n\")" >> Mercedesz.jl
  echo "else" >> Mercedesz.jl
  echo "if a in [\"Mercure\"]" >> Mercedesz.jl
  echo '  @error "Mercure is not allowed here!"' >> Mercedesz.jl
  echo "end" >> Mercedesz.jl
  echo "println(\"<<<< STARTING: MERCEDESZ of \$a >>>>\")" >> Mercedesz.jl
  echo "ErrorTracker(\"<<<< STARTING: MERCEDESZ of \$a >>>>\"; Err)" >> Mercedesz.jl
  echo "X = YAML.load_file(\"Unnur.yaml\")[a]" >> Mercedesz.jl
  echo 'println("In MERCEDESZ of $a, Unnuring...: success!"; Err)' >> Mercedesz.jl
  echo "x = Vector{Instrument}(undef, 0)" >> Mercedesz.jl
  echo "t_ = Dates.now()" >> Mercedesz.jl
  echo "println(\"In MERCEDESZ of \$a, structuring a container...\")" >> Mercedesz.jl
  echo "for j in X" >> Mercedesz.jl
  echo '  push!(x, Instrument(a, j, KlassMe[a]))' >> Mercedesz.jl
  echo "end" >> Mercedesz.jl
  echo "t_ = Dates.now() - t_" >> Mercedesz.jl
  echo "println(\"In MERCEDESZ of \$a; structuration ended.\nTime elapsed: \$t_\")" >> Mercedesz.jl
  echo "printstyled(\"<<<< In MERCEDES, beginning update of \$a >>>>\n\", bold=true, color=:yellow)" >> Mercedesz.jl
  echo "ErrorTracker(\"<<<< STARTING MERCEDESZ of \$a >>>>\"; Err)" >> Mercedesz.jl
  echo "xyz = DataFrame()" >> Mercedesz.jl
  echo "for j in x" >> Mercedesz.jl
  echo "  try" >> Mercedesz.jl
  echo "    printstyled(\"In MERCEDESZ, working on \$(j.Ticker) | \$(j.Folder)...\n\", bold=true, color=:orange)" >> Mercedesz.jl
  echo "    Illiad(j; Err)" >> Mercedesz.jl
  echo '    printstyled("Done for $(j.Ticker) !\n", bold=true, color=:blue)' >> Mercedesz.jl
  echo "  catch err" >> Mercedesz.jl
  echo "    printstyled(\"In MERCEDESZ of \$a, something gone wrong with \$(j.Ticker) :\n\", color = :red, bold = true)" >> Mercedesz.jl
  echo "    println(string(err))" >> Mercedesz.jl
  echo "    ErrorTracker(\"In MERCEDESZ of \$a, something fone wrong with \$(j.Ticker)\"; Err)" >> Mercedesz.jl
  echo "    ErrorTracker(string(err); Err)" >> Mercedesz.jl
  echo '    push!(vEEE, j.Ticker)' >> Mercedesz.jl
  echo "  end" >> Mercedesz.jl
  echo "end" >> Mercedesz.jl
  echo 'if !isempty(vEEE)' >> Mercedesz.jl
  echo "  ErrorTracker(\"--- In MERCEDESZ of \$a, prollems with ---:\"; Err)" >> Mercedesz.jl
  echo "  open(Err, \"a\") do io" >> Mercedesz.jl
  echo "    write(io, \"DebugMe-*string(Date(Dates.now()))*\":\")" >> Mercedesz.jl
  echo "    for j in vEEE" >> Mercedesz.jl
  echo "      write(io, j*\" \")" >> Mercedesz.jl
  echo "    end" >> Mercedesz.jl
  echo "    write(io, \"\n\")" >> Mercedesz.jl
  echo "  end" >> Mercedesz.jl
  echo "  ErrorTracker(\"-è- In MERCEDESZ of \$a, EoR. ----\"; Err)" >> Mercedesz.jl
  echo "end" >> Mercedesz.jl
  echo "tBg = round(Dates.now() - tBg, Second)" >> Mercedesz.jl
  echo "ErrorTracker(\"<< END: MERCEDESZ of \$a, Time Elapsed: \$tBg >> \"; Err)" >> Mercedesz.jl
  echo "printstyled(\"<<< END OF MERCEDESZ of \$a, Time elapsed: \$tBg >>>\n\", bold=true, color=:orange)" >> Mercedesz.jl
  echo 'Mercedesz.jl has been generated!'
  sleep 1
  ### MAKING SoelFin.R
  echo "Making SoelFin.R..."
  sleep 1
  touch SoelFin.R
  echo ".__author__ <- yaml::read_yaml(\"Unnur.yaml\")\$author" > SoelFin.R
  echo ".__maintainer__ <- yaml::read_yaml(\"Unnur.yaml\")\$maintainer" >> SoelFin.R
  echo ".__email__ <- yaml::read_yaml(\"Unnur.yaml\")\$e_mail" >> SoelFin.R
  echo ".__copyright__ <- yaml::read_yaml(\"Unnur.yaml\")\$copyright" >> SoelFin.R
  echo ".__status__ <- yaml::read_yaml(\"Unnur.yaml\")\$in_production" >> SoelFin.R
  echo "if(.__status__)" >> SoelFin.R
  echo "  .__status__ <- \"in production\"" >> SoelFin.R
  echo "# ---- Casual Packages & Globals-------------" >> SoelFin.R
  echo "Sys.setenv(LANG = \"en\")" >> SoelFin.R
  echo "pkg_used = yaml::read_yaml(\"Unnur.yaml\")\$R_pkg_uzd" >> SoelFin.R
  echo "fredAPIkey <- yaml::read_yaml(\"Unnur.yaml\")\$fred_api_key" >> SoelFin.R
  echo "for (k in pkg_used) {" >> SoelFin.R
  echo "  require(k, character.only = TRUE)" >> SoelFin.R
  echo "}" >> SoelFin.R
  echo "mSoel <- list()" >> SoelFin.R
  echo "mSoel\$Klass <- function(v) {" >> SoelFin.R
  echo "vv <- c(\"Artemis\"," >> SoelFin.R
  echo "	\"Demeter\"," >> SoelFin.R
  echo "	\"Euterpe\"," >> SoelFin.R
  echo "	\"Mercure\"," >> SoelFin.R
  echo "	\"Nemesis\"," >> SoelFin.R
  echo "	\"Origami\"," >> SoelFin.R
  echo "	\"Phorcys\"," >> SoelFin.R
  echo "	\"Satoshi\")" >> SoelFin.R
  echo "vvv <- c(\"STK\"," >> SoelFin.R
  echo "	 \"FUT\"," >> SoelFin.R
  echo "         \"IDX\"," >> SoelFin.R
  echo "  	 \"ECN\"," >> SoelFin.R
  echo "  	 \"FUT\"," >> SoelFin.R
  echo "	 \"STK\"," >> SoelFin.R
  echo "         \"FOX\"," >> SoelFin.R
  echo "         \"CRY\")" >> SoelFin.R
  echo "vvvv <- vvv[match(v, vv)]" >> SoelFin.R
  echo "  return(vvvv)" >> SoelFin.R
  echo "}" >> SoelFin.R
  echo "mSoel\$YaQ <- function(instruments) {" >> SoelFin.R
  echo "  i <- instruments" >> SoelFin.R
  echo "  i <- if_else(names(i) == \"FUT\", str_c(i, \"F\", sep = \"=\")," >> SoelFin.R
  echo "             if_else(names(i) == \"FOX\", str_c(i, \"=X\", sep = \"\")," >> SoelFin.R
  echo "             if_else(names(i) == \"IDX\", str_c(\"^\", i, sep = \"\")," >> SoelFin.R
  echo "             if_else(names(i) == \"CRY\", str_c(i, \"USD\", sep = \"-\"), i))))" >> SoelFin.R
  echo "  if(is.element(\"JPYUSD=X\", i))" >> SoelFin.R
  echo "  {" >> SoelFin.R
  echo "    i[which(i == \"JPYUSD=X\")] <- \"JPY=X\"" >> SoelFin.R
  echo "  }" >> SoelFin.R
  echo "  return(i)" >> SoelFin.R
  echo "}" >> SoelFin.R
  echo '## This GetD function needs tidyverse + tidyquant packages to run!' >> SoelFin.R
  echo "## This function takes named instruments' Tckrs: a vector name specifying asset.class" >> SoelFin.R
  echo "## asset.class values: FUT, FOX, IDX, STK, ECN, CRY" >> SoelFin.R
  echo "mSoel\$GetD <- function(instruments," >> SoelFin.R
  echo "                       from = \"2010-01-01\"," >> SoelFin.R
  echo "                       to = today()," >> SoelFin.R
  echo "                       API_key = yaml::read_yaml(\"Unnur.yaml\")\$fred_api_key," >> SoelFin.R
  echo "                       ...) {" >> SoelFin.R
  echo "leu = NULL" >> SoelFin.R
  echo "eHnd <- NULL" >> SoelFin.R
  echo "XYZ <- tibble()" >> SoelFin.R
  echo "i <- mSoel\$YaQ(instruments)" >> SoelFin.R
  echo "message(paste0(\"PRELUDE...\", now(), sep = \" \"))" >> SoelFin.R
  echo "tryCatch(expr = {" >> SoelFin.R
  echo "  if(is.null(attr(instruments, \"names\")))" >> SoelFin.R
  echo "  {" >> SoelFin.R
  echo "    message(\"ARGUMENTS ARE NOT NAMED in GetD\")" >> SoelFin.R
  echo '    stop("ARGS `instruments` should be named!")' >> SoelFin.R
  echo "  }" >> SoelFin.R
  echo "  else {" >> SoelFin.R
  echo "    names(i) <- names(instruments)" >> SoelFin.R
  echo "   leu <- length(unique(names(i)))" >> SoelFin.R
  echo "    if(leu >= 2) {" >> SoelFin.R
  echo "      message(\"PROBLEM WITH NAME: UNIQUENESS in GetD\")" >> SoelFin.R
  echo "      stop(\"Retrieval of several asset class types is not allowed.\")" >> SoelFin.R
  echo "    }" >> SoelFin.R
  echo '    if(!unique(is.element(names(i),' >> SoelFin.R
  echo "                          c(\"CRY\",\"ECN\", \"FOX\",\"FUT\", \"IDX\", \"STK\")))) {" >> SoelFin.R
  echo '      message("NAMES ARE NOT UNDER THE SOELIAN PARADIGM!")' >> SoelFin.R
  echo '      stop("ARGS `instruments` should be one' >> SoelFin.R
  echo "           of CRY, ECN, FOX, FUT, IDX, STK\")" >> SoelFin.R
  echo "    }" >> SoelFin.R
  echo "  }" >> SoelFin.R
  echo "}," >> SoelFin.R
  echo "error = function(e) {" >> SoelFin.R
  echo "  eHnd <<- e" >> SoelFin.R
  echo '  message("AN ERROR OCCURED!")' >> SoelFin.R
  echo '  print("eHnd----------> ")' >> SoelFin.R
  echo "  print(eHnd)" >> SoelFin.R
  echo '  message("Cannot continue, provide proper ARGS!")' >> SoelFin.R
  echo "}," >> SoelFin.R
  echo "finally = {" >> SoelFin.R
  echo '  if(is.null(eHnd))' >> SoelFin.R
  echo '    rm(eHnd, leu)' >> SoelFin.R
  echo "  else" >> SoelFin.R
  echo '    stop("Some shit did happen!\n Bye, Bye!")' >> SoelFin.R
  echo '})' >> SoelFin.R
  echo 'asset.class <- names(i) |> unique()' >> SoelFin.R
  echo 'print(str_c("Asset Class:", asset.class, sep = " "))' >> SoelFin.R
  echo 'conn <- if_else(names(i) %in% c("FUT",' >> SoelFin.R
  echo '                                "FOX",' >> SoelFin.R
  echo '                                "IDX",' >> SoelFin.R
  echo '                                "STK",' >> SoelFin.R
  echo '                               "CRY"),' >> SoelFin.R
  echo '                       "stock.prices",' >> SoelFin.R
  echo '       if_else(names(i) %in% c("ECN"),' >> SoelFin.R
  echo '                      "economic.data",' >> SoelFin.R
  echo '                               names(i))) |> unique()' >> SoelFin.R
  echo 'print(str_c("Getting:", conn, sep = " "))' >> SoelFin.R
  echo 'attributes(i) <- NULL' >> SoelFin.R
  echo 'message("PRELUDE SUCCEED!")' >> SoelFin.R
  echo 'message("RETRIEVAL IS ABOUT TO BEGIN...")' >> SoelFin.R
  echo 'XYZ <- tq_get(i, get = conn, from = from, to = to, ...)' >> SoelFin.R
  echo 'if(length(XYZ) < 3)' >> SoelFin.R
  echo '  stop("TOO FEW COLUMNS or BAD CONNECTION, try to TRACEBACK!")' >> SoelFin.R
  echo 'if(asset.class %in% c("FUT", "IDX", "STK", "CRY")) {' >> SoelFin.R
  echo '  print(asset.class)' >> SoelFin.R
  echo '  message("RENAMING AND SOELIANIZING DATA...")' >> SoelFin.R
  echo '  XYZ <- XYZ |> rename(Tckr = symbol, Date = date, Open = open, High = high)' >> SoelFin.R
  echo '  XYZ <- XYZ |> rename(Low = low, Price = close, Vol = volume)' >> SoelFin.R
  echo '  XYZ <- XYZ |> select(Date, Price, Open, High, Low, Vol, Tckr)' >> SoelFin.R
  echo '  XYZ <- XYZ |> group_by(Tckr)' >> SoelFin.R
  echo '  XYZ <- XYZ |> distinct(Date, .keep_all = TRUE)' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '         mutate(Co = 100*((Price/Open)-1)) |>' >> SoelFin.R
  echo '         mutate(Hl = 100*((High/Low)-1)) |>' >> SoelFin.R
  echo '         mutate(Ind = 100*if_else(Hl == 0, 0, 1 - (abs(Co)/Hl))) |>' >> SoelFin.R
  echo '         mutate(Rvn = 100*RETURN(Price, fill_na = 0)) |>' >> SoelFin.R
  echo '         mutate(Gap = 100*na.fill((Open/lag(Price))-1, fill = 0)) |>' >> SoelFin.R
  echo '         mutate(Gaug = 100*if_else(High == Low, 1, (Price-Low)/(High-Low))) |>' >> SoelFin.R
  echo '         mutate(rVol = 100*RETURN(Vol, fill_na = 0)) |>' >> SoelFin.R
  echo '         mutate(rVol = if_else(is.infinite(rVol), 0, rVol))' >> SoelFin.R
  echo '  XYZ <- XYZ |> select(Date,' >> SoelFin.R
  echo '                       Price,' >> SoelFin.R
  echo '                       Open,' >> SoelFin.R
  echo '                       High,' >> SoelFin.R
  echo '                       Low,' >> SoelFin.R
  echo '                       Vol,' >> SoelFin.R
  echo '                       rVol,' >> SoelFin.R
  echo '                       Co,' >> SoelFin.R
  echo '                       Hl,' >> SoelFin.R
  echo '                       Ind,' >> SoelFin.R
  echo '                       Rvn,' >> SoelFin.R
  echo '                       Gap,' >> SoelFin.R
  echo '                       Gaug,' >> SoelFin.R
  echo '                       Tckr)' >> SoelFin.R
  echo "}" >> SoelFin.R
  echo 'if(asset.class %in% c("FOX")) {' >> SoelFin.R
  echo '  message("RENAMING AND SOELIANIZING DATA...")' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    rename(Tckr = symbol,' >> SoelFin.R
  echo '           Date = date,' >> SoelFin.R
  echo '           Open = open,' >> SoelFin.R
  echo '           High = high,' >> SoelFin.R
  echo '           Low = low,' >> SoelFin.R
  echo '           Price = close)' >> SoelFin.R
  echo '  XYZ <- XYZ |> select(Date, Price, Open, High, Low, Tckr)' >> SoelFin.R
  echo '  XYZ <- XYZ |> group_by(Tckr)' >> SoelFin.R
  echo '  XYZ <- XYZ |> distinct(Date, .keep_all = TRUE)' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    mutate(Co = 100*((Price/Open)-1)) |>' >> SoelFin.R
  echo '    mutate(Hl = 100*((High/Low)-1)) |>' >> SoelFin.R
  echo '    mutate(Ind = 100*if_else(Hl == 0, 0, 1 - (abs(Co)/Hl))) |>' >> SoelFin.R
  echo '    mutate(Rvn = 100*RETURN(Price, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(Gap = 100*na.fill((Open/lag(Price))-1, fill = 0)) |>' >> SoelFin.R
  echo '    mutate(Gaug = 100*if_else(High == Low, 1, (Price-Low)/(High-Low)))' >> SoelFin.R
  echo '  XYZ <- XYZ |> select(Date,' >> SoelFin.R
  echo '                       Price,' >> SoelFin.R
  echo '                       Open,' >> SoelFin.R
  echo '                       High,' >> SoelFin.R
  echo '                       Low,' >> SoelFin.R
  echo '                       Co,' >> SoelFin.R
  echo '                       Hl,' >> SoelFin.R
  echo '                       Ind,' >> SoelFin.R
  echo '                       Rvn,' >> SoelFin.R
  echo '                       Gap,' >> SoelFin.R
  echo '                       Gaug,' >> SoelFin.R
  echo '                       Tckr)' >> SoelFin.R
  echo "}" >> SoelFin.R
  echo 'if(asset.class %in% c("ECN")) {' >> SoelFin.R
  echo '  writeLines(asset.class)' >> SoelFin.R
  echo '  message("ECONOMICS DATA SOELIANIZING...")' >> SoelFin.R
  echo '  XYZ <- XYZ |> rename(Tckr = symbol,' >> SoelFin.R
  echo '                       Date = date,' >> SoelFin.R
  echo '                       Price = price)' >> SoelFin.R
  echo '  XYZ <- XYZ |> select(Date,' >> SoelFin.R
  echo '                       Price,' >> SoelFin.R
  echo '                       Tckr)' >> SoelFin.R
  echo '  XYZ <- XYZ |> filter(!is.na(Price))' >> SoelFin.R
  echo '  XYZ <- XYZ |> group_by(Tckr)' >> SoelFin.R
  echo '  XYZ <- XYZ |> distinct(Date, .keep_all = TRUE)' >> SoelFin.R
  echo '  vEEL <- XYZ$Tckr |> unique()' >> SoelFin.R
  echo '  tb <- tibble(Id = character(),' >> SoelFin.R
  echo '               Title = character(),' >> SoelFin.R
  echo '               Freq = character(),' >> SoelFin.R
  echo '               Units = character(),' >> SoelFin.R
  echo '                Adjustment = character(),' >> SoelFin.R
  echo '               LastUpdt = character(),' >> SoelFin.R
  echo '               Popularity = numeric(),' >> SoelFin.R
  echo '               Since = character(),' >> SoelFin.R
  echo '               Notes = character(),' >> SoelFin.R
  echo '               Tckr = character())' >> SoelFin.R
  echo '  tb_ <- NULL' >> SoelFin.R
  echo '  Ooo <- c("id",' >> SoelFin.R
  echo '           "title",' >> SoelFin.R
  echo '           "frequency_short",' >> SoelFin.R
  echo '           "units_short",' >> SoelFin.R
  echo '           "seasonal_adjustment_short",' >> SoelFin.R
  echo '           "last_updated\",' >> SoelFin.R
  echo '           "popularity",' >> SoelFin.R
  echo '           "observation_start",' >> SoelFin.R
  echo '           "notes",' >> SoelFin.R
  echo '           "Tckr")' >> SoelFin.R
  echo '  Ooo <- Ooo |> \`names<-\`(c(\"Id\",' >> SoelFin.R
  echo "                            \"Title\"," >> SoelFin.R
  echo "                            \"Freq\"," >> SoelFin.R
  echo "                            \"Units\"," >> SoelFin.R
  echo "                            \"Adjustment\"," >> SoelFin.R
  echo "                            \"LastUpdt\"," >> SoelFin.R
  echo "                            \"Popularity\"," >> SoelFin.R
  echo "                            \"Since\"," >> SoelFin.R
  echo "                            \"Notes\"," >> SoelFin.R
  echo '                            "Tckr"))' >> SoelFin.R
  echo '  for(j in vEEL) {' >> SoelFin.R
  echo '    message("Treating ", j)' >> SoelFin.R
  echo '   tb_ <- paste0("https://api.stlouisfed.org/fred/series?series_id=",' >> SoelFin.R
  echo '                  j,' >> SoelFin.R
  echo '                  "&api_key=",' >> SoelFin.R
  echo '                  API_key,' >> SoelFin.R
  echo '                  "&file_type=json")' >> SoelFin.R
  echo '    tb_ <- httr::GET(url = tb_) |>' >> SoelFin.R
  echo '      httr::content(as="text") |> ' >> SoelFin.R
  echo '      jsonlite::fromJSON()' >> SoelFin.R
  echo '    tb_ <- tb_$seriess |> as_tibble()' >> SoelFin.R
  echo '    tb_ <- tb_ |>' >> SoelFin.R
  echo '      slice_tail() |>' >> SoelFin.R
  echo '      mutate(Tckr = j)' >> SoelFin.R
  echo '    Ooo <- Ooo[Ooo %in% names(tb_)]' >> SoelFin.R
  echo '    tb_ <- tb_ |>' >> SoelFin.R
  echo '      select(all_of(Ooo)) |>' >> SoelFin.R
  echo '      \`names<-\`(names(Ooo))' >> SoelFin.R
  echo '    tb <- tb |> full_join(tb_)' >> SoelFin.R
  echo '  }' >> SoelFin.R
  echo '  message("meta-Informations securely retrieved and Soelianized!")' >> SoelFin.R
  echo '  message("Phazing... and Structuring...:::Economics")' >> SoelFin.R
  echo '  XYZ <- XYZ |> full_join(tb |> group_by(Tckr))' >> SoelFin.R
  echo '  XYZ <- XYZ |> mutate(Rvn = 100*RETURN(Price, fill_na = 0))' >> SoelFin.R
  echo '  XYZ <- XYZ |> select(Date,' >> SoelFin.R
  echo '                       Price,' >> SoelFin.R
  echo '                       Rvn,' >> SoelFin.R
  echo '                       Title,' >> SoelFin.R
  echo '                       Freq,' >> SoelFin.R
  echo '                       Units,' >> SoelFin.R
  echo '                       Adjustment,' >> SoelFin.R
  echo '                       LastUpdt,' >> SoelFin.R
  echo '                       Popularity,' >> SoelFin.R
  echo '                       Since,' >> SoelFin.R
  echo '                       Notes,' >> SoelFin.R
  echo '                       Tckr)' >> SoelFin.R
  echo '  message("END OF ECONOMICS, EO ECN-SOELIANIZING!")' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class == "FUT") {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    mutate(Tckr = str_sub(Tckr, 1, nchar(Tckr)-2))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class == "FOX") {' >> SoelFin.R
  echo '  XYZ <- XYZ |> mutate(Tckr = str_sub(Tckr, 1, 3))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class == "IDX") {' >> SoelFin.R
  echo '  XYZ <- XYZ |> mutate(Tckr = str_sub(Tckr, 2, nchar(Tckr)))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class == "CRY") {' >> SoelFin.R
  echo '  XYZ <- XYZ |> mutate(Tckr = str_sub(Tckr, 1, nchar(Tckr)-4))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'XYZ <- ungroup(XYZ)' >> SoelFin.R
  echo 'return(XYZ)' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo '## This function adds a new Soelian-based structured tibble.' >> SoelFin.R
  echo 'mSoel$AddS <- function(tb_to_up,' >> SoelFin.R
  echo '                     instruments,' >> SoelFin.R
  echo '                     from = "2010-01-01",' >> SoelFin.R
  echo '                     to = today(),' >> SoelFin.R
  echo '                     ...) {' >> SoelFin.R
  echo 'XYZ <- mSoel$GetD(instruments,' >> SoelFin.R
  echo '                  from = from,' >> SoelFin.R
  echo '                  to = to,' >> SoelFin.R
  echo '                  verbose = TRUE,' >> SoelFin.R
  echo '                  ...)' >> SoelFin.R
  echo 'XYZ <- full_join(tb_to_up, XYZ)' >> SoelFin.R
  echo 'XYZ <- XYZ |>' >> SoelFin.R
  echo '  group_by(Tckr) |>' >> SoelFin.R
  echo '  arrange(Date, .by_group = TRUE) |>' >> SoelFin.R
  echo '  ungroup()' >> SoelFin.R
  echo 'return(XYZ)' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'mSoel$UpdS <- function(tb_to_up,' >> SoelFin.R
  echo '                     asset.class,' >> SoelFin.R
  echo '                     ...) {' >> SoelFin.R
  echo 'XYZ <- tb_to_up' >> SoelFin.R
  echo 'i <- XYZ |>' >> SoelFin.R
  echo '  select(Tckr) |>' >> SoelFin.R
  echo '  as_vector() |>' >> SoelFin.R
  echo '  unique() |>' >> SoelFin.R
  echo '  as.character()' >> SoelFin.R
  echo '  XYZ <- XYZ |> group_by(Tckr)' >> SoelFin.R
  echo 'from <- XYZ |>' >> SoelFin.R
  echo '  slice_tail() |>' >> SoelFin.R
  echo '  mutate(Date = Date+1) |>' >> SoelFin.R
  echo '  select(Date) |>' >> SoelFin.R
  echo '  ungroup()' >> SoelFin.R
  echo 'from <- from |>' >> SoelFin.R
  echo '  select(Date) |>' >> SoelFin.R
  echo '  as_vector() |>' >> SoelFin.R
  echo '  as_date()' >> SoelFin.R
  echo 'to <- today()' >> SoelFin.R
  echo 'if(any(from > to))' >> SoelFin.R
  echo '  stop("Date Ranges Non-Adequation ::: NotherTheDomain")' >> SoelFin.R
  echo 'message(paste0("Date Adequation Test: PASSED -- ", now()))' >> SoelFin.R
  echo 'from = from |> min()' >> SoelFin.R
  echo 'message(paste0("From: ", as.character(from)))' >> SoelFin.R
  echo 'message(paste0("To: ", as.character(to)))' >> SoelFin.R
  echo '  names(i) <- rep(asset.class, length(i))' >> SoelFin.R
  echo '### THE REAL LINE' >> SoelFin.R
  echo 'XYZn <- mSoel$GetD(i, from, to, ...)' >> SoelFin.R
  echo 'XYZn <- XYZn |> group_by(Tckr)' >> SoelFin.R
  echo 'if(asset.class %in% c("ECN")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    select(Date, Price, Tckr) |>' >> SoelFin.R
  echo '    full_join(XYZn) |>' >> SoelFin.R
  echo '    ungroup()' >> SoelFin.R
  echo '} else {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    full_join(XYZn) |>' >> SoelFin.R
  echo '    ungroup()' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'XYZ <- XYZ |>' >> SoelFin.R
  echo '  arrange(Tckr) |>' >> SoelFin.R
  echo '  group_by(Tckr) |>' >> SoelFin.R
  echo '  arrange(Date, .by_group = TRUE)' >> SoelFin.R
  echo 'XYZ <- XYZ |> distinct(Date, .keep_all = TRUE)' >> SoelFin.R
  echo 'if(asset.class %in% c("ECN")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |> mutate(Rvn = 100*RETURN(Price, fill_na = 0))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class %in% c("CRY", "FUT", "IDX", "STK")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    mutate(Rvn = 100*RETURN(Price, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(rVol = 100*RETURN(Vol, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(rVol = if_else(is.infinite(rVol), 0, rVol)) |>' >> SoelFin.R
  echo '    mutate(Gap = 100*na.fill((Open/lag(Price))-1, fill = 0))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class %in% c("FOX")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    mutate(Rvn = 100*RETURN(Price, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(Gap = 100*na.fill((Open/lag(Price))-1, fill = 0))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'rm(XYZn)' >> SoelFin.R
  echo 'XYZ <- XYZ |> ungroup()' >> SoelFin.R
  echo 'vXYZ <- XYZ |>' >> SoelFin.R
  echo '        group_by(Tckr) |>' >> SoelFin.R
  echo '        summarize(Beamer = max(Date)) |>' >> SoelFin.R
  echo '        filter(Beamer < max(Beamer)) |>' >> SoelFin.R
  echo '        select(Tckr) |>' >> SoelFin.R
  echo '        as_vector()' >> SoelFin.R
  echo 'err_happnd <- FALSE' >> SoelFin.R
  echo ' XYZ_ <- XYZ' >> SoelFin.R
  echo 'if(asset.class %in% c("STK", "FUT", "CRY")) {' >> SoelFin.R
  echo '  tryCatch(' >> SoelFin.R
  echo '    {' >> SoelFin.R
  echo '      n = 0' >> SoelFin.R
  echo '      while ((!is_empty(vXYZ)) && (n < 3)) {' >> SoelFin.R
  echo '        tXYZ <- XYZ_ |> filter(Tckr %in% vXYZ) |> mSoel$UpdS(asset.class)' >> SoelFin.R
  echo '        XYZ_ <- XYZ_ |> group_by(Tckr) |> full_join(tXYZ |> group_by(Tckr))' >> SoelFin.R
  echo '        XYZ_ <- XYZ_ |> ungroup() |> mSoel$Rkpt(asset.class)' >> SoelFin.R
  echo '        vXYZ <- XYZ_ |>' >> SoelFin.R
  echo '          group_by(Tckr) |>' >> SoelFin.R
  echo '          filter(!str_starts(Tckr, "d")) |>' >> SoelFin.R
  echo '          summarize(Beamer = max(Date)) |>' >> SoelFin.R
  echo '          filter(Beamer < max(Beamer)) |>' >> SoelFin.R
  echo '          select(Tckr) |>' >> SoelFin.R
  echo '          as_vector()' >> SoelFin.R
  echo '        n = n + 1' >> SoelFin.R
  echo '      }' >> SoelFin.R
  echo '    },' >> SoelFin.R
  echo '    error = function(e) {err_happnd <<- TRUE})' >> SoelFin.R
  echo '  if(!err_happnd) {' >> SoelFin.R
  echo '    XYZ <- XYZ_' >> SoelFin.R
  echo '  }' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'return(XYZ)' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'mSoel$Rkpt <- function(tb, asset.class) {' >> SoelFin.R
  echo 'XYZ <- tb' >> SoelFin.R
  echo 'XYZ <- XYZ |> arrange(Tckr)' >> SoelFin.R
  echo 'XYZ <- XYZ |> group_by(Tckr) |> arrange(Date, .by_group = TRUE)' >> SoelFin.R
  echo 'if(asset.class %in% c("IDX", "STK", "FUT", "CRY")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    mutate(Co = 100*((Price/Open)-1)) |>' >> SoelFin.R
  echo '    mutate(Hl = 100*((High/Low)-1)) |>' >> SoelFin.R
  echo '    mutate(Ind = 100*if_else(Hl == 0, 0, 1 - (abs(Co)/Hl))) |>' >> SoelFin.R
  echo '    mutate(Rvn = 100*RETURN(Price, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(Gap = 100*na.fill((Open/lag(Price))-1, fill = 0)) |>' >> SoelFin.R
  echo '    mutate(Gaug = 100*if_else(High == Low, 1, (Price-Low)/(High-Low))) |>' >> SoelFin.R
  echo '    mutate(rVol = 100*RETURN(Vol, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(rVol = if_else(is.infinite(rVol), 0, rVol))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class %in% c("FOX")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '    mutate(Co = 100*((Price/Open)-1)) |>' >> SoelFin.R
  echo '    mutate(Hl = 100*((High/Low)-1)) |>' >> SoelFin.R
  echo '    mutate(Ind = 100*if_else(Hl == 0, 0, 1 - (abs(Co)/Hl))) |>' >> SoelFin.R
  echo '    mutate(Rvn = 100*RETURN(Price, fill_na = 0)) |>' >> SoelFin.R
  echo '    mutate(Gap = 100*na.fill((Open/lag(Price))-1, fill = 0)) |>' >> SoelFin.R
  echo '    mutate(Gaug = 100*if_else(High == Low, 1, (Price-Low)/(High-Low)))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'if(asset.class %in% c("ECN")) {' >> SoelFin.R
  echo '  XYZ <- XYZ |> mutate(Rvn = 100*RETURN(Price, fill_na = 0))' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'XYZ <- XYZ |> ungroup()' >> SoelFin.R
  echo 'return(XYZ)' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'mSoel$CleanD <- function(tb_so, asset.class) {' >> SoelFin.R
  echo '  XYZ <- tb_so' >> SoelFin.R
  echo '  XYZ <- XYZ |>' >> SoelFin.R
  echo '         filter(!is.na(Price)) |>' >> SoelFin.R
  echo '         mSoel$Rkpt(asset.class = asset.class)' >> SoelFin.R
  echo '  return(XYZ)' >> SoelFin.R
  echo '}' >> SoelFin.R
  echo 'rm(k)' >> SoelFin.R
  echo 'SoelFin.R has been generated!'
  sleep 1
  ## MAKING Prelude.jl
  echo "Making Prelude..."
  sleep 1
  touch Prelude.jl
  echo 'using DataFrames, Dates, Statistics, CSV, YAML, MarketData' > Prelude.jl
  echo '######## Building Blocks, Structs and Co' >> Prelude.jl
  echo 'Silk = YAML.load_file("Unnur.yaml")["Silk"]' >> Prelude.jl
  echo 'Err = YAML.load_file("Unnur.yaml")["ErrorFile"]' >> Prelude.jl
  echo 'struct Instrument' >> Prelude.jl
  echo '  Folder::String' >> Prelude.jl
  echo '  Ticker::String' >> Prelude.jl
  echo '  Aklass::String' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'KlassMe = Dict("Artemis" => "STK",' >> Prelude.jl
  echo '                   "Demeter" => "FUT",' >> Prelude.jl
  echo '                   "Euterpe" => "IDX",' >> Prelude.jl
  echo '                   "Mercure" => "ECN",' >> Prelude.jl
  echo '                   "Nemesis" => "FUT",' >> Prelude.jl
  echo '                   "Ophelya" => "ETF",' >> Prelude.jl
  echo '                   "Origami" => "STK",' >> Prelude.jl
  echo '                   "Phorcys" => "FOX",' >> Prelude.jl
  echo '                   "Satoshi" => "CRY")' >> Prelude.jl
  echo 'function ErrorTracker(msg; Err="DebugMeSo.txt")' >> Prelude.jl
  echo '  open(Err, "a") do io' >> Prelude.jl
  echo '    write(io, string(now())*" :: "*string(msg)*"\n")' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function PnlMe(x, y)' >> Prelude.jl
  echo '    100*((y/x) - 1)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function IndMe(x, y)' >> Prelude.jl
  echo '  isequal(y, 0) ? 0 : 100*(1 - (abs(x)/y))' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function RvnMe(x)' >> Prelude.jl
  echo '   n = length(x)' >> Prelude.jl
  echo '   z = Vector{Float64}(undef, n)' >> Prelude.jl
  echo '   for k in range(1, n)' >> Prelude.jl
  echo '     isequal(k, 1) ? z[k] = 0 : z[k] = 100*((x[k]/x[k-1])-1)' >> Prelude.jl
  echo '   end' >> Prelude.jl
  echo '   return z' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function GapMe(x, y)' >> Prelude.jl
  echo '  n = length(x)' >> Prelude.jl
  echo '  if !isequal(length(x), length(y))' >> Prelude.jl
  echo '    @error "[SOEL:] Arguments do not have the same length"' >> Prelude.jl
  echo "  else" >> Prelude.jl
  echo '    z = Vector{Float64}(undef, n)' >> Prelude.jl
  echo '    for k in range(1, n)' >> Prelude.jl
  echo '      isequal(k, 1) ? z[k] = 0 : z[k] = 100*((x[k]/y[k-1])-1)' >> Prelude.jl
  echo '    end' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  return z' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function GaugMe(x, y, z)' >> Prelude.jl
  echo '  isequal(y, z) ? 0 : 100*(x-z)/(y-z)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function GetSo(x::Instrument; from="1970-01-01", to=Date(Dates.now()), Err="DebugMeSo.txt")' >> Prelude.jl
  echo '  t0 = Dates.now()' >> Prelude.jl
  echo '  fEnc = Dict("STK" => (x -> x),' >> Prelude.jl
  echo '                      "IDX" => (x -> "^"*x),' >> Prelude.jl
  echo '                      "ECN" => (x -> x),' >> Prelude.jl
  echo '                      "FUT" => (x -> x*"=F"),' >> Prelude.jl
  echo '                      "ETF" => (x -> x),' >> Prelude.jl
  echo '                      "FOX" => (x -> x*"=X"),' >> Prelude.jl
  echo '                      "CRY" => (x -> x*"-USD"))' >> Prelude.jl
  echo '  xyz = DataFrame()' >> Prelude.jl
  echo '  from_, to_ = DateTime(from), DateTime(to)' >> Prelude.jl
  echo '  printstyled("Beginning GetSo\n Tckr: $(x.Ticker) | AssetClass: $(x.Aklass)\n", color=:blue, underline=true)' >> Prelude.jl
  echo '  printstyled("From $from_ to $to_\n", color=:blue)' >> Prelude.jl
  echo '  try' >> Prelude.jl
  echo '    oOo = fEnc[x.Aklass](x.Ticker)' >> Prelude.jl
  echo '    xyz = yahoo(oOo, YahooOpt(period1=from_, period2=to_)) |> DataFrame' >> Prelude.jl
  echo '  catch err' >> Prelude.jl
  echo '    println("Something gone fucking wrong! Troubles with GetSo:::$(x.Ticker)")' >> Prelude.jl
  echo '    ErrorTracker("In GetSo:::Prelude: Problem with $(x.Ticker) | $(x.Folder) - \n"*string(err); Err)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  idies = completecases(xyz)' >> Prelude.jl
  echo '  if any(.!idies)' >> Prelude.jl
  echo '    println("Some entries are missing, tryna fix them all...")' >> Prelude.jl
  echo '    ErrorTracker("-"^20; Err)' >> Prelude.jl
  echo '    ErrorTracker("Some missings from $(x.Ticker) | $(x.Folder)"; Err)' >> Prelude.jl
  echo '    open(Err, "a") do io' >> Prelude.jl
  echo '      zee = xyz[.!completecases(xyz), :]' >> Prelude.jl
  echo '      for j in range(1, nrow(zee))' >> Prelude.jl
  echo '        for k in Vector(zee[j, :])' >> Prelude.jl
  echo '          write(io, string(k)*", ")' >> Prelude.jl
  echo '        end' >> Prelude.jl
  echo '        write(io, "\n")' >> Prelude.jl
  echo '      end' >> Prelude.jl
  echo '    end' >> Prelude.jl
  echo '    ErrorTracker("-EOF Report Missings $(x.Ticker) | $(x.Folder) -"; Err)' >> Prelude.jl
  echo '    global xyz = xyz[completecases(xyz), :]' >> Prelude.jl
  echo '    @warn "Some missing values in here, dropped them all.\n Check $Err for more information.' >> Prelude.jl
  echo '  elseif !(any(idies))' >> Prelude.jl
  echo '    open(Err, "a") do io' >> Prelude.jl
  echo '      write(io, string(now())*":: Problems with $(x.Ticker) | $(x.Folder), need some investigations.")' >> Prelude.jl
  echo '    end' >> Prelude.jl
  echo '    throw(error("Looks like the DataFrame is empty!"))' >> Prelude.jl
  echo '    return nothing' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  DataFrames.rename!(xyz, :Close => :Price, :timestamp => :Date)' >> Prelude.jl
  echo '  if "Volume" in names(xyz)' >> Prelude.jl
  echo '    DataFrames.rename!(xyz, :Volume => :Vol)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  printstyled("Starting Structuring into tidy Philosophy...\n", color=:yellow)' >> Prelude.jl
  echo '  if "Vol" in names(xyz)' >> Prelude.jl
  echo '    select!(xyz, :Date, :Price, :Open, :High, :Low, :Vol)' >> Prelude.jl
  echo '    printstyled("Selecting $(names(xyz)) ...\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => ByRow(PnlMe) => :Co)' >> Prelude.jl
  echo '    printstyled(":Co generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Low, :High] => ByRow(PnlMe) => :Hl)' >> Prelude.jl
  echo '    printstyled(":Hl generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Co, :Hl] => ByRow(IndMe) => :Ind)' >> Prelude.jl
  echo '    printstyled(":Ind generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    printstyled(":Rvn generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => GapMe => :Gap)' >> Prelude.jl
  echo '    printstyled(":Gap generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Price, :High, :Low] => ByRow(GaugMe) => :Gaug)' >> Prelude.jl
  echo '    printstyled(":Gaug generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, :Vol => RvnMe => :rVol)' >> Prelude.jl
  echo '    printstyled(":rVol generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, :Date => (y -> x.Ticker) => :Tckr)' >> Prelude.jl
  echo '    printstyled(":Tckr generated!\n", color=:green)' >> Prelude.jl
  echo '  elseif issubset(names(xyz), ["Date", "Price", "Open", "High", "Low"])' >> Prelude.jl
  echo '    select!(xyz, :Date, :Price, :Open, :High, :Low)' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => ByRow(PnlMe) => :Co)' >> Prelude.jl
  echo '    printstyled(":Co generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Low, :High] => ByRow(PnlMe) => :Hl)' >> Prelude.jl
  echo '    printstyled(":Hl generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Co, :Hl] => ByRow(IndMe) => :Ind)' >> Prelude.jl
  echo '    printstyled(":Ind generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    printstyled(":Rvn generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => GapMe => :Gap)' >> Prelude.jl
  echo '    printstyled(":GapMe generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, [:Price, :High, :Low] => ByRow(GaugMe) => :Gaug)' >> Prelude.jl
  echo '    printstyled(":Gaug generated!\n", color=:green)' >> Prelude.jl
  echo '    transform!(xyz, :Date => (y -> x.Ticker) => :Tckr)' >> Prelude.jl
  echo '    printstyled(":Tckr generated!\n", color=:green)' >> Prelude.jl
  echo '  else' >> Prelude.jl
  echo '    select!(xyz, :Date, :Price)' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    printstyled(":Rvn generated!\n", color=:green)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  unique!(xyz, :Date)' >> Prelude.jl
  echo '  printstyled("Uniquely defined by :Date ::: SUCCESS\\n", color=:green)' >> Prelude.jl
  echo '  printstyled("GetSo :: SUCCESS for $(x.Ticker) \\n", color=:green)' >> Prelude.jl
  echo '  t0 = Dates.now() - t0' >> Prelude.jl
  echo '  round(t0, Second)' >> Prelude.jl
  echo '  printstyled("Time elapsed: $(t0) \\n", color=:yellow, bold=true)' >> Prelude.jl
  echo '  return xyz' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function ReadnUpdSo(x::Instrument; Err="DebugMeSo.txt")' >> Prelude.jl
  echo '  println("Beginning ReadnUpdSo...\\n")' >> Prelude.jl
  echo '  println("Getting: ", x.Ticker, "...")'  >> Prelude.jl
  echo '  xyz = CSV.read(Silk*x.Folder*"/"*x.Ticker*".csv", DataFrame)' >> Prelude.jl
  echo '  println("Successfully gotten!")' >> Prelude.jl
  echo '  lastD = string(Date(last(xyz.Date)) + Day(1))' >> Prelude.jl
  echo '  println("The last date + 1 is: $lastD")' >> Prelude.jl
  echo '  println("Tryna append the new stuff...")' >> Prelude.jl
  echo '  append!(xyz, GetSo(x, from=lastD, to=DateTime(Date(now())), Err=Err))' >> Prelude.jl
  echo '  println("Appended successfully!")' >> Prelude.jl
  echo '  if x.Aklass in setdiff(values(KlassMe), "ECN")' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => GapMe => :Gap)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  unique!(xyz, :Date)' >> Prelude.jl
  echo '  return xyz' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function ReadnRekpt(x::Instrument; Err="DebugMeSo.txt")' >> Prelude.jl
  echo '  println("Read and Recompute --> $(x.Ticker)")' >> Prelude.jl
  echo '  xyz = CSV.read(Silk*x.Folder*"/"*x.Ticker*".csv", DataFrame)' >> Prelude.jl
  echo '  sort!(xyz, :Date)' >> Prelude.jl
  echo '  if "Vol" in names(xyz)' >> Prelude.jl
  echo '    select!(xyz, :Date, :Price, :Open, :High, :Low, :Vol)' >> Prelude.jl
  echo '    println("selecting $(names(xyz))")' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => ByRow(PnlMe) => :Co)' >> Prelude.jl
  echo '    println(":Co recalculateded!")' >> Prelude.jl
  echo '    transform!(xyz, [:Low, :High] => ByRow(PnlMe) => :Hl)' >> Prelude.jl
  echo '    println(":Hl recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Co, :Hl] => ByRow(IndMe) => :Ind)' >> Prelude.jl
  echo '    println(":Ind recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    println(":Rvn recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => GapMe => :Gap)' >> Prelude.jl
  echo '    println(":Gap recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Price, :High, :Low] => ByRow(GaugMe) => :Gaug)' >> Prelude.jl
  echo '    println(":Gaug recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, :Vol => RvnMe => :rVol)' >> Prelude.jl
  echo '    println(":rVol recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, :Date => (y -> x.Ticker) => :Tckr)' >> Prelude.jl
  echo '    println(":Tckr recalculated!")' >> Prelude.jl
  echo '  elseif issubset(names(xyz), ["Date", "Price", "Open", "High", "Low"])' >> Prelude.jl
  echo '    select!(xyz, :Date, :Price, :Open, :High, :Low)' >> Prelude.jl
  echo '    println("Selecting $(names(xyz))")' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => ByRow(PnlMe) => :Co)' >> Prelude.jl
  echo '    println(":Co recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Low, :High] => ByRow(PnlMe) => :Hl)' >> Prelude.jl
  echo '    println(":Hl recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Co, :Hl] => ByRow(IndMe) => :Ind)' >> Prelude.jl
  echo '    println(":Ind recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    println(":Rvn recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Open, :Price] => GapMe => :Gap)' >> Prelude.jl
  echo '    println(":Gap recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, [:Price, :High, :Low] => ByRow(GaugMe) => :Gaug)' >> Prelude.jl
  echo '    println(":Gaug recalculated!")' >> Prelude.jl
  echo '    transform!(xyz, :Date => (y -> x.Ticker) => :Tckr)' >> Prelude.jl
  echo '    println(":Tckr recalculated!")' >> Prelude.jl
  echo '  else' >> Prelude.jl
  echo '    select!(xyz, :Date, :Price)' >> Prelude.jl
  echo '    println("Selecting $(names(xyz))")' >> Prelude.jl
  echo '    transform!(xyz, :Price => RvnMe => :Rvn)' >> Prelude.jl
  echo '    println(":Rvn recalculated!")' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  printstyled("$(x.Ticker)"*" successfully recomputed!\n", color=:yellow, bold=true)' >> Prelude.jl
  echo '  CSV.write(Silk*x.Folder*"/"*x.Ticker*".csv", xyz)' >> Prelude.jl
  echo '  printstyled("$(x.Ticker) Written on disk!", color=:green, bold=true)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function Tiraw(f_nameN, f_nameO; Err="DebugMeSo.txt")' >> Prelude.jl
  echo '  tb = CSV.read(f_nameN, DataFrame)' >> Prelude.jl
  echo '  println("Read successfully!")' >> Prelude.jl
  echo '  transform!(tb, :Time => ByRow(x -> DateTime(x)) => :Time)' >> Prelude.jl
  echo '  tb = groupby(tb, :Tckr)' >> Prelude.jl
  echo '  tbLow = subset(tb, :Low => (x -> x .== minimum(x)),  ungroup=false) |> DataFrame' >> Prelude.jl
  echo '  tbHigh = subset(tb, :High => (x -> x .== maximum(x)),  ungroup=false) |> DataFrame' >> Prelude.jl
  echo '  tbLow.What .= "Bottom"' >> Prelude.jl
  echo '  tbHigh.What .= "Top"' >> Prelude.jl
  echo '  tb = append!(tbLow, tbHigh)' >> Prelude.jl
  echo '  if isfile(f_nameO)' >> Prelude.jl
  echo '    tb = outerjoin(CSV.read(f_nameO, DataFrame), tb, on = names(tb))' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  return(tb)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function Illiad(x::Instrument; Err="DebugMeSo.txt")  ## The Mercedesz.jl kernel function.' >> Prelude.jl
  echo '  try' >> Prelude.jl
  echo '    xyz=ReadnUpdSo(x; Err)' >> Prelude.jl
  echo '    CSV.write(Silk*x.Folder*"/"*x.Ticker*".csv", xyz)' >> Prelude.jl
  echo '  catch err' >> Prelude.jl
  echo '    println(string(err))' >> Prelude.jl
  echo '    ErrorTracker(string(err); Err)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  ReadnRekpt(x; Err)' >> Prelude.jl
  echo '  println("EO Illiad >>> $(x.Ticker) | $(x.Folder)")' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function GetnWriteSo(x::Instrument; Err="DebugMeSo.txt")' >> Prelude.jl
  echo '  p_ = false' >> Prelude.jl
  echo '  try' >> Prelude.jl
  echo '    xyz=GetSo(x; Err)' >> Prelude.jl
  echo '    p_ = true' >> Prelude.jl
  echo '  catch err' >> Prelude.jl
  echo '    println(string(err))' >> Prelude.jl
  echo '    ErrorTracker(string(err); Err)' >> Prelude.jl
  echo '    p_ = false' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  if p_' >> Prelude.jl
  echo '    CSV.write(Silk*x.Folder*"/"*x.Ticker*".csv", xyz)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function cummin(x)' >> Prelude.jl
  echo '  return accumulate(min, x)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function cummax(x)' >> Prelude.jl
  echo '  return accumulate(max, x)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function food(x, y)' >> Prelude.jl
  echo '  return 100*((x/y)-1)' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function foodf(x, y)' >> Prelude.jl
  echo '  n = length(x)' >> Prelude.jl
  echo '  z = Vector{Float64}(undef, n)' >> Prelude.jl
  echo '  for k in range(1, n)' >> Prelude.jl
  echo '    z[k] = 100*((x[k]/y[1])-1)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  return z' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function lag(x; defaultv = 0)' >> Prelude.jl
  echo '  n = length(x)' >> Prelude.jl
  echo '  y = Vector{Float64}(undef, n)' >> Prelude.jl
  echo '  for k in range(1, n)' >> Prelude.jl
  echo '    if k == n' >> Prelude.jl
  echo '      y[1] = defaultv' >> Prelude.jl
  echo '    else' >> Prelude.jl
  echo '      y[1+k] = x[k]' >> Prelude.jl
  echo '    end' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  return y' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function absCoHl(x, y)' >> Prelude.jl
  echo '  if y == 0' >> Prelude.jl
  echo '  return 0' >> Prelude.jl
  echo '  else' >> Prelude.jl
  echo '    return 100 - 100*(abs(x)/y)' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'function RET(x)' >> Prelude.jl
  echo '  n = length(x)' >> Prelude.jl
  echo '  z = Vector{Float64}(undef, n)' >> Prelude.jl
  echo '  for k in range(1, n)' >> Prelude.jl
  echo '    if k == n' >> Prelude.jl
  echo '      z[1] = 0' >> Prelude.jl
  echo '    else' >> Prelude.jl
  echo '      z[k] = 100*((x[k+1]/x[k]) - 1)' >> Prelude.jl
  echo '    end' >> Prelude.jl
  echo '  end' >> Prelude.jl
  echo '  return z' >> Prelude.jl
  echo 'end' >> Prelude.jl
  echo 'Prelude has been generated!'
  ## Umercure.R
  touch Umercure.R
  echo 'source("SoelFin.R")' > Umercure.R
  echo 'Silk <- yaml::read_yaml("Unnur.yaml")\$Silk' >> Umercure.R
  echo 's1 <- yaml::read_yaml("Unnur.yaml")\$Mercure' >> Umercure.R
  echo 'tb = tibble()' >> Umercure.R
  echo 'for(j in seq_along(s1)) {' >> Umercure.R
  echo '  if(all.equal(j, 1)) {' >> Umercure.R
  echo '    tb = read_csv(paste0(Silk, "Mercure/", s1[j], ".csv")))' >> Umercure.R
  echo '   } else {' >> Umercure.R
  echo '     tb = full_join(tb, read_csv(paste0(Silk, "Mercure/", s1[j], ".csv")))' >> Umercure.R
  echo '   }' >> Umercure.R
  echo '}' >> Umercure.R
  echo 'tb_ = mSoel\$UpdS(tb, asset.class="ECN", verbose = TRUE)' >> Umercure.R
  echo 'for(j in seq_along(s1)) {' >> Umercure.R
  echo '  tb_ |> filter(Tckr %in% s1[j]) |> write_csv(paste0(Silk, "Mercure/", s1[j], ".csv"))' >> Umercure.R
  echo '}' >> Umercure.R
  echo 'rm(j, pee, Silk, s1)' >> Umercure.R
  ## Hludana.jl
  echo "Making Hludana..."
  sleep 1
  touch Hludana.jl
  echo 'include("Prelude.jl")' > Hludana.jl
  echo 't1 = Dates.now()' >> Hludana.jl
  echo 'using DataFrames, Dates, Statistics, CSV, YAML' >> Hludana.jl
  echo 'printstyled("\n", "#"^50, "\n#     HLUDANA, Powered by SOEL DERIVATIVES"*" "^4*"#\n", "#"^50, "\n", color=:yellow)' >> Hludana.jl
  echo 'Err = YAML.load_file("Unnur.yaml")["ErrorFile"]' >> Hludana.jl
  echo 'Bunch = YAML.load_file("Unnur.yaml")["Hrafnhildur"]' >> Hludana.jl
  echo 'dyN = YAML.load_file("Unnur.yaml")["DailiesID"]' >> Hludana.jl
  echo '__message__ = " <<< STARTING Hludana of "' >> Hludana.jl
  echo 'dailyMe = Dict("Artemis" => "ART",' >> Hludana.jl
  echo '               "Demeter" => "DEM",' >> Hludana.jl
  echo '               "Euterpe" => "EUT",' >> Hludana.jl
  echo '               "Mercure" => "MER",' >> Hludana.jl
  echo '               "Nemesis" => "NEM",' >> Hludana.jl
  echo '               "Ophelya" => "OPH",' >> Hludana.jl
  echo '               "Origami" => "ORI",' >> Hludana.jl
  echo '               "Phorcys" => "PHO",' >> Hludana.jl
  echo '               "Satoshi" => "SAT")' >> Hludana.jl
  echo 'ThoriMe = Dict("Artemis" => "ThaStocks",' >> Hludana.jl
  echo '               "Demeter" => "Demeter",' >> Hludana.jl
  echo '               "Euterpe" => "Euterpe",' >> Hludana.jl
  echo '               "Mercure" => "Mercure",' >> Hludana.jl
  echo '               "Nemesis" => "Nemesis",' >> Hludana.jl
  echo '               "Ophelya" => "Ophelya",' >> Hludana.jl
  echo '               "Origami" => "Origami",' >> Hludana.jl
  echo '               "Phorcys" => "Phorcys",' >> Hludana.jl
  echo '               "Satoshi" => "Satoshi")' >> Hludana.jl
  echo 'tgetN = ["Time", "Price", "Open", "High", "Low", "Co", "Hl", "Vol", "Rvn", "Ind", "Gap", "Gaug", "cHigh", "cLow", "cCo", "cHl", "cCoL", "cCoH", "cVol", "cInd", "cGaug", "rVol", "Tckr"]' >> Hludana.jl
  echo 'if !(isempty(ARGS))' >> Hludana.jl
  echo '  Hlud = ARGS[1]' >> Hludana.jl
  echo '  if !(Hlud in Bunch)' >> Hludana.jl
  echo '    @error "The unique argument should be one of $Bunch"' >> Hludana.jl
  echo '  end' >> Hludana.jl
  echo 'else' >> Hludana.jl
  echo '  @error "Exactly one argument should be provided, nothing has been read!"' >> Hludana.jl
  echo 'end' >> Hludana.jl
  echo '__message__ = __message__*"\$Hlud >>>"' >> Hludana.jl
  echo 'ErrorTracker(__message__; Err)' >> Hludana.jl
  echo '__warning1__ = "CSV-$Hlud not in a so-structuration!"' >> Hludana.jl
  echo '## The path where Hludana does dump its spitting.' >> Hludana.jl
  echo 'pathee = Silk*Hlud*"/"*dyN*"/"' >> Hludana.jl
  echo '## Thori got the names of the dataSets, the instruments.' >> Hludana.jl
  echo 'Thori = YAML.load_file("Unnur.yaml")[ThoriMe[Hlud]]' >> Hludana.jl
  echo "## A lil function to get'em all from the disk ########" >> Hludana.jl
  echo 'function GetEm(x)' >> Hludana.jl
  echo '  tb = CSV.read(x*".csv", DataFrame)' >> Hludana.jl
  echo '  print("Got \$x successfully\\n")' >> Hludana.jl
  echo '  header_csv = ["Datetime", "Open", "High", "Low", "Close", "Adj Close", "Volume"]' >> Hludana.jl
  echo '  if !issubset(names(tb), header_csv)' >> Hludana.jl
  echo '    ErrorTracker("CSV Format: $x NOT Soelianized!"; Err)' >> Hludana.jl
  echo '    @error "CSV-GetEm Hludana: $x Not Soelianized!"' >> Hludana.jl
  echo '  else' >> Hludana.jl
  echo '    transform!(tb, :Volume => (y -> x) => :Tckr)' >> Hludana.jl
  echo '  end' >> Hludana.jl
  echo '  return tb' >> Hludana.jl
  echo 'end' >> Hludana.jl
  echo '############ End of the Lil function #################' >> Hludana.jl
  echo 'tb = DataFrame()' >> Hludana.jl
  echo 'for j in Thori' >> Hludana.jl
  echo '  try' >> Hludana.jl
  echo '    append!(tb, GetEm(j))' >> Hludana.jl
  echo '  catch err' >> Hludana.jl
  echo '    println(err)' >> Hludana.jl
  echo '    ErrorTracker("Hludana: $j | $Hlud <> got a prollem while reading!")' >> Hludana.jl
  echo '    ErrorTracker(string(err); Err)' >> Hludana.jl
  echo '  end' >> Hludana.jl
  echo 'end' >> Hludana.jl
  echo 'println("\nChecking...")' >> Hludana.jl
  echo 'println("\t", "Hludana of $Hlud, df size |-->>> ", size(tb))' >> Hludana.jl
  echo 'ErrorTracker("In Hludana of $Hlud size of df -->> "*string(size(tb)); Err)' >> Hludana.jl
  echo 'DataFrames.rename!(tb, :Datetime => :Time, :Volume => :Vol, :Close => :Price)' >> Hludana.jl
  echo 'println("First renaming successful...")' >> Hludana.jl
  echo 'select!(tb, :Time, :Price, :Open, :High, :Low, :Vol, :Tckr)' >> Hludana.jl
  echo 'println("In Hludana, $Hlud, variables selected successfully!")' >> Hludana.jl
  echo 'println("In Hludana, $Hlud, grouping...")' >> Hludana.jl
  echo 'tb = groupby(tb, :Tckr)' >> Hludana.jl
  echo 'println("In Hludana, successfully grouped $Hlud ...")' >> Hludana.jl
  echo '## Creating Usual Soelian structured market-data format' >> Hludana.jl
  echo 'ErrorTracker("In Hludana, beginning processing of $Hlud ..."; Err)' >> Hludana.jl
  echo 'println("In Hludana, beginning data processing of $Hlud ...")' >> Hludana.jl
  echo 'tb=transform(tb, :Time => ByRow(y -> DateTime(y, "yyy-mm-dd HH:MM:SS")) => :Time, keepkeys=true, ungroup=false)' >> Hludana.jl
  echo 'tb=transform(tb, [:Price, :Open] => ByRow(food) => :Co; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :Co done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:High, :Low] => ByRow(food) => :Hl; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :Hl done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:Co, :Hl] => ByRow(absCoHl) => :Ind; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :Ind done")' >> Hludana.jl
  echo 'tb=transform(tb, :Price => RET => :Rvn; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :Rvn done!")' >> Hludana.jl
  echo 'tb=transform(tb, :Price => lag => :lP; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'tb=transform(tb, [:Open, :lP] => ByRow(food) => :Gap; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :Gap done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:Price, :High, :Low] => ByRow((x, y, z) -> y == z ? 0 : (100*((x-z)/(y-z)))) => :Gaug; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :Gaug done!")' >> Hludana.jl
  echo 'tb=transform(tb, :High => cummax => :cHigh; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cHigh done!")' >> Hludana.jl
  echo 'tb=transform(tb, :Low => cummin => :cLow; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cLow done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:Price, :Open] => foodf => :cCo; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cCo done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:cHigh, :cLow] => ByRow(food) => :cHl; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cHl done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:cLow, :Open] => foodf => :cCoL; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :CoL done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:cHigh, :Open] => foodf => :cCoH; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cCoH done!")' >> Hludana.jl
  echo 'tb=transform(tb, :Vol => cumsum => :cVol; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cVol done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:cCo, :cHl] => ByRow(absCoHl) => :cInd; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println("In Hludana,  $Hlud, :cInd done!")' >> Hludana.jl
  echo 'tb=transform(tb, [:Price, :cHigh, :cLow] => ByRow((x, y, z) -> y == z ? 0 : (100*((x-z)/(y-z)))) => :cGaug; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println(":cGaug done!")' >> Hludana.jl
  echo 'tb=transform(tb, :Vol => RET => :rVol; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'tb=transform(tb, :rVol => ByRow((x -> isinf(x) ? 0 : x)) => :rVol; keepkeys = true, ungroup = false)' >> Hludana.jl
  echo 'println(":rVol done!")' >> Hludana.jl
  echo 'tb=select(tb, tgetN; keepkeys = true, ungroup = true)' >> Hludana.jl
  echo 'println("Theoretic columns: ", length(tgetN))' >> Hludana.jl
  echo 'println("Actual columns: ", length(names(tb)))' >> Hludana.jl
  echo 'ErrorTracker("In Hludana, $Hlud, processing..."; Err)' >> Hludana.jl
  echo '### END OF STRUCTURING' >> Hludana.jl
  echo 'd = Date.(tb.Time) |> maximum |> string' >> Hludana.jl
  echo 'CSV.write(pathee*dyN*dailyMe[Hlud]*"-"*d*".csv", tb)' >> Hludana.jl
  echo 't2 = Dates.now()' >> Hludana.jl
  echo 't2 = t2 - t1' >> Hludana.jl
  echo 'println("Time Elapsed: $t2")' >> Hludana.jl
  echo 'printstyled("Hludana, ended!\n", color=:blue, underline=true)' >> Hludana.jl
  echo 'println("🍫️☕️\n💯️")' >> Hludana.jl
  echo 'ErrorTracker("<<<< ENDING: HLUDANA of $Hlud >>>>"; Err)' >> Hludana.jl
  echo 'Hludana has been generated!'
  ## flush.R
  ## MOVE the file into Zsofia dir
  echo -e "WARNING: $0 will be moved into $Pathee\n"
  echo -e "Zsofia will exit, please launch it from $Pathee\n"
  read -p "Press ENTER to continue..."
  mv -v -f ${PWD}/$0 $Pathee && "Quitting..." && sleep 1 && exit
  echo "Looks like Zsofia.sh didn't move, please move it manually into $Pathee"
  ## Perform an EXITING here
  else
  echo "Returning to Main Menu..." && sleep 1 && break
  fi
  break;;
XHEA)
  echo -e "\t\t>>> $r <<<"
  read -p "Enter the date for Xhea:  " -a d
  for j in ${d[@]}; do
  gnome-terminal --title="Xhea Output" -- bash Xhea.sh $j
  done
  unset d; break;;
ADD)
  while true; do
  echo -e "\t\t >>> $r <<<"
  select q in ${Bunch[@]}; do
  case $q in
  Artemis | Demeter | Euterpe | Nemesis | Ophelya | Origami | Phorcys | Satoshi)
  echo "\n$q Selected!"
  read -p "Enter the Tickers: " -a t
  if [[ ${#t[@]} -lt 1 ]]; then
    echo "No argument provided, exiting..." && sleep 2 && break
  else
  touch Ollie.jl
  echo "include(\"Prelude.jl\")" > Ollie.jl
  echo "vEEE=Vector{Instrument}(undef, 0)" >> Ollie.jl
  echo -ne "vee = [ " >> Ollie.jl
  for j in ${t[@]}; do
  echo -ne "\"$j\" " >> Ollie.jl
  done
  echo "]" >> Ollie.jl
  echo "vee = vec(vee)" >> Ollie.jl
  echo "for j in vee" >> Ollie.jl
  echo '  push!(vEEE, Instrument("$q", j, KlassMe["$q"]))' >> Ollie.jl
  echo "end" >> Ollie.jl
  echo "for j in vEEE" >> Ollie.jl
  echo "  GetnWriteSo(j; Err)" >> Ollie.jl
  echo "end" >> Ollie.jl
  gnome-terminal --title="Zsofia:::Add-in $q" -- julia Ollie.jl
  unset t
  echo "Add-in termination for $q, check out $Err for more details" && sleep 2
  fi
  break;;
  Mercure) echo "$q is not yet implemented!"; break;;
  Quit) echo "Exiting $r ..." && sleep 1 && break 2;;
  *) echo "Enter a valid option please!" && read -p "Press ENTER to continue..." && break;;
  esac
  done
  done; break;;
LAST)
  while true; do
  echo -e "\t\t>>> $r <<<"
  select q in ${Bunch[@]}; do
  case $q in
  Artemis | Demeter | Euterpe | Nemesis | Ophelya | Origami | Phorcys | Satoshi)
    a=$( echo "${Pathee}/$hraf/${q}/" )
    read -p "In $q, enter the Tickers:  " -a t
    echo " "
    printf '%-5s %-10s %-8s %-8s %-8s %-8s %-8s\n' Tckr Date Price Open High Low Volume
    for j in ${t[@]}; do
    [ -f ${a}${j}.csv ] && awk -F ',' 'END { printf "%-5s %-10s %-8.2f %-8.2f %-8.2f %-8.2f %-d\n", $14,$1,$2,$3,$4,$5,$6}' ${a}${j}.csv
    done
    echo " "
    break;;
  Quit) echo "Quitting $r..." && sleep 1 && break 2;;
  esac
  done
  done
  break;;
REMOVE)
  while true; do
  echo -e "\t\t>>> $r <<<"
  select q in ${Bunch[@]}; do
  case $q in
  Artemis | Demeter | Nemesis | Ophelya | Origami | Phorcys | Satoshi | Mercure)
    a=$( echo "${Pathee}/$hraf/${q}/" )
    read -p "Within $q, enter the instrument(s) to be removed: " -a b
    if [[ ${#b[@]} -lt 1 ]]; then
      echo "No input, quitting..." && sleep 1 && break
    else
    t=()
    for j in ${b[@]}; do
      t+=(  "${a}${j}.csv" )
    done
    for j in ${t[@]}; do
      if [ -f $j ]; then
      mv "$j" ~/Downloads/ && echo "$( date +%Y-%m-%dT%H:%M:%S ): from Zsofia, $USER REMOVED $j" >> $Err
      echo "Removed $j"
      else
      echo "$j doesn't exist."
      fi
    done
    unset a b t
    fi
    break;;
  Quit) echo "From REMOVE, exiting..." && break 2;;
  *) echo "Enter a valid option, please!" && read -p "Press ENTER to continue..." && break;;
  esac
  done
  done
  break;;
REPORTING) echo -e "\n$r not Yet Implemented\n" && sleep 2 && break;;
CLEAN)
  echo -e "\t\t>>> $r -- Cleaning Csilla <<<"
  for j in ${Bunch[@]}; do
  echo "Trying to clean-out $j ..." && sleep 1
  cd "$Pathee"/$hraf/"$j"/ && ls Csilla-* && sleep 1 && rm -r Csilla-* && cd -
  done
  echo "Job done!" && sleep 1
  cd "$Pathee" && break;;
QUIT)
  echo -e "\nExiting ...$0...\n"
  sleep 2
  clear
  [ -f Ollie.jl ] && rm Ollie.jl
  break 2;;
*) echo "Enter a valid option, please!" && read -p "Press ENTER to continue..." && break;;
esac
done
done
