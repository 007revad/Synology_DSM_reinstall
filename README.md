# Synology DSM re-install

<a href="https://github.com/007revad/Synology_DSM_reinstall/releases"><img src="https://img.shields.io/github/release/007revad/Synology_DSM_reinstall.svg"></a>
<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2F007revad%2FDSM_reinstallh&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/007revad)

### Description
Easily re-install the same DSM version without losing any data or settings

  - If you need to re-install the same full release DSM version this is much easier than resetting the Synology.
  - It can also be used to roll back from an update version to the same full release version.

### How to tell if a .pat file is a full release or a small update
  - <img src="images/tick.svg" width="15" height="15"> Full release DSM pat files are a over 200MB and named *DSM_model_build.pat* like **DSM_DS223_64570.pat**
  - <img src="images/cross.svg" width="15" height="15"> Small update pat files are less than 50MB and named *synology_arch_model.pat* like **synology_r1000_723+.pat**

### Steps to reinstall DSM
1. Disable DSM Auto Update via "Control Panel > Update & Restore > Update Settings > Notify me... > OK".
2. Download the same DSM full release build version from <a href=https://archive.synology.com/download/Os/DSM/>Synology's download site</a>.
3. Run this script via SSH or from <a href=how_to_run_from_scheduler.md/>Task Scheduler</a>.
4. Go to "Control Panel > Update & Restore > Manual DSM Update".
5. Browse to the DSM .pat file you downloaded in step 2 and click Open then OK.

## Download the script

See <a href=images/how_to_download_generic.png/>How to download the script</a> for the easiest way to download the script.

## How to run the script
You can run the script either via SSH or in Task Scheduler.

#### Scheduling the script in Synology's Task Scheduler
See <a href=how_to_run_from_scheduler.md/>How to run a script in Synology Task Scheduler</a>

#### Running the script via SSH
**Note:** Replace /volume1/scripts/ with the path to where the script is located.
```YAML
sudo -i /volume1/scripts/syno_dsm_reinstall.sh
```

## Screenshots
Here's the result after running the script.

<p align="center">The script has edited DSM's VERSION file to a lower build number</p>
<p align="center"><img src="/images/reinstall_dsm_step-1.png"></p>

<p align="center">Select your downloaded DSM .pat file</p>
<p align="center"><img src="/images/reinstall_dsm_step-2.png"></p>

<p align="center">No complaints from DSM</p>
<p align="center"><img src="/images/reinstall_dsm_step-3.png"></p>
