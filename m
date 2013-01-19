Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 335B552ABC
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:11 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id x4so4800784obh.38
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=VTKTiIKHUYsPpQPuGUy2d2qPrXT+/HFiET7KlJtCckI=;
	b=g+gpABY4UFEpVn0rOdLCtcNwSF3JBrBrMT7Xinwca79C34hxCb+G8iuJ8Ty9AHArsz
	5ZVbMzWpxVmtIXF2HtJ2uqU1V7JkAWcw9SRqHJA1BJlUanoiVCUZ+OC37J+2CzinxDUD
	PAuKbADnHh5Add18CzUxdA7lr5wrt6ajDAilwiwRgLvd8Nw8CKtLpoVnCjBfC7KVuysl
	SOVV7zprAErUiR2cJIpgfGNYK7vSAxMaMnWUrCs3ORKKcehFjJ4UmYTQPcKljHvMT8Qn
	ZZrobHH3ARjr4nmgkb/FJOYNoBcvPGSG5kODPqTRiKK8S1nN0ZIUuqA+6jLMYvd8azMM
	1I+Q==
X-Received: by 10.60.31.49 with SMTP id x17mr10681564oeh.33.1358632330560;
	Sat, 19 Jan 2013 13:52:10 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.08
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:09 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:30 -0600
Message-Id: <1358632316-12266-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/31] crda: Pull version 1.1.1 from Arago
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:11 -0000

* Pull crda version 1.1.1 from Arago.
* This was the version used in the Sitara SDK and is known to work
  well with the WL1271 daughter card's software stack.
* This version was previously unusable due to libnl version 3.2.9 being used.
* Since Arago is switching back to libnl version 2.0 it is safe to use this
  version of crda again.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-connectivity/crda/crda_1.1.1.bb        |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb

diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
new file mode 100644
index 0000000..e3880a1
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Wireless Central Regulatory Domain Agent"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+SECTION = "base"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+
+PR = "r0"
+
+DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
+RDEPENDS_${PN} = "udev"
+
+SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
+           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
+"
+
+CFLAGS += " -DCONFIG_LIBNL20"
+
+EXTRA_OEMAKE = "MAKEFLAGS="
+do_compile() {
+    oe_runmake all_noverify
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    install -d ${D}/usr/lib/crda/
+    install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
+}
+
+SRC_URI[crda.md5sum] = "5fc77af68b3e21736b8ef2f8b061c810"
+SRC_URI[crda.sha256sum] = "59b4760da44a8f803caeaaa7fb97e0c6bd3f35f40445b28258e7f14c2fbe13b5"
+SRC_URI[reg.md5sum] = "1535e98bcaba732e2f8e8f62dac6f369"
+SRC_URI[reg.sha256sum] = "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe01011a318b3dceaba33b"
+
+FILES_${PN} += "\
+    /lib/udev/rules.d/85-regulatory.rules \
+    /usr/lib/crda/regulatory.bin \
+"
-- 
1.7.0.4


