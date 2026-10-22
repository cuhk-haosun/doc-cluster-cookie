# Mount Nextcloud on Linux Using Rclone

With rclone, you can open, copy, edit, and manage files stored on Nextcloud directly through your Linux file manager or terminal.

## 1. Requirements

Before starting, make sure you have:

- A Linux computer (Ubuntu or Debian recommended)
- **Rclone version 1.75.2 or newer**
- A Nextcloud account
- Your Nextcloud server URL
- Your Nextcloud username
- A Nextcloud app password
- An internet connection

**Recommended:** Create an app password in Nextcloud under **Settings → Security → Devices & sessions** (the wording may vary). Using an app password is safer than using your main account password.

## 2. Check Rclone

### Step 1: Check the installed version

Open a terminal and run:

```bash
rclone version
```

Example:

```text
rclone v1.75.2
- os/version: ubuntu
- os/arch: amd64
```

**Important: This guide requires rclone version 1.75.2 or newer.**

If the installed version is older than `1.75.2`, update rclone before continuing.



## 3. Configure the Nextcloud Connection

Start the configuration tool:

```bash
rclone config
```

Follow the prompts below.

### Step 1: Create a new remote

Choose:

```text
n) New remote
e) Edit existing remote
q) Quit config

n/e/q> n
```

### Step 2: Name your connection

Enter:

```text
name> nextcloud
```

This name identifies your Nextcloud connection.

### Step 3: Choose the storage type

Find **WebDAV** in the list and enter its corresponding number, or type:

```text
Storage> webdav
```

### Step 4: Enter the Nextcloud WebDAV URL

Use the following format:

```text
https://slfile.yutg.net/remote.php/dav/files/USERNAME/
```

Replace:

- `slfile.yutg.net` with your Nextcloud server address
- `USERNAME` with your Nextcloud username

For example:

```text
url> https://slfile.yutg.net/remote.php/dav/files/john/
```

You can also find the WebDAV address in the Nextcloud Files web interface under **Files settings → WebDAV**.
Ref: `https://docs.nextcloud.com/server/stable/go.php?to=user-webdav`

### Step 5: Select Nextcloud

When asked for the WebDAV vendor, select:

```text
vendor> nextcloud
```

### Step 6: Enter your username

```text
user> john
```

### Step 7: Enter your password

When prompted:

```text
Option pass.
Password.

y) Yes, type in my own password
g) Generate random password
n) No, leave this optional password blank

y/g/n> y
```

Enter your Nextcloud app password when prompted, and confirm it if requested.

Your password will not be displayed while typing.

### Step 8: Bearer token

When asked:

```text
Option bearer_token.
Bearer token instead of user/pass.

bearer_token>
```

Simply press **Enter** to leave it empty.

### Step 9: Advanced configuration

Choose:

```text
Edit advanced config?
y) Yes
n) No (default)

y/n> n
```

### Step 10: Save your connection

Confirm the configuration by choosing `y`, then choose `q` to exit the configuration tool.

## 4. Test the Connection

Before mounting, verify that rclone can access Nextcloud.

```bash
rclone lsd nextcloud:
```

This should list directories stored on your Nextcloud account.

To list files:

```bash
rclone ls nextcloud:
```

If you receive an authentication error, check your username, WebDAV URL, and app password.

## 5. Mount Nextcloud as a Local Folder

Create a directory where Nextcloud will appear:

```bash
mkdir -p ~/Nextcloud
```

Mount your Nextcloud storage:

```bash
rclone mount nextcloud: ~/Nextcloud \
  --vfs-cache-mode full \
  --vfs-cache-max-size 10G \
  --dir-cache-time 5m \
  --poll-interval 0 \
  --daemon
```

**What do these options mean?**

| Option | Description |
|---|---|
| `nextcloud:` | Your configured Nextcloud connection |
| `~/Nextcloud` | Local folder used to access Nextcloud |
| `--vfs-cache-mode full` | Improves compatibility with applications that read and edit files |
| `--vfs-cache-max-size 10G` | Sets a maximum target size for the local file cache |
| `--dir-cache-time 5m` | Caches directory listings for five minutes |
| `--poll-interval 0` | Disables remote change polling |
| `--daemon` | Runs the mount process in the background |

The local cache may temporarily exceed the configured size while files are in use.

### Verify the mount

```bash
ls -lah ~/Nextcloud
```

You can also open `~/Nextcloud` using your Linux file manager.

**Note:** Nextcloud files are accessed over the network. Some operations may be slower than working with files stored locally.


## 7. Troubleshooting

### Authentication failed (401 Unauthorized)

Possible causes:

- Incorrect username or password
- Incorrect WebDAV URL
- Two-factor authentication requiring an app password

Run:

```bash
rclone config
```

Choose `e` to edit your Nextcloud connection.

### Directory appears empty

First, test whether rclone can see your files:

```bash
rclone lsd nextcloud:
```

If the command works, check the mount:

```bash
findmnt ~/Nextcloud
```

If no mount is found and you configured the systemd service, restart it:

```bash
systemctl --user restart rclone-nextcloud
```

### Mount point is already in use

Another rclone process may already be using the folder.

Check the mount:

```bash
findmnt ~/Nextcloud
```

Avoid mounting multiple rclone instances to the same directory.

### Slow file access

Network speed, Nextcloud server performance, and file size can affect access speed.

For better compatibility, use:

```text
--vfs-cache-mode full
```

You can also increase the cache size if sufficient local disk space is available.

### Files do not immediately update

Rclone caches directory listings. Changes made through the Nextcloud web interface or other clients may take time to appear.

If you configured the systemd service, you can restart it:

```bash
systemctl --user restart rclone-nextcloud
```

Close files and allow pending writes to finish before restarting.

## 8. Important Notes

- **Internet required:** This mount is not a complete offline copy of your Nextcloud storage.
- **Changes affect Nextcloud:** Deleting or modifying a file through the mount can change the original file on Nextcloud.
- **Cache is not a backup:** Rclone's cache should not be relied upon as permanent storage.
- **Avoid simultaneous edits:** Editing the same file from multiple devices can produce conflicts or overwritten changes.
- **Protect credentials:** Keep your rclone configuration private. Never share the contents of `~/.config/rclone/rclone.conf`.
- **Large files:** Files may be cached locally when accessed, which consumes disk space.

For reliable offline file synchronization, consider using the official Nextcloud desktop client instead of a mounted WebDAV filesystem.

## 9. References

- [Rclone official documentation](https://rclone.org/)
- [Rclone WebDAV configuration](https://rclone.org/webdav/)
- [Rclone mount documentation](https://rclone.org/commands/rclone_mount/)
- [Rclone installation guide](https://rclone.org/install/)
- [Nextcloud documentation](https://docs.nextcloud.com/)

---

**Platform:** Linux (Ubuntu/Debian)

**Minimum rclone version:** 1.75.2

**Connection protocol:** WebDAV over HTTPS

**Mounting tool:** Rclone

**Example mount location:** `~/Nextcloud`
