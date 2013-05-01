Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A09C052A1B
	for <meta-arago@arago-project.org>;
	Wed,  1 May 2013 22:19:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r41MJnaF008150
	for <meta-arago@arago-project.org>; Wed, 1 May 2013 17:19:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r41MJnoq012312
	for <meta-arago@arago-project.org>; Wed, 1 May 2013 17:19:49 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 1 May 2013 17:19:48 -0500
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: patch to fix syslog-ng module-path problem in yocto
Thread-Index: Ac5Guf9cu6tmLB8MSKOdwCxx6uhTGg==
Date: Wed, 1 May 2013 22:19:47 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E3944A28@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: patch to fix syslog-ng module-path problem in yocto
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
X-List-Received-Date: Wed, 01 May 2013 22:19:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E3944A28DFLE08entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E3944A28DFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey all, the current syslog-ng recipe in meta-openembedded have the followi=
ng problem,

root@keystone-evm:/usr/lib/syslog-ng# syslog-ng
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'syslogformat'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'basicfuncs'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'afsocket'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'affile'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'afprog'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'afuser'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'dbparser'
Plugin module not found in 'module-path'; module-path=3D'/usr/lib/syslog-ng=
', modu                    le=3D'csvparser'
Error parsing source, source plugin unix-dgram not found in /etc/syslog-ng.=
conf                     at line 19, column 16:

source s_src { unix-dgram("/dev/log"); internal();

This is because the yocto doesn't allow the so files in the main package(un=
der /usr/lib/syslog-ng/).

Here's the patch,

From 6d6e03140ed67d9d1c4bb2fb79929a2a99bfe708 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Wed, 1 May 2013 18:12:31 -0400
Subject: [PATCH] fixed the syslog-ng module-path problem

---
.../packagegroup-arago-base-tisdk-server-extra.bb  |    3 +-
.../recipes-bsp/syslog-ng/files/initscript         |   45 ++++++
.../recipes-bsp/syslog-ng/files/syslog-ng.conf     |  155 +++++++++++++++++=
+++
.../recipes-bsp/syslog-ng/syslog-ng.inc            |  106 +++++++++++++
.../recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb       |   11 ++
5 files changed, 319 insertions(+), 1 deletion(-)
create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.=
conf
create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.=
bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-base-tisdk-server-extra.bb
index 6dbf8ee..650b190 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-=
tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-=
tisdk-server-extra.bb
@@ -65,7 +65,8 @@ RDEPENDS_${PN} =3D "\
     ${ARAGO_NDISC6} \
     ptpd \
     vsftpd \
-    syslog-ng \
+    syslog-ng \
+    syslog-ng-plugins \
     dtc \
     strongswan \
     strongswan-plugins \
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript b/met=
a-arago-extras/recipes-bsp/syslog-ng/files/initscript
new file mode 100755
index 0000000..9adb4cc
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
+syslog_ng=3D/usr/sbin/syslog-ng
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
+    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-re=
load}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf b=
/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
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
+               owner("root"); group("adm"); perm(0640); stats_freq(0);
+               bad_hostname("^gconfd$");
+};
+
+########################
+# Sources
+########################
+# This is the default behavior of sysklogd package
+# Logs may come from unix stream, but not from another machine.
+#
+source s_src { unix-dgram("/dev/log"); internal();
+                  file("/proc/kmsg" program_override("kernel"));
+};
+
+# If you wish to get logs from remote machine you should uncomment
+# this and comment the above source line.
+#
+#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encr=
ypt(allow)); };
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
+#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt=
(on) log_fifo_size(1000)); };
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
+filter f_debug { level(debug) and not facility(auth, authpriv, news, mail)=
; };
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
+filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_deb=
ug); };
+filter f_user { facility(user) and not filter(f_debug); };
+filter f_uucp { facility(uucp) and not filter(f_debug); };
+
+filter f_cnews { level(notice, err, crit) and facility(news); };
+filter f_cother { level(debug, info, notice, warn) or facility(daemon, mai=
l); };
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
+#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailin=
fo); };
+#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwa=
rn); };
+#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr=
); };
+
+log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscri=
t); };
+log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr)=
; };
+log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsn=
otice); };
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
+                                                                 destinati=
on(d_xconsole); };
+log { source(s_src); filter(f_crit); destination(d_console); };
+
+# All messages send to a remote site
+#
+#log { source(s_src); destination(d_net); };
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta-a=
rago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
new file mode 100755
index 0000000..69157b1
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
@@ -0,0 +1,106 @@
+DESCRIPTION =3D "Alternative system logger daemon"
+DEPENDS =3D "libol flex eventlog glib-2.0"
+LICENSE =3D "GPL LGPL"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7ec1bcc46f28b11f4722e20d9b7dd4d=
5"
+
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+RDEPENDS_${PN} +=3D " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "no=
ne", "", "update-rc.d", d)}"
+
+INC_PR =3D "r10"
+
+inherit autotools
+
+SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV=
}/source/${PN}_${PV}.tar.gz"
+
+noipv6 =3D "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv=
6', d)}"
+
+EXTRA_OECONF =3D " \
+  --with-libnet=3D${STAGING_BINDIR_CROSS} \
+  --enable-dynamic-linking \
+  ${noipv6} \
+  --enable-ssl \
+  --disable-sub-streams \
+  --disable-pacct \
+  --disable-linux-caps \
+  --disable-pcre \
+  --disable-sql \
+  --disable-tcp-wrapper \
+"
+
+do_configure_prepend() {
+                             eval "${@base_contains('DISTRO_FEATURES', 'la=
rgefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BIT=
S=3D64//" ${S}/configure.in', d)}"
+}
+
+# rename modules.conf because it breaks update-modules
+# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October=
/035537.html
+
+do_compile_prepend() {
+             cd ${WORKDIR}/syslog-ng-3.2.5/
+             sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\"/=
\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/" config.h
+             cd -
+}
+
+do_install_append() {
+        mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.=
conf
+        sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" $=
{D}/${sysconfdir}/scl.conf
+        install -d ${D}/${sysconfdir}/${PN}
+        install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
+        install -d ${D}/${sysconfdir}/init.d
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/sys=
log.${PN}
+                             mkdir ${D}/${libdir}/syslog-ng/plugins/
+                             mv ${D}/${libdir}/syslog-ng/*.so ${D}/${libdi=
r}/syslog-ng/plugins/
+}
+
+PACKAGES +=3D "${PN}-plugins"
+FILES_${PN}-plugins +=3D "${libdir}/syslog-ng/plugins/*.so"
+INSANE_SKIP_${PN}-plugins =3D "dev-so"
+
+FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${=
SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* \
+            ${base_libdir}/*${SOLIBS} \
+            ${datadir}/${BPN} \
+            ${datadir}/include/scl/ ${datadir}/xsd"
+
+FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSD=
EV}"
+CONFFILES_${PN} =3D "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sys=
confdir}/scl-modules.conf"
+
+pkg_postinst_${PN} () {
+        /etc/init.d/syslog stop
+        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-i=
nit syslog.${PN} 200
+
+        if test "x$D" !=3D "x"; then
+                OPT=3D"-r $D"
+        else
+                OPT=3D"-s"
+        fi
+        # remove all rc.d-links potentially created from alternative
+        # syslog packages before creating new ones
+        update-rc.d $OPT -f syslog remove
+        update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
+}
+
+pkg_prerm_${PN} () {
+        if test "x$D" =3D "x"; then
+                if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
+                        /etc/init.d/syslog stop
+                fi
+        fi
+
+        update-alternatives --remove syslog-init syslog.${PN}
+}
+
+pkg_postrm_${PN} () {
+        if test "x$D" !=3D "x"; then
+                OPT=3D"-r $D"
+        else
+                OPT=3D""
+        fi
+        if test "$1" =3D "remove" -o "$1" =3D "purge"; then
+                if ! test -e "/etc/init.d/syslog"; then
+                        update-rc.d $OPT syslog remove
+                fi
+        fi
+}
+
diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb b/m=
eta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
new file mode 100755
index 0000000..5446658
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
@@ -0,0 +1,11 @@
+require syslog-ng.inc
+PR =3D "${INC_PR}.1"
+
+SRC_URI +=3D " \
+  file://syslog-ng.conf \
+  file://initscript \
+"
+
+SRC_URI[md5sum] =3D "60737452ce898f9dc7170dfdc9bfd732"
+SRC_URI[sha256sum] =3D "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9eca=
79d9144eeefa89"
+
\ No newline at end of file
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E3944A28DFLE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hey all, the current syslog-ng recipe in meta-openem=
bedded have the following problem,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@keystone-evm:/usr/lib/syslog-ng# syslog-ng<o:p>=
</o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'syslogformat'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'basicfuncs'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'afsocket'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'affile'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'afprog'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'afuser'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le=3D=
'dbparser'<o:p></o:p></p>
<p class=3D"MsoNormal">Plugin module not found in 'module-path'; module-pat=
h=3D'/usr/lib/syslog-ng', modu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;le=3D=
'csvparser'<o:p></o:p></p>
<p class=3D"MsoNormal">Error parsing source, source plugin unix-dgram not f=
ound in /etc/syslog-ng.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; at=
 line 19, column 16:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">source s_src { unix-dgram(&quot;/dev/log&quot;); int=
ernal();<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is because the yocto doesn&#8217;t allow the so=
 files in the main package(under /usr/lib/syslog-ng/).
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here&#8217;s the patch,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From 6d6e03140ed67d9d1c4bb2fb79929a2a99bfe708 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Wed, 1 May 2013 18:12:31 -0400<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] fixed the syslog-ng module-path pro=
blem<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../packagegroup-arago-base-tisdk-server-extra.bb&nb=
sp; |&nbsp;&nbsp;&nbsp; 3 &#43;-<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-bsp/syslog-ng/files/initscript&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 45 &#43;&#43;&#43;&#43=
;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-bsp/syslog-ng/files/syslog-ng.conf&nbsp;=
&nbsp;&nbsp;&nbsp; |&nbsp; 155 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-bsp/syslog-ng/syslog-ng.inc&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 106 &#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">.../recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 11 &#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">5 files changed, 319 insertions(&#43;), 1 deletion(-=
)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-extras/recipes-bsp/sys=
log-ng/files/initscript<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-extras/recipes-bsp/sys=
log-ng/files/syslog-ng.conf<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-extras/recipes-bsp/sys=
log-ng/syslog-ng.inc<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-extras/recipes-bsp/sys=
log-ng/syslog-ng_3.2.5.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-core/packageg=
roups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/rec=
ipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb<o:p><=
/o:p></p>
<p class=3D"MsoNormal">index 6dbf8ee..650b190 100755<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-arago-distro/recipes-core/packagegroups/p=
ackagegroup-arago-base-tisdk-server-extra.bb<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-core/pac=
kagegroups/packagegroup-arago-base-tisdk-server-extra.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -65,7 &#43;65,8 @@ RDEPENDS_${PN} =3D &quot;\<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; ${ARAGO_NDISC6} \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; ptpd \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; vsftpd \<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; syslog-ng \&nbsp;&nbsp;&nbsp; <o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; syslog-ng \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; syslog-ng-plugins \&nbsp;&nb=
sp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; dtc \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; strongswan \ <o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;strongswan-plugins \ <=
o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-extras/recipes-bsp/syslog-ng=
/files/initscript b/meta-arago-extras/recipes-bsp/syslog-ng/files/initscrip=
t<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..9adb4cc<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/sysl=
og-ng/files/initscript<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,45 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#! /bin/sh<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# This is an init script for openembedded<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;# Copy it to /etc/init.d/syslog-ng and type<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;# &gt; update-rc.d syslog-ng defaults 5<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;syslog_ng=3D/usr/sbin/syslog-ng <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;test -x &quot;$syslog_ng&quot; || exit 0<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;case &quot;$1&quot; in<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; start)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo -n &quot;Starting syslo=
g-ng:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; start-stop-daemon --start --=
quiet --exec $syslog_ng<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo &quot;.&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; stop)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo -n &quot;Stopping syslo=
g-ng:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; start-stop-daemon --stop --q=
uiet --pidfile /var/run/syslog-ng.pid<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo &quot;.&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; reload|force-reload)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; start-stop-daemon --stop --q=
uiet --signal 1 --exec $syslog_ng<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; restart)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo &quot;Stopping syslog-n=
g:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; start-stop-daemon --stop --q=
uiet --pidfile /var/run/syslog-ng.pid<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo -n &quot;Waiting for sy=
slog-ng to die off&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; for i in 1 2 3 ;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; do<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slee=
p 1<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo=
 -n &quot;.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; done<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo &quot;&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo -n &quot;Starting syslo=
g-ng:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; start-stop-daemon --start --=
quiet --exec $syslog_ng<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo &quot;.&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; ;;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; *)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; echo &quot;Usage: /etc/init.=
d/syslog-ng {start|stop|reload|restart|force-reload}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; exit 1<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;esac<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;exit 0<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-extras/recipes-bsp/syslog-ng=
/files/syslog-ng.conf b/meta-arago-extras/recipes-bsp/syslog-ng/files/syslo=
g-ng.conf<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..e760dfb<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/sysl=
og-ng/files/syslog-ng.conf<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,155 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;@version: 3.2<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Syslog-ng configuration file, compatible with=
 default Debian syslogd<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# installation. Originally written by anonymous=
 (I can't find his name)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Revised, and rewrited by me (SZALAY Attila &l=
t;sasa@debian.org&gt;)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# First, set some global options.<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;options { long_hostnames(off); flush_lines(0); =
use_dns(no); use_fqdn(no);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; owner(&quot;root&quot;); group(&quot;adm&q=
uot;); perm(0640); stats_freq(0);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; bad_hostname(&quot;^gconfd$&quot;);<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Sources<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# This is the default behavior of sysklogd pack=
age<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Logs may come from unix stream, but not from =
another machine.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;source s_src { unix-dgram(&quot;/dev/log&quot;)=
; internal();<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file(&quot;/proc/kmsg&qu=
ot; program_override(&quot;kernel&quot;));<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;};<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# If you wish to get logs from remote machine y=
ou should uncomment<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# this and comment the above source line.<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#source s_net { tcp(ip(127.0.0.1) port(1000) au=
thentication(required) encrypt(allow)); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Destinations<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# First some standard logfile<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_auth { file(&quot;/var/log/auth.l=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_cron { file(&quot;/var/log/cron.l=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_daemon { file(&quot;/var/log/daem=
on.log&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_kern { file(&quot;/var/log/kern.l=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_lpr { file(&quot;/var/log/lpr.log=
&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_mail { file(&quot;/var/log/mail.l=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_syslog { file(&quot;/var/log/sysl=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_user { file(&quot;/var/log/user.l=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_uucp { file(&quot;/var/log/uucp.l=
og&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# This files are the log come from the mail sub=
system.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_mailinfo { file(&quot;/var/log/ma=
il/mail.info&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_mailwarn { file(&quot;/var/log/ma=
il/mail.warn&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_mailerr { file(&quot;/var/log/mai=
l/mail.err&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Logging for INN news system<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_newscrit { file(&quot;/var/log/ne=
ws/news.crit&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_newserr { file(&quot;/var/log/new=
s/news.err&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_newsnotice { file(&quot;/var/log/=
news/news.notice&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Some `catch-all' logfiles.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_debug { file(&quot;/var/log/debug=
&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_error { file(&quot;/var/log/error=
&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_messages { file(&quot;/var/log/me=
ssages&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# The root's console.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_console { usertty(&quot;root&quot=
;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Virtual console.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_console_all { file(&quot;/dev/tty=
10&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# The named pipe /dev/xconsole is for the nsole=
' utility.&nbsp; To use it,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# you must invoke nsole' with the -file' option=
:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#&nbsp;&nbsp;&nbsp; $ xconsole -file /dev/xcons=
ole [...]<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_xconsole { pipe(&quot;/dev/xconso=
le&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Send the messages to an other host<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#destination d_net { tcp(&quot;127.0.0.1&quot; =
port(1000) authentication(on) encrypt(on) log_fifo_size(1000)); };<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Debian only<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;destination d_ppp { file(&quot;/var/log/ppp.log=
&quot;); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Filters<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Here's come the filter options. With this rul=
es, we can set which
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# message go where.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_dbg { level(debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_info { level(info); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_notice { level(notice); };<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;filter f_warn { level(warn); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_err { level(err); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_crit { level(crit .. emerg); };<o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_debug { level(debug) and not facility(=
auth, authpriv, news, mail); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_error { level(err .. emerg) ; };<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;filter f_messages { level(info,notice,warn) and=
 <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not fac=
ility(auth,authpriv,cron,daemon,mail,news); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_auth { facility(auth, authpriv) and no=
t filter(f_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_cron { facility(cron) and not filter(f=
_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_daemon { facility(daemon) and not filt=
er(f_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_kern { facility(kern) and not filter(f=
_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_lpr { facility(lpr) and not filter(f_d=
ebug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_local { facility(local0, local1, local=
3, local4, local5,<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; local6, local7) and not filter(f_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_mail { facility(mail) and not filter(f=
_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_news { facility(news) and not filter(f=
_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_syslog3 { not facility(auth, authpriv,=
 mail) and not filter(f_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_user { facility(user) and not filter(f=
_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_uucp { facility(uucp) and not filter(f=
_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_cnews { level(notice, err, crit) and f=
acility(news); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_cother { level(debug, info, notice, wa=
rn) or facility(daemon, mail); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_ppp { facility(local2) and not filter(=
f_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;filter f_console { level(warn .. emerg); };<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Log paths<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;########################<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_auth); destinatio=
n(d_auth); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_cron); destinatio=
n(d_cron); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_daemon); destinat=
ion(d_daemon); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_kern); destinatio=
n(d_kern); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_lpr); destination=
(d_lpr); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_syslog3); destina=
tion(d_syslog); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_user); destinatio=
n(d_user); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_uucp); destinatio=
n(d_uucp); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_mail); destinatio=
n(d_mail); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); filter(f_mail); filter(f_=
info); destination(d_mailinfo); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); filter(f_mail); filter(f_=
warn); destination(d_mailwarn); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); filter(f_mail); filter(f_=
err); destination(d_mailerr); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_news); filter(f_c=
rit); destination(d_newscrit); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_news); filter(f_e=
rr); destination(d_newserr); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_news); filter(f_n=
otice); destination(d_newsnotice); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); filter(f_cnews); destinat=
ion(d_console_all); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); filter(f_cother); destina=
tion(d_console_all); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); filter(f_ppp); destinatio=
n(d_ppp); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_debug); destinati=
on(d_debug); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_error); destinati=
on(d_error); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_messages); destin=
ation(d_messages); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_console); destina=
tion(d_console_all);<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; destination(d_xconsole); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;log { source(s_src); filter(f_crit); destinatio=
n(d_console); };<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# All messages send to a remote site<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;#<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#log { source(s_src); destination(d_net); };<o:=
p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-extras/recipes-bsp/syslog-ng=
/syslog-ng.inc b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc<o:p>=
</o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..69157b1<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/sysl=
og-ng/syslog-ng.inc<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,106 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;Alternative system logger=
 daemon&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DEPENDS =3D &quot;libol flex eventlog glib-2.0&=
quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;GPL LGPL&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=
=3D7ec1bcc46f28b11f4722e20d9b7dd4d5&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# syslog initscript is handled explicitly becau=
se order of<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# update-rc.d and update-alternatives is import=
ant<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RDEPENDS_${PN} &#43;=3D &quot; ${@base_conditio=
nal(&quot;ONLINE_PACKAGE_MANAGEMENT&quot;, &quot;none&quot;, &quot;&quot;, =
&quot;update-rc.d&quot;, d)}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;INC_PR =3D &quot;r10&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;http://www.balabit.com/downlo=
ads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43; <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;noipv6 =3D &quot;${@base_contains('DISTRO_FEATU=
RES', 'ipv6', '', '--disable-ipv6', d)}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;EXTRA_OECONF =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --with-libnet=3D${STAGING_BINDIR_CROSS} =
\<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --enable-dynamic-linking \<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp; ${noipv6} \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --enable-ssl \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --disable-sub-streams \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --disable-pacct \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --disable-linux-caps \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --disable-pcre \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --disable-sql \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; --disable-tcp-wrapper \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_configure_prepend() { <o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eval &quot;${@base_contains(=
'DISTRO_FEATURES', 'largefile', '', 'sed -i -e &quot;s/-D_LARGEFILE_SOURCE/=
/&quot; -e &quot;s/-D_FILE_OFFSET_BITS=3D64//&quot; ${S}/configure.in', d)}=
&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# rename modules.conf because it breaks update-=
modules <o:p>
</o:p></p>
<p class=3D"MsoNormal">&#43;# see http://lists.linuxtogo.org/pipermail/open=
embedded-devel/2011-October/035537.html<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_compile_prepend() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cd ${WORKDIR}/syslog-ng-3.2.5/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; sed -i &quot;s/\#define PATH\_MODULEDIR \&quot;\/=
usr\/lib\/syslog-ng\&quot;/\#define PATH\_MODULEDIR \&quot;\/usr\/lib\/sysl=
og-ng\/plugins\&quot;/&quot; config.h<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cd -<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_install_append() {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv $=
{D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed =
-i &quot;s#@include 'modules.conf'#@include 'scl-modules.conf'#g&quot; ${D}=
/${sysconfdir}/scl.conf<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inst=
all -d ${D}/${sysconfdir}/${PN}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inst=
all ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inst=
all -d ${D}/${sysconfdir}/init.d<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inst=
all -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir ${D}/${libdir}/syslog-=
ng/plugins/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${D}/${libdir}/syslog-ng/=
*.so ${D}/${libdir}/syslog-ng/plugins/<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PACKAGES &#43;=3D &quot;${PN}-plugins&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-plugins &#43;=3D &quot;${libdir}/sy=
slog-ng/plugins/*.so&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;INSANE_SKIP_${PN}-plugins =3D &quot;dev-so&quot=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN} =3D &quot;${bindir}/* ${sbindir}/* =
${libexecdir}/* ${libdir}/lib*${SOLIBS} \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${sysconfdir} ${sharedstatedir} ${localstatedir} \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${base_bindir}/* ${base_sbindir}/* \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${base_libdir}/*${SOLIBS} \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${datadir}/${BPN} \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${datadir}/include/scl/ ${datadir}/xsd&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></=
o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-dev &#43;=3D &quot;${libdir}/${BPN}=
/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;CONFFILES_${PN} =3D &quot;${sysconfdir}/${PN}.c=
onf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf&quot;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;pkg_postinst_${PN} () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /etc=
/init.d/syslog stop<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upda=
te-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${=
PN} 200<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if t=
est &quot;x$D&quot; !=3D &quot;x&quot;; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OPT=3D&quot;-r $D&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=3D&quot;-s&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # re=
move all rc.d-links potentially created from alternative<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # sy=
slog packages before creating new ones<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upda=
te-rc.d $OPT -f syslog remove<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upda=
te-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;pkg_prerm_${PN} () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if t=
est &quot;x$D&quot; =3D &quot;x&quot;; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;$1&quot; =3D &quo=
t;upgrade&quot; -o &quot;$1&quot; =3D &quot;remove&quot;; then<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /etc/init.d/syslog stop<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upda=
te-alternatives --remove syslog-init syslog.${PN}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;pkg_postrm_${PN} () {<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if t=
est &quot;x$D&quot; !=3D &quot;x&quot;; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=3D&quot;-r $D&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=3D&quot;&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if t=
est &quot;$1&quot; =3D &quot;remove&quot; -o &quot;$1&quot; =3D &quot;purge=
&quot;; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ! test -e &quot;/etc/init.d/=
syslog&quot;; then<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; update-rc.d $OPT syslog remove<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<o=
:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-extras/recipes-bsp/syslog-ng=
/syslog-ng_3.2.5.bb b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2=
.5.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..5446658<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/sysl=
og-ng/syslog-ng_3.2.5.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,11 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;require syslog-ng.inc<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;${INC_PR}.1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI &#43;=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; file://syslog-ng.conf \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; file://initscript \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;60737452ce898f9dc7170=
dfdc9bfd732&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;ffc9f3a0ebea836c1c=
737b1ff49efe731d885af1d8aacf9eca79d9144eeefa89&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; <o:p></o:p></p>
<p class=3D"MsoNormal">\ No newline at end of file<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E3944A28DFLE08entticom_--
