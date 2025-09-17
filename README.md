
# 📚 Cluster “cookie”

Welcome to the cookie computing cluster. This document gathers all the essential information you need to log in, use storage, and access public services.
Shared Resources for Group Hao Sun & Group Yongfei Wang

--- 

## Table of Contents
- [SSH Access](#ssh-access)
- [Shared Storage](#shared-storage)
- [Public Services](#public-services)
  - [UCSC Genome Browser](#ucsc-genome-browser)
  - [Online PDF Toolbox](#online-pdf-toolbox)
--- 

# SSH Access
From: **CUHK (Shenzhen)**  
Hostname / IP: `slcookie.yutg.net`  `10.26.4.230`  
Port: **22** (default)  
Example command: `ssh <username>@slcookie.yutg.net`

Replace `<username>` with your personal account name. It is recommended to use SSH key login

--- 

# Shared Storage
Three high‑capacity storage pools are mounted on the cluster. Use the paths below in your scripts, notebooks, or interactive sessions.

| Pool  | Mount point   | Size   | Primary purpose                     | Remarks |
|-------|---------------|--------|--------------------------------------|---------|
| **sugar** | `/mnt/d1/pool` | **102 TB** | Main working directory – daily data | – |
| **honey** | `/mnt/d2/pool` | **110 TB** | Archival storage – long‑term retention | – |
| **wind**  | `/mnt/wind`    | **44 TB**  | High‑speed RAID‑0 for temporary work files | **⚠️ Auto‑cleaned** on the **1st day of March, June, September & November**. No data guarantee. |


**⚠️ Caution** – Anything placed in **/mnt/wind** will be **deleted** automatically on the schedule above. Back up important files to **sugar** or **honey** before the cleanup date.



# Public Services

## UCSC Genome Browser
- **Features** – Self‑hosted instance of the UCSC Genome Browser for the consortium’s reference genomes.  
- **URL** – <http://slgb.yutg.net/>  
- **Availability** – Request a username/password from the cluster administrator.  
- **Upload directory** – `/pool/sun/archive/genome.browser` (only writable by authorized users).  


## Online PDF Toolbox
- **Features** – Page rearrangement, page extraction, format conversion (PDF ↔ DOCX/PNG/etc.), and more.  
- **URL** – <https://slpdf.yutg.net>  
- **Availability** – **Open** (Only reachable from inside the CUHK (Shenzhen) network)
