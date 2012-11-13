Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C9B1E52988
	for <meta-arago@arago-project.org>;
	Tue, 13 Nov 2012 00:08:26 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6274430oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 16:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4QujQ21PJjjICePDPs+wnASv/7HyfhYVx8KYvYyhKUY=;
	b=oS4nqI4QbGfLc0vJTnNVNi72+jrMZd3OdSLQNgUvoIOJjL7UWeCU3qF6N6STaakeoq
	h20doC56g58wUw0FegnJBh4/OD7q55400rLeYhdTfOsSx13CX/C5ibHD0TD3A5al+uAn
	hDWE+1gUL/SRUghPoecWdvPLjoNkD7yEUKiZqQvlToRNwSvoLG7INahWKRCCF9yY8+ql
	N9UvouvQDpI3/xNNe4q8TYg80lG0S5it9QDUtTe+vKb3n2EJssw7S6TBn+nxEaevr54x
	TvcwiZ0oVmyC41ErFboigMRnkanBgh4Q4ISH1dgIDXKkonYkoco99LFUr/nl5glJCryu
	Qz1A==
Received: by 10.60.2.65 with SMTP id 1mr15549127oes.19.1352765306003;
	Mon, 12 Nov 2012 16:08:26 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d7sm4561959oee.2.2012.11.12.16.08.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 16:08:25 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 18:08:19 -0600
Message-Id: <1352765299-14678-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] usbutils: avoid dependency on bash
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
X-List-Received-Date: Tue, 13 Nov 2012 00:08:27 -0000

* Mimic the oe-core master patch "usbutils: avoid dependency on bash"
  651b223c5fc93c7504e304e954b9ae4640ed47c6.
* This patch removes the unnecessary runtime dependency on bash.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../usb-devices-avoid-dependency-on-bash.patch     |   30 ++++++++++++++++++++
 .../recipes-bsp/usbutils/usbutils_0.91.bbappend    |    9 ++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/usbutils/usbutils-0.91/usb-devices-avoid-dependency-on-bash.patch
 create mode 100644 meta-arago-distro/recipes-bsp/usbutils/usbutils_0.91.bbappend

diff --git a/meta-arago-distro/recipes-bsp/usbutils/usbutils-0.91/usb-devices-avoid-dependency-on-bash.patch b/meta-arago-distro/recipes-bsp/usbutils/usbutils-0.91/usb-devices-avoid-dependency-on-bash.patch
new file mode 100644
index 0000000..a6b241f
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/usbutils/usbutils-0.91/usb-devices-avoid-dependency-on-bash.patch
@@ -0,0 +1,30 @@
+From 333d5fbbc03481f1aa222bd68c2609db168ae3e0 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Thu, 26 Jul 2012 10:37:32 +0100
+Subject: [PATCH] usb-devices: avoid dependency on bash
+
+By virtue of having #!/bin/bash this script declared that it requires
+bash, however manual examination, checkbashisms and tests with dash
+and busybox show that it doesn't contain any bashisms, so change the
+header to avoid the dependency.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ usb-devices |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usb-devices b/usb-devices
+index b2052e2..14a5358 100755
+--- a/usb-devices
++++ b/usb-devices
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # Copyright: 2009 Greg Kroah-Hartman <greg@kroah.com>
+ #            2009 Randy Dunlap <rdunlap@xenotime.net>
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-bsp/usbutils/usbutils_0.91.bbappend b/meta-arago-distro/recipes-bsp/usbutils/usbutils_0.91.bbappend
new file mode 100644
index 0000000..0de1ebf
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/usbutils/usbutils_0.91.bbappend
@@ -0,0 +1,9 @@
+PR_append = "-arago0"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+# Remove bash from the list of runtime dependencies
+RDEPENDS_${PN} = "${PN}-ids"
+
+SRC_URI += "file://usb-devices-avoid-dependency-on-bash.patch"
-- 
1.7.0.4


