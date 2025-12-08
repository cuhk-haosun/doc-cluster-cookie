
# 📚 Cluster “cookie”

Welcome to the cookie computing cluster. This document gathers all the essential information you need to log in, use storage, and access public services.
Shared Resources for Group Hao Sun & Group Yongfei Wang.

The cluster is consists of one login node `h1`, four CPU node `c1-c4` and a GPU node `g1`

--- 

## Table of Contents
- [SSH Access](#ssh-access)
- [Shared Storage](#shared-storage)
- [Public Services](#public-services)
  - [UCSC Genome Browser](#ucsc-genome-browser)
  - [Online PDF Toolbox](#online-pdf-toolbox)
  - [Self-hosted chatGPT](#self-hosted-chatgpt)
--- 

# SSH Access
**Within CUHK (Shenzhen)**  

Hostname / IP: `slcookie.yutg.net`  `10.26.4.230`  
Port: **22** (default)  
Example command: `ssh -J <username>@slcookie.yutg.net <username>@<hostname>`

**OUTSIDE CUHK (Shenzhen)**  

Hostname / IP: `sl.yutg.net`
Port: **2013** (default)  


Replace `<username>` with your personal account name.
Replace `<hostname>` with the node you wish to connect to. **Available node: c1, c2, c3, c4**

It is recommended to setup SSH key login on all the nodes. Otherwise, you need to provide password two times.

## Example config for SSH quick login

Put the code bellow to `~/.ssh/config`
```
Host h1
    HostName slcookie.yutg.net
    User <username>

Host c1 c2 c3 c4
    User <username>
    ProxyJump h1

```

After adding the config above the login command becomes: `ssh c1`


--- 

# Shared Storage
Three high‑capacity storage pools are mounted on the cluster. Use the paths below in your scripts, notebooks, or interactive sessions.

| Pool  | Mount point   | Size   | Primary purpose                     | Remarks |
|-------|---------------|--------|--------------------------------------|---------|
| **sugar** | `/mnt/d1/pool` | **102 TB** | Home directory & daily data | – |
| **honey** | `/mnt/d2/pool` | **110 TB** | Work directory | – |
| **wind**  | `/mnt/wind`    | **44 TB**  | High‑speed RAID‑0 for temporary work files | **⚠️ Auto‑cleaned** on the **1st day of March, June, September & November**. No data guarantee. |


**⚠️ Caution** – Anything placed in **/mnt/wind** will be **deleted** automatically on the schedule above. Back up important files to **sugar** or **honey** before the cleanup date.



# Public Services

## UCSC Genome Browser
- **Features** – Self‑hosted instance of the UCSC Genome Browser for the consortium’s reference genomes.  
- **URL** – <http://slgb.yutg.net/>  
- **Availability** – Request a username/password from the cluster administrator.  
- **Upload directory** – `/mnt/d2/genome.browser` (only writable by authorized users).  


## Online PDF Toolbox
- **Features** – Page rearrangement, page extraction, format conversion (PDF ↔ DOCX/PNG/etc.), and more.  
- **URL** – <https://slpdf.yutg.net>  
- **Availability** – **Open** (Only reachable from inside the CUHK (Shenzhen) network)

## Self-hosted chatGPT
- **Features** – Self‑hosted instance of chatGPT.
- **URL** – <http://slai.yutg.net/>  
- **Availability** – Request a username/password from the cluster administrator.
