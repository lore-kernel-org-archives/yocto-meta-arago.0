Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EAFCA529D9
	for <meta-arago@arago-project.org>;
	Fri,  9 Jun 2017 21:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E54D820C0B;
	Fri,  9 Jun 2017 21:46:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sJbDd0wRbKF7; Fri,  9 Jun 2017 21:46:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C03CB207BD;
	Fri,  9 Jun 2017 21:46:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 48D5A1624D4;
	Fri,  9 Jun 2017 17:46:35 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  9 Jun 2017 17:46:33 -0400
Message-Id: <1497044794-24189-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] uboot-config.bbclass: overlay locally for a fix
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
X-List-Received-Date: Fri, 09 Jun 2017 21:46:38 -0000

The fix was submitted upstream and once accepted, the class can be removed here

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/uboot-config.bbclass | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta-arago-distro/classes/uboot-config.bbclass

diff --git a/meta-arago-distro/classes/uboot-config.bbclass b/meta-arago-distro/classes/uboot-config.bbclass
new file mode 100644
index 0000000..3f760f2
--- /dev/null
+++ b/meta-arago-distro/classes/uboot-config.bbclass
@@ -0,0 +1,62 @@
+# Handle U-Boot config for a machine
+#
+# The format to specify it, in the machine, is:
+#
+# UBOOT_CONFIG ??= <default>
+# UBOOT_CONFIG[foo] = "config,images,binary"
+#
+# or
+#
+# UBOOT_MACHINE = "config"
+#
+# Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
+
+UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
+
+python () {
+    ubootmachine = d.getVar("UBOOT_MACHINE", True)
+    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
+    ubootbinary = d.getVar('UBOOT_BINARY', True)
+    ubootbinaries = d.getVar('UBOOT_BINARIES', True)
+    # The "doc" varflag is special, we don't want to see it here
+    ubootconfigflags.pop('doc', None)
+
+    if not ubootmachine and not ubootconfigflags:
+        PN = d.getVar("PN", True)
+        FILE = os.path.basename(d.getVar("FILE", True))
+        bb.debug(1, "To build %s, see %s for instructions on \
+                 setting up your machine config" % (PN, FILE))
+        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE", True))
+
+    if ubootmachine and ubootconfigflags:
+        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
+
+    if ubootconfigflags and ubootbinaries:
+        raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
+
+    if not ubootconfigflags:
+        return
+
+    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
+    if len(ubootconfig) > 0:
+        for config in ubootconfig:
+            for f, v in ubootconfigflags.items():
+                if config == f: 
+                    items = v.split(',')
+                    if items[0] and len(items) > 3:
+                        raise bb.parse.SkipPackage('Only config,images,binary can be specified!')
+                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
+                    # IMAGE_FSTYPES appending
+                    if len(items) > 1 and items[1]:
+                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
+                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                    if len(items) > 2 and items[2]:
+                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % items[2])
+                        d.appendVar('UBOOT_BINARIES', ' ' + items[2])
+                    else:
+                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
+                        d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
+                    break
+    elif len(ubootconfig) == 0:
+       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
+}
-- 
2.7.4


