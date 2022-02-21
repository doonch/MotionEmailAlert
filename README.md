# MotionEmailAlert
Set up your old laptop as a security camera. When motion is detected, get an encrypted email notification with a snapshot.

# Why?
Monitor a sensitive room or yard for any unauthorized entry. Track your pets, bird nests, etc. 

But really, I just wanted someone to send me PGP encrypted emails.

Either way, here it is.

# Requirements:
* Computer & Webcam. I used a [Packard Bell dot s](https://www.packardbell.com/pb/en/IL/content/serie/dot-s) (2011).
* Some Linux distribution; tested on [Arch Linux](archlinux.org).
* [Postfix](http://www.postfix.org)
* [Motion](https://motion-project.github.io)
* [Gnupg](https://www.gnupg.org)
* The `hostname` command is required. It may be available already, on Arch Linux install `inetutils`.

# Set up Postfix
Nothing to do here, the default configuration is good enough. Consider setting `myhostname` for good measure.

# Set up Gnupg
Import the Admin's public key, and set the trust for that key.

```
$ gpg --search-keys my_email@gmail.com

$ gpg --edit-key <KeyId> trust
```	

# Set up Motion
Add the following hooks in `/etc/motion/motion.conf`; replace `localuser` with your local username.

```
# Command to be executed when an event starts.
on_event_start /home/localuser/scripts/motion_detected.sh

# Command to be executed when an event ends.
on_event_end /home/localuser/scripts/motion_ended.sh
```

Turn on saving frames when motion detected, and set the target folder for frames:

```
# Target directory for pictures, snapshots and movies
target_dir /home/localuser/frames

# Output pictures when motion is detected
picture_output on
```
