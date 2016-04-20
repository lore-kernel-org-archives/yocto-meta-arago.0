Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4138C529E7
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:50 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y001Z46BY1H20@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=fcjlmNQPPrKD0E5CR9QA:9
	a=X8SajSGEAeCLsyH6:21 a=0EY1MtmVagAqmlpd:21
Received: by 100.15.86.14 with SMTP id 37ec8b31; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C27F2161FBD;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:19 -0400
Message-id: <1461180805-25733-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 10/16] serialcheck: upstreamed to meta-oe, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...01-Add-option-to-enable-internal-loopback.patch | 80 ----------------------
 .../0002-Restore-original-loopback-config.patch    | 48 -------------
 .../serialcheck/serialcheck_1.0.0.bb               | 22 ------
 3 files changed, 150 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb

diff --git a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
deleted file mode 100644
index fc387d7..0000000
--- a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep 17 00:00:00 2001
-From: Sekhar Nori <nsekhar@ti.com>
-Date: Tue, 24 Feb 2015 22:16:37 +0530
-Subject: [PATCH 1/2] Add option to enable internal loopback
-
----
- serialcheck.c | 23 +++++++++++++++++++++++
- 1 file changed, 23 insertions(+)
-
-diff --git a/serialcheck.c b/serialcheck.c
-index 4f5b747..4100c37 100644
---- a/serialcheck.c
-+++ b/serialcheck.c
-@@ -12,6 +12,8 @@
- #include <sys/ioctl.h>
- #include <linux/serial.h>
-
-+#define TIOCM_LOOP	0x8000
-+
- #define __same_type(a, b)	__builtin_types_compatible_p(typeof(a), typeof(b))
- #define BUILD_BUG_ON_ZERO(e)	(sizeof(struct { int:-!!(e); }))
- #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
-@@ -40,6 +42,7 @@ struct g_opt {
-	unsigned char hflow;
-	unsigned char do_termios;
-	unsigned char *cmp_buff;
-+	unsigned char loopback;
- };
-
- /* name, key, arg, flags, doc, group */
-@@ -51,6 +54,7 @@ static struct argp_option options[] = {
-	{"mode",	'm', "M",    0, "transfer mode (d = duplex, t = send r = receive)", 0},
-	{"loops",	'l', "NUM",  0, "loops to perform (0 => wait fot CTRL-C", 0},
-	{"no-termios",	'n', NULL,   0, "No termios change (baud rate etc. remains unchanged)", 0},
-+	{"loopback",	'k', NULL,   0, "loopback mode", 0},
-	{NULL, 0, NULL, 0, NULL, 0}
- };
-
-@@ -67,6 +71,7 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
-		go->baudrate = 115200;
-		go->loops = UINT_MAX;
-		go->do_termios = 1;
-+		go->loopback = 0;
-		break;
-	case ARGP_KEY_ARG:
-		ret =  ARGP_ERR_UNKNOWN;
-@@ -113,6 +118,9 @@ static error_t parse_opt(int key, char *arg, struct argp_state *state)
-		} else
-			go->loops = num;
-		break;
-+	case 'k':
-+		go->loopback = 1;
-+		break;
-	default:
-		ret = ARGP_ERR_UNKNOWN;
-	}
-@@ -487,6 +495,21 @@ int main(int argc, char *argv[])
-			die("tcflush failed: %m\n");
-	}
-
-+	if (opts.loopback) {
-+		unsigned int mcr;
-+
-+		ret = ioctl(fd, TIOCMGET, &mcr);
-+		if (ret < 0)
-+			die("mcr get failed: %m\n");
-+
-+		mcr |= TIOCM_LOOP;
-+
-+		ret = ioctl(fd, TIOCMSET, &mcr);
-+		if (ret < 0)
-+			die ("mcr set failed: %m\n");
-+
-+	}
-+
-	ret = fcntl(fd, F_SETFL, 0);
-	if (ret)
-		printf("Failed to remove nonblock mode\n");
---
-1.9.1
diff --git a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
deleted file mode 100644
index c9478fc..0000000
--- a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep 17 00:00:00 2001
-From: Carlos Hernandez <ceh@ti.com>
-Date: Tue, 24 Feb 2015 16:00:34 -0500
-Subject: [PATCH 2/2] Restore original loopback config
-
-If loopback option is enabled. Disabled it at the end of the test.
-
-Signed-off-by: Carlos Hernandez <ceh@ti.com>
----
- serialcheck.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/serialcheck.c b/serialcheck.c
-index 4100c37..06470f7 100644
---- a/serialcheck.c
-+++ b/serialcheck.c
-@@ -427,6 +427,7 @@ int main(int argc, char *argv[])
-	unsigned char *data;
-	unsigned int open_mode;
-	off_t data_len;
-+	unsigned int mcr;
-
-	argp_parse(&argp, argc, argv, 0, NULL, &opts);
-	if (!opts.file_trans)
-@@ -496,8 +497,6 @@ int main(int argc, char *argv[])
-	}
-
-	if (opts.loopback) {
--		unsigned int mcr;
--
-		ret = ioctl(fd, TIOCMGET, &mcr);
-		if (ret < 0)
-			die("mcr get failed: %m\n");
-@@ -535,6 +534,12 @@ int main(int argc, char *argv[])
-	ret = tcsetattr(fd, TCSAFLUSH, &old_term);
-	if (ret)
-		printf("tcsetattr() of old ones failed: %m\n");
-+    if (opts.loopback) {
-+		mcr &= ~(TIOCM_LOOP);
-+		ret = ioctl(fd, TIOCMSET, &mcr);
-+    }
-+    if (ret)
-+		printf("disabling loopback failed: %m\n");
-
-	close(fd);
-	return status;
---
-1.9.1
diff --git a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
deleted file mode 100644
index 16d3ddd..0000000
--- a/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Application to verify operation of serial ports"
-HOMEPAGE = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
-
-SRC_URI_append = " file://0001-Add-option-to-enable-internal-loopback.patch \
-                   file://0002-Restore-original-loopback-config.patch "
-
-SRCREV = "63854a2d0c0129efab132ec328a75279e013fb84"
-
-CLEANBROKEN = "1"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = "CC="${CC}""
-
-do_install() {
-    install -d ${D}${bindir}
-    install ${S}/serialcheck ${D}${bindir}/serialcheck
-}
-- 
2.2.0


