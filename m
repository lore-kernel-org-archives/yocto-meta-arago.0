Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 02B56529B9
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 18:20:51 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7UIKpm3006045
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 13:20:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7UIKpbV017855
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 13:20:51 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 13:20:50 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7UIKolh007208;	Thu, 30 Aug 2012 13:20:50 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T79az-0003cn-Gc; Thu, 30 Aug 2012 13:36:01 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2012 13:36:00 -0500
Message-ID: <1346351760-13900-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] recipes: TSU exemption notice
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
X-List-Received-Date: Thu, 30 Aug 2012 18:20:52 -0000
Content-Type: text/plain

* Add TSU exemption notice to applications/libraries that require it.
* Currently investigating the current version of the different software
  to determine if a new TSU exemption is required.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../openssh/openssh_5.9p1.bbappend                 |   10 ++++++++++
 .../openssl/openssl_1.0.0i.bbappend                |   12 +++++++++++-
 .../wpa-supplicant/wpa-supplicant_git.bb           |   11 ++++++++++-
 .../dropbear/dropbear_2012.55.bbappend             |   10 ++++++++++
 4 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend
 create mode 100644 meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend
new file mode 100644
index 0000000..c0f449e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/openssh/openssh_5.9p1.bbappend
@@ -0,0 +1,10 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# This package requires TSU exemption. Any update to the version of openssh being
+# appended must be double checked to see if a new TSU exemption must be made.
+#
+# Versions of openssh that are TSU Exempted:
+# openssh-5.6p1
+
+PR_append = "-arago0"
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
index ec5e2f0..3536316 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
@@ -1,6 +1,16 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of openssl that are TSU Exempted:
+# openssl-1.0.0a
+# openssl-1.0.0d
+#
+# This package requires TSU exemption. Any update to the version of openssl being
+# appended must be double checked to see if a new TSU exemption must be made.
+
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += " \
             file://find.pl \
diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
index e810a9b..fa7792c 100644
--- a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
+++ b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
@@ -1,5 +1,14 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of wpa_supplicant that are TSU Exempted:
+# wpa_supplicant-0.7.3
+
+# This package requires TSU exemption. Any update to the version of
+# wpa_supplicant must be double checked to see if a new TSU exemption must be made.
+
 require wpa-supplicant-0.7.inc
 
 SRCREV = "ol_R5.00.18"
-PR = "r0-arago0+gitr${SRCPV}"
+PR = "r0-arago1+gitr${SRCPV}"
 PV = "0.7.3+0.8.0-rc"
diff --git a/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend
new file mode 100644
index 0000000..f766014
--- /dev/null
+++ b/meta-arago-distro/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -0,0 +1,10 @@
+################################################################################
+######################### TSU EXEMPTION REQUIRED ###############################
+################################################################################
+# Versions of dropbear that are TSU Exempted:
+# dropbear-0.51
+#
+# This package requires TSU exemption. Any update to the version of dropbear being
+# appended must be double checked to see if a new TSU exemption must be made.
+
+PR_append = "-arago0"
-- 
1.7.0.4


