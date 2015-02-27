Return-Path: <a0850405@a0850405-off1>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5D66552983
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 20:55:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RKtVWP013826
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 14:55:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RKtUFn017473
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 14:55:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 14:55:30 -0600
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RKtU5U018691;
	Fri, 27 Feb 2015 14:55:30 -0600
Received: from a0850405 by a0850405-off1 with local (Exim 4.82)	(envelope-from
	<a0850405@a0850405-off1>)	id 1YRRwX-00086O-2x;
	Fri, 27 Feb 2015 15:55:29 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Feb 2015 15:55:11 -0500
Message-ID: <1425070513-31101-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] meta-arago-distro/recipes-devtools: serialcheck recipe
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 20:55:32 -0000
Content-Type: text/plain

Serialcheck is a simple utility to verify serial ports functionality.
It supports all "standard" bauds listed in
include/uapi/asm-generic/termbits.h

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 ...01-Add-option-to-enable-internal-loopback.patch | 81 ++++++++++++++++++++++
 .../0002-Restore-original-loopback-config.patch    | 49 +++++++++++++
 .../serialcheck/serialcheck_1.0.0.bb               | 22 ++++++
 3 files changed, 152 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
 create mode 100644 meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
 create mode 100644 meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb

diff --git a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
new file mode 100644
index 0000000..c351fd3
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
@@ -0,0 +1,81 @@
+From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep 17 00:00:00 2001
+From: Sekhar Nori <nsekhar@ti.com>
+Date: Tue, 24 Feb 2015 22:16:37 +0530
+Subject: [PATCH 1/2] Add option to enable internal loopback
+
+---
+ serialcheck.c | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/serialcheck.c b/serialcheck.c
+index 4f5b747..4100c37 100644
+--- a/serialcheck.c
++++ b/serialcheck.c
+@@ -12,6 +12,8 @@
+ #include <sys/ioctl.h>
+ #include <linux/serial.h>
+ 
++#define TIOCM_LOOP	0x8000
++
+ #define __same_type(a, b)	__builtin_types_compatible_p(typeof(a), typeof(b))
+ #define BUILD_BUG_ON_ZERO(e)	(sizeof(struct { int:-!!(e); }))
+ #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
+@@ -40,6 +42,7 @@ struct g_opt {
+ 	unsigned char hflow;
+ 	unsigned char do_termios;
+ 	unsigned char *cmp_buff;
++	unsigned char loopback;
+ };
+ 
+ /* name, key, arg, flags, doc, group */
+@@ -51,6 +54,7 @@ static struct argp_option options[] = {
+ 	{"mode",	'm', "M",    0, "transfer mode (d = duplex, t = send r = receive)", 0},
+ 	{"loops",	'l', "NUM",  0, "loops to perform (0 => wait fot CTRL-C", 0},
+ 	{"no-termios",	'n', NULL,   0, "No termios change (baud rate etc. remains unchanged)", 0},
++	{"loopback",	'k', NULL,   0, "loopback mode", 0},
+ 	{NULL, 0, NULL, 0, NULL, 0}
+ };
+ 
+@@ -67,6 +71,7 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
+ 		go->baudrate = 115200;
+ 		go->loops = UINT_MAX;
+ 		go->do_termios = 1;
++		go->loopback = 0;
+ 		break;
+ 	case ARGP_KEY_ARG:
+ 		ret =  ARGP_ERR_UNKNOWN;
+@@ -113,6 +118,9 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
+ 		} else
+ 			go->loops = num;
+ 		break;
++	case 'k':
++		go->loopback = 1;
++		break;
+ 	default:
+ 		ret = ARGP_ERR_UNKNOWN;
+ 	}
+@@ -487,6 +495,21 @@ int main(int argc, char *argv[])
+ 			die("tcflush failed: %m\n");
+ 	}
+ 
++	if (opts.loopback) {
++		unsigned int mcr;
++
++		ret = ioctl(fd, TIOCMGET, &mcr);
++		if (ret < 0)
++			die("mcr get failed: %m\n");
++
++		mcr |= TIOCM_LOOP;
++
++		ret = ioctl(fd, TIOCMSET, &mcr);
++		if (ret < 0)
++			die ("mcr set failed: %m\n");
++		
++	}
++
+ 	ret = fcntl(fd, F_SETFL, 0);
+ 	if (ret)
+ 		printf("Failed to remove nonblock mode\n");
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch b/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
new file mode 100644
index 0000000..ea03578
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
@@ -0,0 +1,49 @@
+From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep 17 00:00:00 2001
+From: Carlos Hernandez <ceh@ti.com>
+Date: Tue, 24 Feb 2015 16:00:34 -0500
+Subject: [PATCH 2/2] Restore original loopback config
+
+If loopback option is enabled. Disabled it at the end of the test.
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ serialcheck.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/serialcheck.c b/serialcheck.c
+index 4100c37..06470f7 100644
+--- a/serialcheck.c
++++ b/serialcheck.c
+@@ -427,6 +427,7 @@ int main(int argc, char *argv[])
+ 	unsigned char *data;
+ 	unsigned int open_mode;
+ 	off_t data_len;
++	unsigned int mcr;
+ 
+ 	argp_parse(&argp, argc, argv, 0, NULL, &opts);
+ 	if (!opts.file_trans)
+@@ -496,8 +497,6 @@ int main(int argc, char *argv[])
+ 	}
+ 
+ 	if (opts.loopback) {
+-		unsigned int mcr;
+-
+ 		ret = ioctl(fd, TIOCMGET, &mcr);
+ 		if (ret < 0)
+ 			die("mcr get failed: %m\n");
+@@ -535,6 +534,12 @@ int main(int argc, char *argv[])
+ 	ret = tcsetattr(fd, TCSAFLUSH, &old_term);
+ 	if (ret)
+ 		printf("tcsetattr() of old ones failed: %m\n");
++    if (opts.loopback) {
++		mcr &= ~(TIOCM_LOOP);
++		ret = ioctl(fd, TIOCMSET, &mcr);
++    }
++    if (ret)
++		printf("disabling loopback failed: %m\n");
+ 
+ 	close(fd);
+ 	return status;
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
new file mode 100644
index 0000000..83b4798
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Application to verify operation of serial ports"
+HOMEPAGE = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SRC_URI = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
+
+SRC_URI_append = " file://0001-Add-option-to-enable-internal-loopback.patch \
+                   file://0002-Restore-original-loopback-config.patch "
+
+SRCREV = "63854a2d0c0129efab132ec328a75279e013fb84"
+
+S = "${WORKDIR}/git"
+
+CFLAGS_prepend = "-Wall -Wextra -Wno-sign-compare -Wno-pointer-sign "
+
+do_install() {
+    install -d ${D}${base_bindir}
+    install ${S}/serialcheck  ${D}${base_bindir}/serialcheck
+}
+
+
-- 
1.9.1


