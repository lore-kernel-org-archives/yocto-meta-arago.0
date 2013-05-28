Return-Path: <a0221004@ares-ubuntu>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F33E052A1C
	for <meta-arago@arago-project.org>;
	Tue, 28 May 2013 18:59:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4SIxriw032550
	for <meta-arago@arago-project.org>; Tue, 28 May 2013 13:59:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4SIxrtN017436
	for <meta-arago@arago-project.org>; Tue, 28 May 2013 13:59:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 28 May 2013 13:59:52 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r4SIxqwt032727;	Tue, 28 May 2013 13:59:52 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UhP7g-0004ZH-JT;
	Tue, 28 May 2013 14:59:52 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 May 2013 14:59:50 -0400
Message-ID: <1369767590-17499-1-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Jingting Zhou <zhoujt@ti.com>
Subject: [PATCH 2/2] syslog-ng: added another plugin package
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
X-List-Received-Date: Tue, 28 May 2013 18:59:56 -0000
Content-Type: text/plain

From: Jingting Zhou <zhoujt@ti.com>

Note that an extra layer of directory needs to be added to include the so files in the plugin package. Without it, there will be no so files in the plugin package. And also some config file update because of the extra layer.

Signed-off-by: Jingting Zhou <zhoujt@ti.com>
---
 .../recipes-bsp/syslog-ng/syslog-ng.inc            |   21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
index 584e4a4..ae85cf8 100755
--- a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 inherit autotools
 
@@ -25,6 +25,7 @@ EXTRA_OECONF = " \
   --disable-linux-caps \
   --disable-pcre \
   --disable-sql \
+  --disable-tcp-wrapper \
 "
 
 do_configure_prepend() {
@@ -33,6 +34,13 @@ do_configure_prepend() {
 
 # rename modules.conf because it breaks update-modules 
 # see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
+
+do_compile_prepend() { 
+	sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\"/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/" ${WORKDIR}/syslog-ng-3.2.5/config.h 
+}
+
+# changed the default PATH_MODULEDIR, added an extra level
+
 do_install_append() {
         mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
         sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
@@ -40,13 +48,22 @@ do_install_append() {
         install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+	mkdir ${D}/${libdir}/syslog-ng/plugins/
+	mv ${D}/${libdir}/syslog-ng/*.so ${D}/${libdir}/syslog-ng/plugins/
 }
 
+PACKAGES += "${PN}-plugins"
+FILES_${PN}-plugins += "${libdir}/syslog-ng/plugins/*.so"
+INSANE_SKIP_${PN}-plugins = "dev-so"
+
+# somehow the yocto doesn't allow so files in "${libdir}/syslog-ng/*.so", even for the -plugin package, so add another plugins level as in strongswan package
+# Without this additional level, there is no .so files in the dir libdir/syslog-ng/, for the -plugin package
+ 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
+            ${datadir}/${BPN} \
             ${datadir}/include/scl/ ${datadir}/xsd"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
 CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
-- 
1.7.9.5


