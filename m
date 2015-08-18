Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id A67FF529AC
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2015 19:39:04 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTA005YVMK19SE0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 18 Aug 2015 14:38:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=fFuYLBRKINfKk58sjCMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7F341161B46;	Tue,
	18 Aug 2015 15:38:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 18 Aug 2015 15:38:24 -0400
Message-id: <1439926704-22149-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] qtbase: bbappend version agnostic, workaround for font install
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
X-List-Received-Date: Tue, 18 Aug 2015 19:39:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{qtbase_5.4.1.bbappend => qtbase_%.bbappend}   |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_5.4.1.bbappend => qtbase_%.bbappend} (81%)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
similarity index 81%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index d6e3f4d..0819af3 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -5,7 +5,7 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago7"
+PR_append = "-arago8"
 
 QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -41,6 +41,15 @@ do_install_append () {
     install -m 0644 ${WORKDIR}/${QT_ENV} ${D}${sysconfdir}/profile.d/qt_env.sh
 }
 
+do_install_prepend () {
+    # install fonts manually if they are missing
+    if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
+        mkdir -p ${D}/${OE_QMAKE_PATH_LIBS}/fonts
+        cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts
+        chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
+    fi
+}
+
 PACKAGES =+ "${PN}-conf"
 
 FILES_${PN}-conf = "${sysconfdir}/profile.d/qt_env.sh"
-- 
1.7.9.5


