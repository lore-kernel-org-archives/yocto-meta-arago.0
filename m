Return-Path: <a0221004@ares-ubuntu>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C7DD652972
	for <meta-arago@arago-project.org>;
	Thu,  2 May 2013 16:24:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42GO1uZ030303
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 11:24:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42GO0S3004871
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 11:24:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 11:24:00 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r42GO0UX006741;	Thu, 2 May 2013 11:24:00 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UXwIa-0000FI-AU;
	Thu, 02 May 2013 12:24:00 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 May 2013 12:23:58 -0400
Message-ID: <1367511838-905-1-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: zhoujt@ti.com
Subject: [PATCH] fixed the syslog-ng to work in yocto
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
X-List-Received-Date: Thu, 02 May 2013 16:24:02 -0000
Content-Type: text/plain

From: Jingting Zhou <a0221004@ares-ubuntu>

---
 .../packagegroup-arago-base-tisdk-server-extra.bb  |    1 +
 .../recipes-bsp/syslog-ng/syslog-ng.inc            |   31 ++++++++++++++++----
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 6dbf8ee..46db7c2 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -66,6 +66,7 @@ RDEPENDS_${PN} = "\
     ptpd \
     vsftpd \
     syslog-ng \	
+	syslog-ng-plugins \
     dtc \
     strongswan \ 
     strongswan-plugins \ 
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
index 584e4a4..5e3e41d 100755
--- a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 inherit autotools
 
 SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
-
+ 
 noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
 
 EXTRA_OECONF = " \
@@ -25,14 +25,25 @@ EXTRA_OECONF = " \
   --disable-linux-caps \
   --disable-pcre \
   --disable-sql \
+  --disable-tcp-wrapper \
 "
+# disabled tcp-wrapper lib
 
-do_configure_prepend() {
-        eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+do_configure_prepend() { 
+		eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
 }
 
 # rename modules.conf because it breaks update-modules 
 # see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
+
+do_compile_prepend() {
+	cd ${WORKDIR}/syslog-ng-3.2.5/
+	sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\"/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/" config.h
+	cd -
+}
+
+# changed the default PATH_MODULEDIR, added an extra level
+
 do_install_append() {
         mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
         sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
@@ -40,14 +51,23 @@ do_install_append() {
         install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+		mkdir ${D}/${libdir}/syslog-ng/plugins/
+		mv ${D}/${libdir}/syslog-ng/*.so ${D}/${libdir}/syslog-ng/plugins/
 }
 
+PACKAGES += "${PN}-plugins"
+FILES_${PN}-plugins += "${libdir}/syslog-ng/plugins/*.so"
+INSANE_SKIP_${PN}-plugins = "dev-so"
+
+# somehow the yocto doesn't allow so files in ${libdir}/syslog-ng/*.so, add another plugins level as in strongswan package
+
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
+            ${datadir}/${BPN} \
             ${datadir}/include/scl/ ${datadir}/xsd"
+			
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
 CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
 
@@ -88,3 +108,4 @@ pkg_postrm_${PN} () {
                 fi
         fi
 }
+
-- 
1.7.9.5


