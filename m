Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4A0BA52A83
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 21:07:56 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.148])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2L00A3JXCP7B10@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Feb 2016 15:07:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=QAr7KCQdAAAA:8 a=4DsOrSlXAAAA:8
	a=QyXUC8HyAAAA:8 a=t7CeM3EgAAAA:8	a=Sv4y0yS6AAAA:8 a=pGLkceISAAAA:8
	a=dZKn3PoEWUgM2Z8dhzQA:9	a=5Iixy4FySiQA:10
Received: by 100.15.86.14 with SMTP id 61daa106; Mon, 15 Feb 2016 21:07:37 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5AD67161E9D;	Mon,
	15 Feb 2016 16:07:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Feb 2016 16:07:35 -0500
Message-id: <1455570456-20441-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] dropbear: overlay 2015.71 from oe-core/master
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
X-List-Received-Date: Mon, 15 Feb 2016 21:07:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/dropbear/dropbear.inc             | 103 +++++++++++++++
 .../0001-urandom-xauth-changes-to-options.h.patch  |  23 ++++
 .../dropbear/dropbear/0003-configure.patch         |  42 +++++++
 .../dropbear/dropbear/0004-fix-2kb-keys.patch      |  22 ++++
 .../dropbear/0005-dropbear-enable-pam.patch        |  36 ++++++
 .../0006-dropbear-configuration-file.patch         |  22 ++++
 .../dropbear/0007-dropbear-fix-for-x32-abi.patch   | 140 +++++++++++++++++++++
 .../recipes-core/dropbear/dropbear/dropbear        |   4 +
 .../recipes-core/dropbear/dropbear/dropbear.socket |  10 ++
 .../dropbear/dropbear/dropbear@.service            |  12 ++
 .../dropbear/dropbear/dropbearkey.service          |  13 ++
 .../recipes-core/dropbear/dropbear/init            | 113 +++++++++++++++++
 .../recipes-core/dropbear/dropbear_2015.71.bb      |   5 +
 13 files changed, 545 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear.inc
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0003-configure.patch
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbear
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbear.socket
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbear@.service
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbearkey.service
 create mode 100755 meta-arago-extras/recipes-core/dropbear/dropbear/init
 create mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear_2015.71.bb

diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear.inc b/meta-arago-extras/recipes-core/dropbear/dropbear.inc
new file mode 100644
index 0000000..1dce2a5
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear.inc
@@ -0,0 +1,103 @@
+SUMMARY = "A lightweight SSH and SCP implementation"
+HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
+SECTION = "console/network"
+
+# some files are from other projects and have others license terms:
+#   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a5ec40cafba26fc4396d0b550f824e01"
+
+DEPENDS = "zlib"
+RPROVIDES_${PN} = "ssh sshd" 
+
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+           file://0001-urandom-xauth-changes-to-options.h.patch \
+           file://0003-configure.patch \
+           file://0004-fix-2kb-keys.patch \
+           file://0007-dropbear-fix-for-x32-abi.patch \
+           file://init \
+           file://dropbearkey.service \
+           file://dropbear@.service \
+           file://dropbear.socket \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
+
+PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
+               file://0006-dropbear-configuration-file.patch \
+               file://dropbear"
+
+PAM_PLUGINS = "libpam-runtime \
+	pam-plugin-deny \
+	pam-plugin-permit \
+	pam-plugin-unix \
+	"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
+
+inherit autotools update-rc.d systemd
+
+INITSCRIPT_NAME = "dropbear"
+INITSCRIPT_PARAMS = "defaults 10"
+
+SYSTEMD_SERVICE_${PN} = "dropbear.socket"
+
+SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
+BINCOMMANDS = "dbclient ssh scp"
+EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
+EXTRA_OECONF += "\
+ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+CFLAGS += "-DSFTPSERVER_PATH=\\"${libdir}/openssh/sftp-server\\""
+
+do_install() {
+	install -d ${D}${sysconfdir} \
+		${D}${sysconfdir}/init.d \
+		${D}${sysconfdir}/default \
+		${D}${sysconfdir}/dropbear \
+		${D}${bindir} \
+		${D}${sbindir} \
+		${D}${localstatedir}
+
+	install -m 0755 dropbearmulti ${D}${sbindir}/
+	ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
+	
+	for i in ${SBINCOMMANDS}
+	do
+		ln -s ./dropbearmulti ${D}${sbindir}/$i
+	done
+	sed -e 's,/etc,${sysconfdir},g' \
+		-e 's,/usr/sbin,${sbindir},g' \
+		-e 's,/var,${localstatedir},g' \
+		-e 's,/usr/bin,${bindir},g' \
+		-e 's,/usr,${prefix},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/dropbear
+	chmod 755 ${D}${sysconfdir}/init.d/dropbear
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
+	fi
+
+	# deal with systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@SBINDIR@,${sbindir},g' \
+		${D}${systemd_unitdir}/system/dropbear.socket ${D}${systemd_unitdir}/system/*.service
+}
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "20"
+ALTERNATIVE_${PN} = "scp ssh"
+
+ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
+
+pkg_postrm_append_${PN} () {
+  if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
+        rm ${sysconfdir}/dropbear/dropbear_rsa_host_key
+  fi
+  if [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
+        rm ${sysconfdir}/dropbear/dropbear_dss_host_key
+  fi
+}
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta-arago-extras/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
new file mode 100644
index 0000000..dc9d578
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -0,0 +1,23 @@
+Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
+
+Upstream-Status: Inappropriate [configuration]
+---
+ options.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/options.h b/options.h
+index 7d06322..71a21c2 100644
+--- a/options.h
++++ b/options.h
+@@ -247,7 +247,7 @@ much traffic. */
+ /* The command to invoke for xauth when using X11 forwarding.
+  * "-q" for quiet */
+ #ifndef XAUTH_COMMAND
+-#define XAUTH_COMMAND "/usr/bin/xauth -q"
++#define XAUTH_COMMAND "xauth -q"
+ #endif
+ 
+ /* if you want to enable running an sftp server (such as the one included with
+-- 
+1.7.11.7
+
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/0003-configure.patch b/meta-arago-extras/recipes-core/dropbear/dropbear/0003-configure.patch
new file mode 100644
index 0000000..c53ab01
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/0003-configure.patch
@@ -0,0 +1,42 @@
+From c5f5c5054c1b15539dccf866e2c3faba7ed68456 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Thu, 25 Apr 2013 00:27:25 +0200
+Subject: [PATCH 3/6] configure: add a variable to allow openpty check to be cached
+
+Upstream-Status: Pending
+
+---
+ configure.ac | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 05461f3..9c16d90 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,15 +166,20 @@ AC_ARG_ENABLE(openpty,
+ 			AC_MSG_NOTICE(Not using openpty)
+ 		else
+ 			AC_MSG_NOTICE(Using openpty if available)
+-			AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)])
++			AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
+ 		fi
+ 	],
+ 	[
+ 		AC_MSG_NOTICE(Using openpty if available)
+-		AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY)])
++		AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
+ 	]
+ )
+-		
++
++if test "x$dropbear_cv_func_have_openpty" = "xyes"; then
++	AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)
++	no_ptc_check=yes
++	no_ptmx_check=yes
++fi
+ 
+ AC_ARG_ENABLE(syslog,
+ 	[  --disable-syslog        Don't include syslog support],
+-- 
+1.7.11.7
+
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch b/meta-arago-extras/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
new file mode 100644
index 0000000..7539d20
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
@@ -0,0 +1,22 @@
+Subject: [PATCH 4/6] fix 2kb keys
+
+Upstream-Status: Inappropriate [configuration]
+---
+ kex.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kex.h b/kex.h
+index 72430e9..375c677 100644
+--- a/kex.h
++++ b/kex.h
+@@ -67,6 +67,6 @@ struct KEXState {
+ };
+ 
+ 
+-#define MAX_KEXHASHBUF 2000
++#define MAX_KEXHASHBUF 3000
+ 
+ #endif /* _KEX_H_ */
+-- 
+1.7.11.7
+
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta-arago-extras/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
new file mode 100644
index 0000000..539cb12
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -0,0 +1,36 @@
+From b8cece92ba19aa77ac013ea161bfe4c7147747c9 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 2 Dec 2015 11:36:02 +0200
+Subject: Enable pam
+
+We need modify file option.h besides enabling pam in
+configure if we want dropbear to support pam.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ options.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/options.h b/options.h
+index 94261f6..90bfe2f 100644
+--- a/options.h
++++ b/options.h
+@@ -208,10 +208,10 @@ If you test it please contact the Dropbear author */
+ 
+ /* This requires crypt() */
+ #ifdef HAVE_CRYPT
+-#define ENABLE_SVR_PASSWORD_AUTH
++/*#define ENABLE_SVR_PASSWORD_AUTH*/
+ #endif
+ /* PAM requires ./configure --enable-pam */
+-/*#define ENABLE_SVR_PAM_AUTH */
++#define ENABLE_SVR_PAM_AUTH
+ #define ENABLE_SVR_PUBKEY_AUTH
+ 
+ /* Whether to take public key options in 
+-- 
+2.1.4
+
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta-arago-extras/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
new file mode 100644
index 0000000..fa4c8d0
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -0,0 +1,22 @@
+Subject: [PATCH 6/6] dropbear configuration file
+
+dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam configuration file \
+to "/etc/pam.d/dropbear for dropbear when enabling pam supporting"
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+---
+diff -Naur dropbear-2013.60-orig/svr-authpam.c dropbear-2013.60/svr-authpam.c
+--- dropbear-2013.60-orig/svr-authpam.c	2013-10-16 16:34:53.000000000 +0200
++++ dropbear-2013.60/svr-authpam.c	2013-10-21 17:04:04.969416055 +0200
+@@ -211,7 +211,7 @@
+ 	userData.passwd = password;
+ 
+ 	/* Init pam */
+-	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
++	if ((rc = pam_start("dropbear", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
+ 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
+ 				rc, pam_strerror(pamHandlep, rc));
+ 		goto cleanup;
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch b/meta-arago-extras/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
new file mode 100644
index 0000000..b450121
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
@@ -0,0 +1,140 @@
+Upstream-Status: Pending
+
+The dropbearkey utility built in x32 abi format, when generating ssh
+keys, was getting lost in the infinite loop.
+
+This patch fixes the issue by fixing types of variables and
+parameters of functions used in the code, which were getting
+undesired size, when compiled with the x32 abi toolchain.
+
+2013/05/23
+Received this fix from H J Lu.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344079 25200
+# Node ID a10a1c46b857cc8a3923c3bb6d1504aa25b6052f
+# Parent  e76614145aea67f66e4a4257685c771efba21aa1
+Typdef mp_digit to unsigned long long for MP_64BIT
+
+When GCC is used with MP_64BIT, we should typedef mp_digit to unsigned
+long long instead of unsigned long since for x32, unsigned long is
+32-bit and unsigned long long is 64-bit and it is safe to use unsigned
+long long for 64-bit integer with GCC.
+
+diff -r e76614145aea -r a10a1c46b857 libtommath/tommath.h
+--- a/libtommath/tommath.h	Thu Apr 18 22:57:47 2013 +0800
++++ b/libtommath/tommath.h	Thu May 23 14:21:19 2013 -0700
+@@ -73,7 +73,7 @@
+    typedef signed long long   long64;
+ #endif
+
+-   typedef unsigned long      mp_digit;
++   typedef unsigned long long mp_digit;
+    typedef unsigned long      mp_word __attribute__ ((mode(TI)));
+
+    #define DIGIT_BIT          60
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344241 25200
+# Node ID c7555a4cb7ded3a88409ba85f4027baa7af5f536
+# Parent  a10a1c46b857cc8a3923c3bb6d1504aa25b6052f
+Cast to mp_digit when updating *rho
+
+There is
+
+int
+mp_montgomery_setup (mp_int * n, mp_digit * rho)
+
+We should cast to mp_digit instead of unsigned long when updating
+*rho since mp_digit may be unsigned long long and unsigned long long
+may be different from unsigned long, like in x32.
+
+diff -r a10a1c46b857 -r c7555a4cb7de libtommath/bn_mp_montgomery_setup.c
+--- a/libtommath/bn_mp_montgomery_setup.c	Thu May 23 14:21:19 2013 -0700
++++ b/libtommath/bn_mp_montgomery_setup.c	Thu May 23 14:24:01 2013 -0700
+@@ -48,7 +48,7 @@
+ #endif
+
+   /* rho = -1/m mod b */
+-  *rho = (unsigned long)(((mp_word)1 << ((mp_word) DIGIT_BIT)) - x) & MP_MASK;
++  *rho = (mp_digit)(((mp_word)1 << ((mp_word) DIGIT_BIT)) - x) & MP_MASK;
+
+   return MP_OKAY;
+ }
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344541 25200
+# Node ID 7c656e7071a6412688b2f30a529a9afac6c7bf5a
+# Parent  c7555a4cb7ded3a88409ba85f4027baa7af5f536
+Define LTC_FAST_TYPE to unsigned long long for __x86_64__
+
+We should define LTC_FAST_TYPE to unsigned long long instead of unsigned
+long if __x86_64__ to support x32 where unsigned long long is 64-bit
+and unsigned long is 32-bit.
+
+diff -r c7555a4cb7de -r 7c656e7071a6 libtomcrypt/src/headers/tomcrypt_cfg.h
+--- a/libtomcrypt/src/headers/tomcrypt_cfg.h	Thu May 23 14:24:01 2013 -0700
++++ b/libtomcrypt/src/headers/tomcrypt_cfg.h	Thu May 23 14:29:01 2013 -0700
+@@ -74,7 +74,7 @@
+    #define ENDIAN_LITTLE
+    #define ENDIAN_64BITWORD
+    #define LTC_FAST
+-   #define LTC_FAST_TYPE    unsigned long
++   #define LTC_FAST_TYPE    unsigned long long
+ #endif
+
+ /* detect PPC32 */
+# HG changeset patch
+# User H.J. Lu <hjl.tools@gmail.com>
+# Date 1369344730 25200
+# Node ID a7d4690158fae4ede2c4e5b56233e83730bf38ee
+# Parent  7c656e7071a6412688b2f30a529a9afac6c7bf5a
+Use unsigned long long aas unsigned 64-bit integer for x86-64 GCC
+
+We should use unsigned long long instead of unsigned long as unsigned
+64-bit integer for x86-64 GCC to support x32 where unsigned long is
+32-bit.
+
+diff -r 7c656e7071a6 -r a7d4690158fa libtomcrypt/src/headers/tomcrypt_macros.h
+--- a/libtomcrypt/src/headers/tomcrypt_macros.h	Thu May 23 14:29:01 2013 -0700
++++ b/libtomcrypt/src/headers/tomcrypt_macros.h	Thu May 23 14:32:10 2013 -0700
+@@ -343,7 +343,7 @@
+ /* 64-bit Rotates */
+ #if !defined(__STRICT_ANSI__) && defined(__GNUC__) && defined(__x86_64__) && !defined(LTC_NO_ASM)
+
+-static inline unsigned long ROL64(unsigned long word, int i)
++static inline unsigned long long ROL64(unsigned long long word, int i)
+ {
+    asm("rolq %%cl,%0"
+       :"=r" (word)
+@@ -351,7 +351,7 @@
+    return word;
+ }
+
+-static inline unsigned long ROR64(unsigned long word, int i)
++static inline unsigned long long ROR64(unsigned long long word, int i)
+ {
+    asm("rorq %%cl,%0"
+       :"=r" (word)
+@@ -361,7 +361,7 @@
+
+ #ifndef LTC_NO_ROLC
+
+-static inline unsigned long ROL64c(unsigned long word, const int i)
++static inline unsigned long long ROL64c(unsigned long long word, const int i)
+ {
+    asm("rolq %2,%0"
+       :"=r" (word)
+@@ -369,7 +369,7 @@
+    return word;
+ }
+
+-static inline unsigned long ROR64c(unsigned long word, const int i)
++static inline unsigned long long ROR64c(unsigned long long word, const int i)
+ {
+    asm("rorq %2,%0"
+       :"=r" (word)
+
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear
new file mode 100644
index 0000000..47e787f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear
@@ -0,0 +1,4 @@
+#%PAM-1.0
+
+auth     include  common-auth
+account  include  common-account
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear.socket b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear.socket
new file mode 100644
index 0000000..e5c61b7
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear.socket
@@ -0,0 +1,10 @@
+[Unit]
+Conflicts=dropbear.service
+
+[Socket]
+ListenStream=22
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
+Also=dropbearkey.service
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear@.service b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear@.service
new file mode 100644
index 0000000..b420bcd
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbear@.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=SSH Per-Connection Server
+Wants=dropbearkey.service
+After=syslog.target dropbearkey.service
+
+[Service]
+Environment="DROPBEAR_RSAKEY_DIR=/etc/dropbear"
+EnvironmentFile=-/etc/default/dropbear
+ExecStart=-@SBINDIR@/dropbear -i -r ${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key $DROPBEAR_EXTRA_ARGS
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+StandardInput=socket
+KillMode=process
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbearkey.service
new file mode 100644
index 0000000..c49053d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/dropbearkey.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=SSH Key Generation
+RequiresMountsFor=/var /var/lib
+ConditionPathExists=!/etc/dropbear/dropbear_rsa_host_key
+ConditionPathExists=!/var/lib/dropbear/dropbear_rsa_host_key
+
+[Service]
+Environment="DROPBEAR_RSAKEY_DIR=/etc/dropbear"
+EnvironmentFile=-/etc/default/dropbear
+Type=oneshot
+ExecStart=@BASE_BINDIR@/mkdir -p ${DROPBEAR_RSAKEY_DIR}
+ExecStart=@SBINDIR@/dropbearkey -t rsa -f ${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key
+RemainAfterExit=yes
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear/init b/meta-arago-extras/recipes-core/dropbear/dropbear/init
new file mode 100755
index 0000000..e8fed3f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear/init
@@ -0,0 +1,113 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:		sshd
+# Required-Start:	$remote_fs $syslog $networking
+# Required-Stop:	$remote_fs $syslog
+# Default-Start:	2 3 4 5
+# Default-Stop:		1
+# Short-Description:	Dropbear Secure Shell server
+### END INIT INFO
+#
+# Do not configure this file. Edit /etc/default/dropbear instead!
+#
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/dropbear
+NAME=dropbear
+DESC="Dropbear SSH server"
+PIDFILE=/var/run/dropbear.pid
+
+DROPBEAR_PORT=22
+DROPBEAR_EXTRA_ARGS=
+NO_START=0
+
+set -e
+
+test ! -r /etc/default/dropbear || . /etc/default/dropbear
+test "$NO_START" = "0" || exit 0
+test -x "$DAEMON" || exit 0
+test ! -h /var/service/dropbear || exit 0
+
+readonly_rootfs=0
+for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' </proc/mounts`; do
+  case $flag in
+   ro)
+     readonly_rootfs=1
+     ;;
+  esac
+done
+
+if [ $readonly_rootfs = "1" ]; then
+  mkdir -p /var/lib/dropbear
+  DROPBEAR_RSAKEY_DEFAULT="/var/lib/dropbear/dropbear_rsa_host_key"
+  DROPBEAR_DSSKEY_DEFAULT="/var/lib/dropbear/dropbear_dss_host_key"
+else
+  DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
+  DROPBEAR_DSSKEY_DEFAULT="/etc/dropbear/dropbear_dss_host_key"
+fi
+
+test -z "$DROPBEAR_BANNER" || \
+  DROPBEAR_EXTRA_ARGS="$DROPBEAR_EXTRA_ARGS -b $DROPBEAR_BANNER"
+test -n "$DROPBEAR_RSAKEY" || \
+  DROPBEAR_RSAKEY=$DROPBEAR_RSAKEY_DEFAULT
+test -n "$DROPBEAR_DSSKEY" || \
+  DROPBEAR_DSSKEY=$DROPBEAR_DSSKEY_DEFAULT
+test -n "$DROPBEAR_KEYTYPES" || \
+  DROPBEAR_KEYTYPES="rsa"
+
+gen_keys() {
+for t in $DROPBEAR_KEYTYPES; do
+  case $t in
+    rsa)
+        if [ -f "$DROPBEAR_RSAKEY" -a ! -s "$DROPBEAR_RSAKEY" ]; then
+                rm $DROPBEAR_RSAKEY || true
+        fi
+        test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY
+	;;
+    dsa)
+        if [ -f "$DROPBEAR_DSSKEY" -a ! -s "$DROPBEAR_DSSKEY" ]; then
+                rm $DROPBEAR_DSSKEY || true
+        fi
+        test -f $DROPBEAR_DSSKEY || dropbearkey -t dss -f $DROPBEAR_DSSKEY
+	;;
+  esac
+done
+}
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	gen_keys
+	KEY_ARGS=""
+	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
+	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
+	start-stop-daemon -S -p $PIDFILE \
+	  -x "$DAEMON" -- $KEY_ARGS \
+	    -p "$DROPBEAR_PORT" $DROPBEAR_EXTRA_ARGS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
+	sleep 1
+	KEY_ARGS=""
+	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
+	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
+	start-stop-daemon -S -p $PIDFILE \
+	  -x "$DAEMON" -- $KEY_ARGS \
+	    -p "$DROPBEAR_PORT" $DROPBEAR_EXTRA_ARGS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-core/dropbear/dropbear_2015.71.bb b/meta-arago-extras/recipes-core/dropbear/dropbear_2015.71.bb
new file mode 100644
index 0000000..6332579
--- /dev/null
+++ b/meta-arago-extras/recipes-core/dropbear/dropbear_2015.71.bb
@@ -0,0 +1,5 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "2ccc0a2f3e37ca221db12c5af6a88137"
+SRC_URI[sha256sum] = "376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af"
+
-- 
2.2.0


