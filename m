Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 87B48529A8
	for <meta-arago@arago-project.org>;
	Fri,  3 Apr 2020 18:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A674940A35;
	Fri,  3 Apr 2020 18:30:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YN1a76zXJZwv; Fri,  3 Apr 2020 18:30:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AF7D2400E7;
	Fri,  3 Apr 2020 18:30:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0165C17126C;
	Fri,  3 Apr 2020 14:30:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  3 Apr 2020 14:30:19 -0400
Message-Id: <1585938619-24632-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] optee: remove client and test bbappends to use upstream versions
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
X-List-Received-Date: Fri, 03 Apr 2020 18:32:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-client.bbappend   | 25 ----------------------
 .../recipes-security/optee/optee-test_git.bbappend |  9 --------
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-client.bbappend
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
deleted file mode 100644
index 39152f8..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ /dev/null
@@ -1,25 +0,0 @@
-PR_append = ".arago0"
-
-SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
-           file://tee-supplicant.service"
-BRANCH = "ti-optee-client"
-SRCREV = "2e526f4be1d471706915ba1e0044bcbe7c0b2626"
-
-do_install() {
-    oe_runmake install
-
-    install -D -p -m0755 ${S}/out/export${sbindir}/tee-supplicant ${D}${sbindir}/tee-supplicant
-
-    install -D -p -m0644 ${S}/out/export${libdir}/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
-
-    install -d ${D}${includedir}
-    install -p -m0644 ${S}/out/export${includedir}/*.h ${D}${includedir}
-
-    sed -i -e s:/etc:${sysconfdir}:g \
-           -e s:/usr/bin:${bindir}:g \
-              ${WORKDIR}/tee-supplicant.service
-
-    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
-}
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
deleted file mode 100644
index 913e8b5..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-DEPENDS += "python3-pycryptodomex-native"
-
-PR_append = ".arago0"
-
-SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
-BRANCH = "ti-optee-test"
-SRCREV = "7c68d7b098b19363ada3c48b133484b018254fb1"
-- 
2.7.4


