Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id BE4D8529A1
	for <meta-arago@arago-project.org>;
	Sat, 22 Sep 2012 00:23:58 +0000 (UTC)
Received: by oagl20 with SMTP id l20so3743914oag.38
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2012 17:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZEBzKT8OU/nq3nnSAvhruJPXmZFa7o+UbdcmJoi4plw=;
	b=TEMhcwxWCqBtfwrUDKVSGmgBYjmc2118ZhYpZf0+DjiGhFgaYqss16aIowRVSIkfaZ
	Rxclraf0UGFVvQB7RekbhORz9A9KZlMr6ZDY+sTi4Yl+JDTbX2v2fh6aivQnZZLRfsU9
	xWT3vo/lZTK0+vH/EUlWLdlVPAOYItsInGev47yCfAGq54GG2a0NwmqhCVoWLlQ+ly4i
	JEGxwKBSVBKED4Ryvv02wOBSK5DYYjfBVXplHRteVoRCrKutaF7PDbSRSynJl11WbDEd
	kEosF0jeyh8B71Y1kbCHREmZUHIoqnNy0g/WlGgtIpYzuKLkRS0HkDYSAN3seGc2RMaU
	fjmQ==
Received: by 10.182.174.100 with SMTP id br4mr5079658obc.62.1348273437876;
	Fri, 21 Sep 2012 17:23:57 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id jd10sm9291567obb.13.2012.09.21.17.23.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 17:23:57 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Sep 2012 19:47:21 -0500
Message-Id: <1348274841-27630-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH] psplash: Add TI color customization
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
X-List-Received-Date: Sat, 22 Sep 2012 00:23:59 -0000

* Port TI color customization from psplash-ti in oe-classic.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-psplash-Add-Arago-custom-color.patch      |   39 ++++++++++++++++++++
 .../recipes-core/psplash/psplash_git.bbappend      |    3 +-
 2 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch

diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
new file mode 100644
index 0000000..c13790e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
@@ -0,0 +1,39 @@
+From be4eb4c5c3992deee2cfaa5da8913473623f728b Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Fri, 21 Sep 2012 15:18:24 -0500
+Subject: [PATCH] psplash: Add Arago custom color
+
+* Port custom colors used in psplash-ti from oe-classic.
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ psplash-colors.h |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/psplash-colors.h b/psplash-colors.h
+index d701089..a6a5992 100644
+--- a/psplash-colors.h
++++ b/psplash-colors.h
+@@ -20,15 +20,15 @@
+ #define _HAVE_PSPLASH_COLORS_H
+ 
+ /* This is the overall background color */
+-#define PSPLASH_BACKGROUND_COLOR 0xec,0xec,0xe1
++#define PSPLASH_BACKGROUND_COLOR 0x00,0x00,0x00
+ 
+ /* This is the color of any text output */
+-#define PSPLASH_TEXT_COLOR 0x6d,0x6d,0x70
++#define PSPLASH_TEXT_COLOR 0xff,0xff,0xff
+ 
+ /* This is the color of the progress bar indicator */
+-#define PSPLASH_BAR_COLOR 0x6d,0x6d,0x70
++#define PSPLASH_BAR_COLOR 0xe3,0x71,0x00
+ 
+ /* This is the color of the progress bar background */
+-#define PSPLASH_BAR_BACKGROUND_COLOR 0xec,0xec,0xe1
++#define PSPLASH_BAR_BACKGROUND_COLOR 0x00,0x00,0x00
+ 
+ #endif
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
index b279daa..aaa6167 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 # Update which portion of the psplash.h file to use as a checksum. This tweak
 # has already been done in oe-core master
@@ -14,6 +14,7 @@ SRC_URI += "file://psplash-18bpp.patch                      \
             file://0003-Updated-configurability.patch.patch \
             file://psplash-poky-img.h                       \
             file://psplash-bar-img.h                        \
+            file://0001-psplash-Add-Arago-custom-color.patch\
 "
 
 do_configure_prepend() {
-- 
1.7.0.4


