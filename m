Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5D46C529D5
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 18:19:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EIJF9q018189
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 13:19:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EIJFZn008381
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 13:19:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 13:19:15 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7EIJEwb028833;	Thu, 14 Aug 2014 13:19:14 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7EIJCJG013320;	Thu, 14 Aug 2014 23:49:13 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Aug 2014 13:19:07 -0500
Message-ID: <1408040350-30527-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] arago-qt4: Add rotation to global environment variable script
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
X-List-Received-Date: Thu, 14 Aug 2014 18:19:17 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* AM37x evm requires the screen to be rotated 90 degrees to look correct.
* Add the environment variable that changes this only for am37x evm
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
index 0f5e117..57ced60 100644
--- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -1,7 +1,7 @@
 # Common file for patches or tweaks that are needed by qt4-embedded and
 # qt4-embedded-gles
 
-PR := "${PR}-arago7"
+PR := "${PR}-arago8"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
@@ -18,3 +18,8 @@ SRC_URI += "file://0001-PATCH-make-demos-maximized-for-TISDK-use.patch \
             file://0002-qwslock-messages.patch \
             file://qte.sh \
 "
+
+# Rotate the display only for am37x_evm
+do_install_prepend_am37x-evm () {
+    echo "export QWS_DISPLAY="transformed:Rot90" >> ${WORKDIR}/qte.sh
+}
-- 
1.7.9.5


