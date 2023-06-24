# Synology DSM reinstall

<a href="https://github.com/007revad/Synology_DSM_reinstall/releases"><img src="https://img.shields.io/github/release/007revad/Synology_DSM_reinstall.svg"></a>
<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2F007revad%2FDSM_reinstallh&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/007revad)

### Description
Easily re-install the same DSM version without losing any data or settings

If you need to re-install the same DSM version this is much easier than resetting the Synology.

## Download the script

See <a href=images/how_to_download_generic.png/>How to download the script</a> for the easiest way to download the script.

## How to run the script

### Running the script via SSH

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

<p align="center">No error from DSM</p>
<p align="center"><img src="/images/reinstall_dsm_step-3.png"></p>
