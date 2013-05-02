Return-Path: <a0221004@ares-ubuntu>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6072D52972
	for <meta-arago@arago-project.org>;
	Thu,  2 May 2013 16:23:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42GNUwu030011
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 11:23:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42GNUAp004508
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 11:23:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 11:23:30 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r42GNUx0006601;	Thu, 2 May 2013 11:23:30 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UXwI5-0000EO-S2;
	Thu, 02 May 2013 12:23:29 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 May 2013 12:23:22 -0400
Message-ID: <1367511802-855-1-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: zhoujt@ti.com
Subject: [PATCH] added syslog-ng from meta-openembedded
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
X-List-Received-Date: Thu, 02 May 2013 16:23:31 -0000
Content-Type: text/plain

From: Jingting Zhou <a0221004@ares-ubuntu>

---
 .../recipes-bsp/syslog-ng/files/initscript         |   45 ++++++
 .../recipes-bsp/syslog-ng/files/syslog-ng.conf     |  155 ++++++++++++++++++++
 .../recipes-bsp/syslog-ng/syslog-ng.inc            |   90 ++++++++++++
 .../recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb       |   10 ++
 4 files changed, 300 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
 create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
 create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
 create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb

diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript b/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
new file mode 100755
index 0000000..b95e8ad
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
@@ -0,0 +1,45 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/syslog-ng and type
+# > update-rc.d syslog-ng defaults 5
+#
+
+
+syslog_ng=/usr/sbin/syslog-ng
+test -x "$syslog_ng" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting syslog-ng:"
+    start-stop-daemon --start --quiet --exec $syslog_ng
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping syslog-ng:"
+    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
+    ;;
+  restart)
+    echo "Stopping syslog-ng:"
+    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    echo -n "Waiting for syslog-ng to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting syslog-ng:"
+    start-stop-daemon --start --quiet --exec $syslog_ng
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf b/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
new file mode 100755
index 0000000..e760dfb
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
@@ -0,0 +1,155 @@
+@version: 3.2
+#
+# Syslog-ng configuration file, compatible with default Debian syslogd
+# installation. Originally written by anonymous (I can't find his name)
+# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
+
+# First, set some global options.
+options { long_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
+	  owner("root"); group("adm"); perm(0640); stats_freq(0);
+	  bad_hostname("^gconfd$");
+};
+
+########################
+# Sources
+########################
+# This is the default behavior of sysklogd package
+# Logs may come from unix stream, but not from another machine.
+#
+source s_src { unix-dgram("/dev/log"); internal();
+       	     file("/proc/kmsg" program_override("kernel"));
+};
+
+# If you wish to get logs from remote machine you should uncomment
+# this and comment the above source line.
+#
+#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encrypt(allow)); };
+
+########################
+# Destinations
+########################
+# First some standard logfile
+#
+destination d_auth { file("/var/log/auth.log"); };
+destination d_cron { file("/var/log/cron.log"); };
+destination d_daemon { file("/var/log/daemon.log"); };
+destination d_kern { file("/var/log/kern.log"); };
+destination d_lpr { file("/var/log/lpr.log"); };
+destination d_mail { file("/var/log/mail.log"); };
+destination d_syslog { file("/var/log/syslog"); };
+destination d_user { file("/var/log/user.log"); };
+destination d_uucp { file("/var/log/uucp.log"); };
+
+# This files are the log come from the mail subsystem.
+#
+destination d_mailinfo { file("/var/log/mail/mail.info"); };
+destination d_mailwarn { file("/var/log/mail/mail.warn"); };
+destination d_mailerr { file("/var/log/mail/mail.err"); };
+
+# Logging for INN news system
+#
+destination d_newscrit { file("/var/log/news/news.crit"); };
+destination d_newserr { file("/var/log/news/news.err"); };
+destination d_newsnotice { file("/var/log/news/news.notice"); };
+
+# Some `catch-all' logfiles.
+#
+destination d_debug { file("/var/log/debug"); };
+destination d_error { file("/var/log/error"); };
+destination d_messages { file("/var/log/messages"); };
+
+# The root's console.
+#
+destination d_console { usertty("root"); };
+
+# Virtual console.
+#
+destination d_console_all { file("/dev/tty10"); };
+
+# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
+# you must invoke nsole' with the -file' option:
+#
+#    $ xconsole -file /dev/xconsole [...]
+#
+destination d_xconsole { pipe("/dev/xconsole"); };
+
+# Send the messages to an other host
+#
+#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt(on) log_fifo_size(1000)); };
+
+# Debian only
+destination d_ppp { file("/var/log/ppp.log"); };
+
+########################
+# Filters
+########################
+# Here's come the filter options. With this rules, we can set which 
+# message go where.
+
+filter f_dbg { level(debug); };
+filter f_info { level(info); };
+filter f_notice { level(notice); };
+filter f_warn { level(warn); };
+filter f_err { level(err); };
+filter f_crit { level(crit .. emerg); };
+
+filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
+filter f_error { level(err .. emerg) ; };
+filter f_messages { level(info,notice,warn) and 
+                    not facility(auth,authpriv,cron,daemon,mail,news); };
+
+filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
+filter f_cron { facility(cron) and not filter(f_debug); };
+filter f_daemon { facility(daemon) and not filter(f_debug); };
+filter f_kern { facility(kern) and not filter(f_debug); };
+filter f_lpr { facility(lpr) and not filter(f_debug); };
+filter f_local { facility(local0, local1, local3, local4, local5,
+                        local6, local7) and not filter(f_debug); };
+filter f_mail { facility(mail) and not filter(f_debug); };
+filter f_news { facility(news) and not filter(f_debug); };
+filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_debug); };
+filter f_user { facility(user) and not filter(f_debug); };
+filter f_uucp { facility(uucp) and not filter(f_debug); };
+
+filter f_cnews { level(notice, err, crit) and facility(news); };
+filter f_cother { level(debug, info, notice, warn) or facility(daemon, mail); };
+
+filter f_ppp { facility(local2) and not filter(f_debug); };
+filter f_console { level(warn .. emerg); };
+
+########################
+# Log paths
+########################
+log { source(s_src); filter(f_auth); destination(d_auth); };
+log { source(s_src); filter(f_cron); destination(d_cron); };
+log { source(s_src); filter(f_daemon); destination(d_daemon); };
+log { source(s_src); filter(f_kern); destination(d_kern); };
+log { source(s_src); filter(f_lpr); destination(d_lpr); };
+log { source(s_src); filter(f_syslog3); destination(d_syslog); };
+log { source(s_src); filter(f_user); destination(d_user); };
+log { source(s_src); filter(f_uucp); destination(d_uucp); };
+
+log { source(s_src); filter(f_mail); destination(d_mail); };
+#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailinfo); };
+#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwarn); };
+#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr); };
+
+log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscrit); };
+log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr); };
+log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsnotice); };
+#log { source(s_src); filter(f_cnews); destination(d_console_all); };
+#log { source(s_src); filter(f_cother); destination(d_console_all); };
+
+#log { source(s_src); filter(f_ppp); destination(d_ppp); };
+
+log { source(s_src); filter(f_debug); destination(d_debug); };
+log { source(s_src); filter(f_error); destination(d_error); };
+log { source(s_src); filter(f_messages); destination(d_messages); };
+
+log { source(s_src); filter(f_console); destination(d_console_all);
+				    destination(d_xconsole); };
+log { source(s_src); filter(f_crit); destination(d_console); };
+
+# All messages send to a remote site
+#
+#log { source(s_src); destination(d_net); };
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
new file mode 100755
index 0000000..584e4a4
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
@@ -0,0 +1,90 @@
+DESCRIPTION = "Alternative system logger daemon"
+DEPENDS = "libol flex eventlog glib-2.0"
+LICENSE = "GPL LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
+
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+
+INC_PR = "r9"
+
+inherit autotools
+
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
+
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
+
+EXTRA_OECONF = " \
+  --with-libnet=${STAGING_BINDIR_CROSS} \
+  --enable-dynamic-linking \
+  ${noipv6} \
+  --enable-ssl \
+  --disable-sub-streams \
+  --disable-pacct \
+  --disable-linux-caps \
+  --disable-pcre \
+  --disable-sql \
+"
+
+do_configure_prepend() {
+        eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+}
+
+# rename modules.conf because it breaks update-modules 
+# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
+do_install_append() {
+        mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
+        sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
+        install -d ${D}/${sysconfdir}/${PN}
+        install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
+        install -d ${D}/${sysconfdir}/init.d
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+}
+
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* \
+            ${base_libdir}/*${SOLIBS} \
+            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
+            ${datadir}/include/scl/ ${datadir}/xsd"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
+CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
+
+pkg_postinst_${PN} () {
+        /etc/init.d/syslog stop
+        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
+
+        if test "x$D" != "x"; then
+                OPT="-r $D"
+        else
+                OPT="-s"
+        fi
+        # remove all rc.d-links potentially created from alternative
+        # syslog packages before creating new ones
+        update-rc.d $OPT -f syslog remove
+        update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
+}
+
+pkg_prerm_${PN} () {
+        if test "x$D" = "x"; then
+                if test "$1" = "upgrade" -o "$1" = "remove"; then
+                        /etc/init.d/syslog stop
+                fi
+        fi
+
+        update-alternatives --remove syslog-init syslog.${PN}
+}
+
+pkg_postrm_${PN} () {
+        if test "x$D" != "x"; then
+                OPT="-r $D"
+        else
+                OPT=""
+        fi
+        if test "$1" = "remove" -o "$1" = "purge"; then
+                if ! test -e "/etc/init.d/syslog"; then
+                        update-rc.d $OPT syslog remove
+                fi
+        fi
+}
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
new file mode 100755
index 0000000..62faa83
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
@@ -0,0 +1,10 @@
+require syslog-ng.inc
+PR = "${INC_PR}.1"
+
+SRC_URI += " \
+  file://syslog-ng.conf \
+  file://initscript \
+"
+
+SRC_URI[md5sum] = "60737452ce898f9dc7170dfdc9bfd732"
+SRC_URI[sha256sum] = "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9eca79d9144eeefa89"
-- 
1.7.9.5


