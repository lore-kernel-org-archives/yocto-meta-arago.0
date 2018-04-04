Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by arago-project.org (Postfix) with ESMTP id 114E7529BA
	for <meta-arago@arago-project.org>;
	Wed,  4 Apr 2018 09:27:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38608416"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Apr 2018 17:27:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D165A48AE77D
	for <meta-arago@arago-project.org>;
	Wed,  4 Apr 2018 17:27:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 4 Apr 2018 17:27:21 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Apr 2018 17:27:27 +0800
Message-ID: <1522834047-15232-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522834047-15232-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522834047-15232-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: D165A48AE77D.A721D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] thttpd: thttpd to systemd
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
X-List-Received-Date: Wed, 04 Apr 2018 09:27:35 -0000
Content-Type: text/plain

Since the old thttpd still uses sysvinit, is not consistent with the mainstream background OSS.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../thttpd/thttpd-2.28/thttpd.conf                 | 14 +++++++
 .../thttpd/thttpd-2.28/thttpd.service              | 12 ++++++
 .../recipes-extended/thttpd/thttpd_2.28.bb         | 45 ++++++++++++++++++----
 3 files changed, 63 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.conf
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.service

diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.conf b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.conf
new file mode 100644
index 0000000..380b024
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.conf
@@ -0,0 +1,14 @@
+dir=/var/www/thttpd
+chroot
+user=thttpd   # default = nobody
+logfile=/var/log/thttpd.log
+pidfile=/var/run/thttpd.pid
+# This section _documents_ defaults in effect
+# port=80
+# nosymlink         # default = !chroot
+# novhost
+# nocgipat
+# nothrottles
+# host=0.0.0.0
+# charset=iso-8859-1
+
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.service b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.service
new file mode 100644
index 0000000..2f20663
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/thttpd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Tiny/Turbo/Throttling Web Server
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/thttpd.pid
+EnvironmentFile=-/etc/sysconfig/thttpd
+ExecStart=/usr/sbin/thttpd -C /etc/thttpd.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
index 0477509..0644677 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
@@ -12,7 +12,10 @@ SRC_URI = "http://www.acme.com/software/thttpd/thttpd-${PV}.tar.gz \
 	   file://acinclude.m4 \
 	   file://init \
 	   file://htpasswd_shared.diff \
-       file://htpasswd_getline.diff"
+	   file://htpasswd_getline.diff \
+	   file://thttpd.service \
+	   file://thttpd.conf \
+	   "
 
 S = "${WORKDIR}/thttpd-${PV}"
 
@@ -21,11 +24,26 @@ PARALLEL_MAKE = ""
 INITSCRIPT_NAME = "thttpd"
 INITSCRIPT_PARAMS = "defaults"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep useradd systemd
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r www"
+USERADD_PARAM_${PN} = "--system --home /var/www/thttpd --no-create-home \
+                       --user-group thttpd"
+
+
+SYSTEMD_SERVICE_${PN} = "thttpd.service"
+
+EXTRA_OEMAKE += "'WEBDIR=${localstatedir}/www/thttpd'"
+FILES_${PN}-dbg_append = " ${localstatedir}/www/thttpd/cgi-bin/.debug"
+FILES_${PN}_append = " ${localstatedir} \
+                       ${systemd_unitdir}/system/ \
+                     "
+
+# The distro choice determines what init scripts are installed
+EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
+EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
-EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
-FILES_${PN}-dbg_append = " ${servicedir}/www/cgi-bin/.debug"
-FILES_${PN}_append = " ${servicedir}"
 
 do_configure () {
 	install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
@@ -33,9 +51,20 @@ do_configure () {
 }
 
 do_install_append () {
-	install -d "${D}${sysconfdir}/init.d"
-	cat ${WORKDIR}/init | sed -e 's,@@SRVDIR,${servicedir}/www,g' > ${WORKDIR}/thttpd
-	install -c -m 755 ${WORKDIR}/thttpd ${D}${sysconfdir}/init.d/thttpd
+	install -d ${D}/var/www/thttpd
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/thttpd.conf ${D}${sysconfdir}/
+	# Remove sysinit script and symlinks if sysvinit is not in DISTRO_FEATURES
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	    install -d "${D}${sysconfdir}/init.d"
+	    cat ${WORKDIR}/init | sed -e 's,@@SRVDIR,${servicedir}/www,g' > ${WORKDIR}/thttpd
+	    install -c -m 755 ${WORKDIR}/thttpd ${D}${sysconfdir}/init.d/thttpd
+	fi
+
+	# Install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/index.html ${D}/var/www/thttpd/
 }
 
 
-- 
2.7.4




