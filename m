Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by arago-project.org (Postfix) with ESMTPS id AE83B52A6B
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:36 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id h1so3004872oag.20
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=R4SiWhYXcefYFRXxpUqifodCZl4YrbA4681uHl/JGuo=;
	b=0XxQz7lxsTnMFPT/SB8uJb5unbJjB/QqzRFsUeP0VA6fKeKcWqpGD9i3jlcIE2oBdC
	3RKQJPt5GfpLZZnSvpk9SMVDhoQcYHViZ5Vw6AuiKwr01CdGPDYCm3eunXiHE5oV23IE
	3Kva51Xu6eV03jODT19HoliysyHC+R6COcZikLuy3+A0i44WEiF92hGzT/papONlf3PY
	sdJISl2ERwlPpNMQpLfScVqDKeFPprcXP63hQVtNHrhBswhxAei6J7OMOKJWa+yYXHmM
	mESyLrtNbgdEtQDgPol0MqUSvVNEFyfaczIiCru6AMPJlKedsBGoFNxYHBgT+XqNVaOv
	4a9Q==
X-Received: by 10.182.190.19 with SMTP id gm19mr11641454obc.34.1359393996084; 
	Mon, 28 Jan 2013 09:26:36 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.34
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:35 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:32 -0600
Message-Id: <1359393932-31361-32-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 32/32] recipes: Remove unused recipe and bbappend
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:37 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* These files are no longer needed since wilink 6 required an older version of
  crda and bluez4 which meta-arago is not using.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../bluez/bluez4_4.101.bbappend                    |   21 ------------
 .../recipes-connectivity/crda/crda_1.1.2.bb        |   35 --------------------
 2 files changed, 0 insertions(+), 56 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
 delete mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
deleted file mode 100644
index 63fcb4f..0000000
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ /dev/null
@@ -1,21 +0,0 @@
-PR_append = "-arago0"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
-            file://0001-socket-enable-for-bluez-4_98.patch \
-            file://0001-bluez-enable-source-interface.patch \
-"
-# udev 150-170 provide its on hid2hci tool and udev rules for it. Therefore,
-# disabling hid2hci from bluez4.
-EXTRA_OECONF := "${@oe_filter_out('--enable-hid2hci', '${EXTRA_OECONF}', d)}"
-DEPENDS += "libsndfile1"
-
-# Add test/agent for testing
-PACKAGES =+ "bluez4-agent"
-
-do_install_append () {
-	${TARGET_SYS}-libtool --mode=install install -c 'test/agent' ${D}${bindir}/agent
-}
-
-FILES_bluez4-agent = "${bindir}/agent"
diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
deleted file mode 100644
index 6085b02..0000000
--- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Wireless Central Regulatory Domain Agent"
-HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
-SECTION = "base"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
-
-PR = "r0"
-
-DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
-RDEPENDS_${PN} = "udev"
-
-SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
-	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2011.04.28-regulatory.bin;name=reg \
-	"
-
-EXTRA_OEMAKE = "MAKEFLAGS="
-do_compile() {
-	oe_runmake all_noverify
-}
-
-do_install() {
-	oe_runmake DESTDIR=${D} install
-	install -d ${D}/usr/lib/crda/
-	install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
-}
-
-SRC_URI[crda.md5sum] = "5226f65aebacf94baaf820f8b4e06df4"
-SRC_URI[crda.sha256sum] = "e469348a5d0bb933df31995869130f68901de9be02e666437f52125698851864"
-SRC_URI[reg.md5sum] = "1535e98bcaba732e2f8e8f62dac6f369"
-SRC_URI[reg.sha256sum] = "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe01011a318b3dceaba33b"
-
-FILES_${PN} += "\
-	/lib/udev/rules.d/85-regulatory.rules \
-	/usr/lib/crda/regulatory.bin \
-	"
-- 
1.7.0.4


