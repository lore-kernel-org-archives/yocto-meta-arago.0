Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CB23E52A69
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 05:46:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1Q5kS0H017504
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2014 23:46:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1Q5kS0R012571
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2014 23:46:28 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 25 Feb 2014 23:46:27 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1Q5kR6Q018552;	Tue, 25 Feb 2014 23:46:27 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Feb 2014 00:46:17 -0500
Message-ID: <1393393577-30863-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393393577-30863-1-git-send-email-sam.nelson@ti.com>
References: <1393393577-30863-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] syslog-ng: Added bbappend recipe to make it work
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
X-List-Received-Date: Wed, 26 Feb 2014 05:46:29 -0000
Content-Type: text/plain

- Added debug files to -dbg package
- organised plugins under plugins directory

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../syslog-ng/syslog-ng_3.2.5.bbappend             |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend

diff --git a/meta-arago-extras/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-arago-extras/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend
new file mode 100644
index 0000000..6d54980
--- /dev/null
+++ b/meta-arago-extras/recipes-support/syslog-ng/syslog-ng_3.2.5.bbappend
@@ -0,0 +1,19 @@
+FILES_${PN}-dbg += "${libdir}/syslog-ng/plugins/.debug"
+
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+    ${base_bindir}/* ${base_sbindir}/* \
+    ${base_libdir}/*${SOLIBS} \
+    ${datadir}/${BPN} \
+    ${datadir}/include/scl/ ${datadir}/xsd"
+
+do_compile_prepend() {
+	cd ${WORKDIR}/syslog-ng-3.2.5/
+	sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\"/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/" config.h
+	cd -
+}
+
+do_install_append() {
+    install -d ${D}/${libdir}/syslog-ng/plugins/
+    install ${D}/${libdir}/syslog-ng/*.so ${D}/${libdir}/syslog-ng/plugins/
+}
-- 
1.7.9.5


