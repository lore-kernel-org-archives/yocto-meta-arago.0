Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id A8A08529A4
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 15:11:43 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1287940obb.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=naWBn5JBnmTzaXxfLqfUW6x8UwyALJ8587olcP9HSlI=;
	b=iqm5GqsbS/NCA/lK7qyghsaSH7k4tYc0Abe0njiCHr0rdJLf8B/Em3WbQWYC6Uwv9y
	+lPTlV/z4WBx+IidOVqZMrK0NrhsCTQrEXfhs9qwA5zsOVVFqsienmDMbr86hQ9eSCqF
	MP4ggch8RxnTs1pifVBbCo5FHGtxU/vbpj3qXUMTfdoEVawOSxrr4b75giIAeP9BjuVA
	Otf2MURiUdYh6eCS/i9/aiSaMRpZRluHe5xMX6zST4Djeq+oktOrmodKnYc9LhnL4A8Y
	pUWOg9vy8UgXIp7pI+yQIDhNXo8yZQrX1DUTo4I5ZutqUvLBC8eQOumNVvvwzz3XfiUo
	eE9A==
Received: by 10.60.170.104 with SMTP id al8mr12977532oec.78.1348585903135;
	Tue, 25 Sep 2012 08:11:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q6sm360082oec.7.2012.09.25.08.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 08:11:42 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 10:36:18 -0500
Message-Id: <1348587378-25412-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] crda: Port crda recipe from oe-classic
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
X-List-Received-Date: Tue, 25 Sep 2012 15:11:43 -0000

* Port the crda recipe from oe-classic. The version in oe-classic
  was version 1.1.1
* Version 1.1.1 had compiling issues with the version of LIBNL used in oe-core.
  Upgraded version of crda to 1.1.2 which fixed that issue.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-connectivity/crda/crda_1.1.2.bb        |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb

diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
new file mode 100644
index 0000000..82047db
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Wireless Central Regulatory Domain Agent"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+SECTION = "base"
+PRIORITY = "optional"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+
+PR = "r0"
+
+DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
+RDEPENDS_${PN} = "udev"
+
+SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
+	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
+	"
+
+EXTRA_OEMAKE = "MAKEFLAGS="
+do_compile() {
+	oe_runmake all_noverify
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+	install -d ${D}/usr/lib/crda/
+	install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
+}
+
+SRC_URI[crda.md5sum] = "5226f65aebacf94baaf820f8b4e06df4"
+SRC_URI[crda.sha256sum] = "e469348a5d0bb933df31995869130f68901de9be02e666437f52125698851864"
+SRC_URI[reg.md5sum] = "1535e98bcaba732e2f8e8f62dac6f369"
+SRC_URI[reg.sha256sum] = "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe01011a318b3dceaba33b"
+
+FILES_${PN} += "\
+	/lib/udev/rules.d/85-regulatory.rules \
+	/usr/lib/crda/regulatory.bin \
+	"
-- 
1.7.0.4


