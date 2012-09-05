Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E4561529A1
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 22:43:33 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so1246999obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Y89lOe97I9zVNnLIRFFBdMotbM77D8pLkv4Sbw2OhVw=;
	b=JbbXlMf6Ju3vSfOzAEEYx/sA+cGsnYGNTaUlMXog1pjsdkl9acbFpCCBHuEeXCe9++
	86vvwoogXVtQMYpnf6EAqoMOWKDaaoYX/TJWvWbvl2HoTJzz9r+RJM6+Wy/gltNyc6Vg
	h9wT0Lwv44rlhLgTc+Aem+uvysesH0sElnwecbnKJ3CjzNKBpaxjPqZ599KA6gtHW4kB
	8YTuJwCGxPKy05fglO9S/5FX41M5Rrx9jXUVdnykkmmTL52GTqjJFQX6qDWs8XdrA3ge
	xDEp/AmkrTJtruMnluTGLOH/v3jRiRZYCcF8+SN70iDU9sXpNcDUFBG1FMOVbMceythP
	fR1A==
Received: by 10.182.14.36 with SMTP id m4mr34209obc.71.1346885012813;
	Wed, 05 Sep 2012 15:43:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q3sm249558oef.0.2012.09.05.15.43.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 15:43:32 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 18:00:56 -0500
Message-Id: <1346886057-7807-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 1/2] thttpd: Adding thttpd
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
X-List-Received-Date: Wed, 05 Sep 2012 22:43:34 -0000

* oe-core doesn't include thttpd. Therefore, thttpd has been ported
  from oe-classic and added to meta-arago-extras. Recipe will be submitted
  to meta-oe.
* thttpd recipe can be deleted from meta-arago-extras once thttpd recipe is
  included in the proper maintenance branch in meta-oe.
* thttpd pulled base init file which will be modified with meta-arago-distro
  specific changes.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-core/tasks/task-arago-console.bb       |    5 +-
 .../recipes-extended/thttpd/thttpd/init            |   47 +++++
 .../recipes-extended/thttpd/thttpd_2.25b.bbappend  |    4 +
 .../thttpd/thttpd-2.25b/acinclude.m4               |  188 ++++++++++++++++++++
 .../thttpd/thttpd-2.25b/htpasswd_getline.diff      |   20 ++
 .../thttpd/thttpd-2.25b/htpasswd_shared.diff       |   11 ++
 .../recipes-extended/thttpd/thttpd-2.25b/init      |   47 +++++
 .../thttpd/thttpd-2.25b/install.patch              |   87 +++++++++
 .../recipes-extended/thttpd/thttpd_2.25b.bb        |   43 +++++
 9 files changed, 449 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/thttpd/thttpd/init
 create mode 100644 meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/acinclude.m4
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_shared.diff
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/init
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/install.patch
 create mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-console.bb b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
index db424c1..ecae770 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -57,8 +57,7 @@ ARAGO_SDK_PREREQ = "\
     jpeg \
     jpeg-tools \
     freetype \
-    lighttpd \
-    lighttpd-module-cgi \
+    thttpd \
     "
 
 ARAGO_CONSOLE = "\
diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd/init b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
new file mode 100644
index 0000000..df6d648
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
@@ -0,0 +1,47 @@
+#! /bin/sh 
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/thttpd and type
+# > update-rc.d thttpd defaults 60
+#
+
+
+thttpd=/usr/sbin/thttpd
+test -x "$thttpd" || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd 
+    ;;
+  restart)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    echo -n "Waiting for thttpd to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend b/meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
new file mode 100644
index 0000000..c0ab069
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/thttpd/thttpd_2.25b.bbappend
@@ -0,0 +1,4 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/acinclude.m4 b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/acinclude.m4
new file mode 100644
index 0000000..56e4bcb
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/acinclude.m4
@@ -0,0 +1,188 @@
+dnl
+dnl Improved version of AC_CHECK_LIB
+dnl
+dnl Thanks to John Hawkinson (jhawk@mit.edu)
+dnl
+dnl usage:
+dnl
+dnl	AC_LBL_CHECK_LIB(LIBRARY, FUNCTION [, ACTION-IF-FOUND [,
+dnl	    ACTION-IF-NOT-FOUND [, OTHER-LIBRARIES]]])
+dnl
+dnl results:
+dnl
+dnl	LIBS
+dnl
+
+define(AC_LBL_CHECK_LIB,
+[AC_MSG_CHECKING([for $2 in -l$1])
+dnl Use a cache variable name containing both the library and function name,
+dnl because the test really is for library $1 defining function $2, not
+dnl just for library $1.  Separate tests with the same $1 and different $2's
+dnl may have different results.
+ac_lib_var=`echo $1['_']$2['_']$5 | sed 'y%./+- %__p__%'`
+AC_CACHE_VAL(ac_cv_lbl_lib_$ac_lib_var,
+[ac_save_LIBS="$LIBS"
+LIBS="-l$1 $5 $LIBS"
+AC_TRY_LINK(dnl
+ifelse([$2], [main], , dnl Avoid conflicting decl of main.
+[/* Override any gcc2 internal prototype to avoid an error.  */
+]AC_LANG_CASE(c++, [#ifdef __cplusplus
+extern "C"
+#endif
+])dnl
+[/* We use char because int might match the return type of a gcc2
+    builtin and then its argument prototype would still apply.  */
+char $2();
+]),
+	    [$2()],
+	    eval "ac_cv_lbl_lib_$ac_lib_var=yes",
+	    eval "ac_cv_lbl_lib_$ac_lib_var=no")
+LIBS="$ac_save_LIBS"
+])dnl
+if eval "test \"`echo '$ac_cv_lbl_lib_'$ac_lib_var`\" = yes"; then
+  AC_MSG_RESULT(yes)
+  ifelse([$3], ,
+[changequote(, )dnl
+  ac_tr_lib=HAVE_LIB`echo $1 | sed -e 's/[^a-zA-Z0-9_]/_/g' \
+    -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
+changequote([, ])dnl
+  AC_DEFINE_UNQUOTED($ac_tr_lib)
+  LIBS="-l$1 $LIBS"
+], [$3])
+else
+  AC_MSG_RESULT(no)
+ifelse([$4], , , [$4
+])dnl
+fi
+])
+
+dnl
+dnl AC_LBL_LIBRARY_NET
+dnl
+dnl This test is for network applications that need socket() and
+dnl gethostbyname() -ish functions.  Under Solaris, those applications
+dnl need to link with "-lsocket -lnsl".  Under IRIX, they need to link
+dnl with "-lnsl" but should *not* link with "-lsocket" because
+dnl libsocket.a breaks a number of things (for instance:
+dnl gethostbyname() under IRIX 5.2, and snoop sockets under most
+dnl versions of IRIX).
+dnl
+dnl Unfortunately, many application developers are not aware of this,
+dnl and mistakenly write tests that cause -lsocket to be used under
+dnl IRIX.  It is also easy to write tests that cause -lnsl to be used
+dnl under operating systems where neither are necessary (or useful),
+dnl such as SunOS 4.1.4, which uses -lnsl for TLI.
+dnl
+dnl This test exists so that every application developer does not test
+dnl this in a different, and subtly broken fashion.
+
+dnl It has been argued that this test should be broken up into two
+dnl seperate tests, one for the resolver libraries, and one for the
+dnl libraries necessary for using Sockets API. Unfortunately, the two
+dnl are carefully intertwined and allowing the autoconf user to use
+dnl them independantly potentially results in unfortunate ordering
+dnl dependancies -- as such, such component macros would have to
+dnl carefully use indirection and be aware if the other components were
+dnl executed. Since other autoconf macros do not go to this trouble,
+dnl and almost no applications use sockets without the resolver, this
+dnl complexity has not been implemented.
+dnl
+dnl The check for libresolv is in case you are attempting to link
+dnl statically and happen to have a libresolv.a lying around (and no
+dnl libnsl.a).
+dnl
+AC_DEFUN([AC_LBL_LIBRARY_NET], [
+    # Most operating systems have gethostbyname() in the default searched
+    # libraries (i.e. libc):
+    AC_CHECK_FUNC(gethostbyname, ,
+	# Some OSes (eg. Solaris) place it in libnsl:
+	AC_LBL_CHECK_LIB(nsl, gethostbyname, , 
+	    # Some strange OSes (SINIX) have it in libsocket:
+	    AC_LBL_CHECK_LIB(socket, gethostbyname, ,
+		# Unfortunately libsocket sometimes depends on libnsl.
+		# AC_CHECK_LIB's API is essentially broken so the
+		# following ugliness is necessary:
+		AC_LBL_CHECK_LIB(socket, gethostbyname,
+		    LIBS="-lsocket -lnsl $LIBS",
+		    AC_CHECK_LIB(resolv, gethostbyname),
+		    -lnsl))))
+    AC_CHECK_FUNC(socket, , AC_CHECK_LIB(socket, socket, ,
+	AC_LBL_CHECK_LIB(socket, socket, LIBS="-lsocket -lnsl $LIBS", ,
+	    -lnsl)))
+    # DLPI needs putmsg under HPUX so test for -lstr while we're at it
+    AC_CHECK_LIB(str, putmsg)
+    ])
+
+dnl
+dnl Checks to see if struct tm has the BSD tm_gmtoff member
+dnl
+dnl usage:
+dnl
+dnl	AC_ACME_TM_GMTOFF
+dnl
+dnl results:
+dnl
+dnl	HAVE_TM_GMTOFF (defined)
+dnl
+AC_DEFUN([AC_ACME_TM_GMTOFF],
+    [AC_MSG_CHECKING(if struct tm has tm_gmtoff member)
+    AC_CACHE_VAL(ac_cv_acme_tm_has_tm_gmtoff,
+	AC_TRY_COMPILE([
+#	include <sys/types.h>
+#	include <time.h>],
+	[u_int i = sizeof(((struct tm *)0)->tm_gmtoff)],
+	ac_cv_acme_tm_has_tm_gmtoff=yes,
+	ac_cv_acme_tm_has_tm_gmtoff=no))
+    AC_MSG_RESULT($ac_cv_acme_tm_has_tm_gmtoff)
+    if test $ac_cv_acme_tm_has_tm_gmtoff = yes ; then
+	    AC_DEFINE(HAVE_TM_GMTOFF)
+    fi])
+
+dnl
+dnl Checks to see if int64_t exists
+dnl
+dnl usage:
+dnl
+dnl	AC_ACME_INT64T
+dnl
+dnl results:
+dnl
+dnl	HAVE_INT64T (defined)
+dnl
+AC_DEFUN([AC_ACME_INT64T],
+    [AC_MSG_CHECKING(if int64_t exists)
+    AC_CACHE_VAL(ac_cv_acme_int64_t,
+	AC_TRY_COMPILE([
+#	include <sys/types.h>],
+	[int64_t i64],
+	ac_cv_acme_int64_t=yes,
+	ac_cv_acme_int64_t=no))
+    AC_MSG_RESULT($ac_cv_acme_int64_t)
+    if test $ac_cv_acme_int64_t = yes ; then
+	    AC_DEFINE(HAVE_INT64T)
+    fi])
+
+dnl
+dnl Checks to see if socklen_t exists
+dnl
+dnl usage:
+dnl
+dnl	AC_ACME_SOCKLENT
+dnl
+dnl results:
+dnl
+dnl	HAVE_SOCKLENT (defined)
+dnl
+AC_DEFUN([AC_ACME_SOCKLENT],
+    [AC_MSG_CHECKING(if socklen_t exists)
+    AC_CACHE_VAL(ac_cv_acme_socklen_t,
+	AC_TRY_COMPILE([
+#	include <sys/types.h>
+#	include <sys/socket.h>],
+	[socklen_t slen],
+	ac_cv_acme_socklen_t=yes,
+	ac_cv_acme_socklen_t=no))
+    AC_MSG_RESULT($ac_cv_acme_socklen_t)
+    if test $ac_cv_acme_socklen_t = yes ; then
+	    AC_DEFINE(HAVE_SOCKLENT)
+    fi])
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff
new file mode 100644
index 0000000..82b12e2
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff
@@ -0,0 +1,20 @@
+--- thttpd-2.25b/extras/htpasswd.c.old	2010-04-28 17:23:40.000000000 +0100
++++ thttpd-2.25b/extras/htpasswd.c	2010-04-28 17:24:00.000000000 +0100
+@@ -49,7 +49,7 @@
+     while((line[y++] = line[x++]));
+ }
+ 
+-static int getline(char *s, int n, FILE *f) {
++static int ht_getline(char *s, int n, FILE *f) {
+     register int i=0;
+ 
+     while(1) {
+@@ -189,7 +189,7 @@
+     strcpy(user,argv[2]);
+ 
+     found = 0;
+-    while(!(getline(line,MAX_STRING_LEN,f))) {
++    while(!(ht_getline(line,MAX_STRING_LEN,f))) {
+         if(found || (line[0] == '#') || (!line[0])) {
+             putline(tfp,line);
+             continue;
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_shared.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_shared.diff
new file mode 100644
index 0000000..7ee2cd2
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_shared.diff
@@ -0,0 +1,11 @@
+--- thttpd-2.25b/extras/Makefile.in.orig	2007-03-17 22:30:47.356393000 +0100
++++ thttpd-2.25b/extras/Makefile.in	2007-03-17 22:31:34.566393000 +0100
+@@ -36,7 +36,7 @@
+ DEFS =		@DEFS@
+ INCLS =		-I..
+ CFLAGS =	$(CCOPT) $(DEFS) $(INCLS)
+-STATICFLAG =	@V_STATICFLAG@
++STATICFLAG =	
+ LDFLAGS =	@LDFLAGS@
+ LIBS =		@LIBS@
+ NETLIBS =	@V_NETLIBS@
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/init b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/init
new file mode 100644
index 0000000..df6d648
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/init
@@ -0,0 +1,47 @@
+#! /bin/sh 
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/thttpd and type
+# > update-rc.d thttpd defaults 60
+#
+
+
+thttpd=/usr/sbin/thttpd
+test -x "$thttpd" || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd 
+    ;;
+  restart)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    echo -n "Waiting for thttpd to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/install.patch b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/install.patch
new file mode 100644
index 0000000..cdf92a9
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/install.patch
@@ -0,0 +1,87 @@
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- thttpd-2.25b/Makefile.in~install.patch
++++ thttpd-2.25b/Makefile.in
+@@ -27,6 +27,7 @@
+ # Various configurable paths (remember to edit Makefile.in, not Makefile)
+ 
+ # Top level hierarchy.
++DESTDIR = 
+ prefix = @prefix@
+ exec_prefix = @exec_prefix@
+ # Pathname of directory to install the binary.
+@@ -110,11 +111,11 @@
+ 
+ installthis:
+ 	-mkdir -p $(DESTDIR)$(BINDIR)
+-	$(INSTALL) -m 555 -o bin -g bin thttpd $(DESTDIR)$(BINDIR)
++	$(INSTALL) -m 755 thttpd $(DESTDIR)$(BINDIR)
+ 
+ install-man:
+ 	-mkdir -p $(DESTDIR)$(MANDIR)/man8
+-	$(INSTALL) -m 444 -o bin -g bin thttpd.8 $(DESTDIR)$(MANDIR)/man8
++	$(INSTALL) -m 644 thttpd.8 $(DESTDIR)$(MANDIR)/man8
+ 
+ installsubdirs:
+ 	for i in $(SUBDIRS) ; do ( \
+--- thttpd-2.25b/extras/Makefile.in~install.patch
++++ thttpd-2.25b/extras/Makefile.in
+@@ -66,18 +66,16 @@
+ 
+ 
+ install:	all
+-	rm -f $(BINDIR)/makeweb $(BINDIR)/htpasswd $(BINDIR)/syslogtocern
+-	cp makeweb $(BINDIR)/makeweb
+-	chgrp $(WEBGROUP) $(BINDIR)/makeweb
+-	chmod 2755 $(BINDIR)/makeweb
+-	cp htpasswd $(BINDIR)/htpasswd
+-	cp syslogtocern $(BINDIR)/syslogtocern
+-	rm -f $(MANDIR)/man1/makeweb.1
+-	cp makeweb.1 $(MANDIR)/man1/makeweb.1
+-	rm -f $(MANDIR)/man1/htpasswd.1
+-	cp htpasswd.1 $(MANDIR)/man1/htpasswd.1
+-	rm -f $(MANDIR)/man8/syslogtocern.8
+-	cp syslogtocern.8 $(MANDIR)/man8/syslogtocern.8
++	install -d $(DESTDIR)$(BINDIR)
++#	install -g $(WEBGROUP) -m 2755 makeweb $(DESTDIR)$(BINDIR)/makeweb
++	install -m 2755 makeweb $(DESTDIR)$(BINDIR)/makeweb
++	install -m 0755 htpasswd $(DESTDIR)$(BINDIR)/htpasswd
++	install -m 0755 syslogtocern $(DESTDIR)$(BINDIR)/syslogtocern
++	install -d $(DESTDIR)$(MANDIR)/man1 \
++		   $(DESTDIR)$(MANDIR)/man8
++	install -m 0644 makeweb.1 $(DESTDIR)$(MANDIR)/man1/makeweb.1
++	install -m 0644 htpasswd.1 $(DESTDIR)$(MANDIR)/man1/htpasswd.1
++	install -m 0644 syslogtocern.8 $(DESTDIR)$(MANDIR)/man8/syslogtocern.8
+ 
+ clean:
+ 	rm -f $(CLEANFILES)
+--- thttpd-2.25b/cgi-src/Makefile.in~install.patch
++++ thttpd-2.25b/cgi-src/Makefile.in
+@@ -67,17 +67,13 @@
+ 	cd .. ; $(MAKE) $(MFLAGS) strerror.o
+ 
+ install:	all
+-	-mkdir -p $(CGIBINDIR)
+-	rm -f $(CGIBINDIR)/redirect
+-	cp redirect $(CGIBINDIR)/redirect
+-	rm -f $(MANDIR)/man8/redirect.8
+-	cp redirect.8 $(MANDIR)/man8/redirect.8
+-	rm -f $(CGIBINDIR)/ssi
+-	cp ssi $(CGIBINDIR)/ssi
+-	rm -f $(MANDIR)/man8/ssi.8
+-	cp ssi.8 $(MANDIR)/man8/ssi.8
+-	rm -f $(CGIBINDIR)/phf
+-	cp phf $(CGIBINDIR)/phf
++	install -d $(DESTDIR)$(CGIBINDIR)
++	install -m 0755 redirect $(DESTDIR)$(CGIBINDIR)/redirect
++	install -d $(DESTDIR)$(MANDIR)/man8
++	install -m 0644 redirect.8 $(DESTDIR)$(MANDIR)/man8/redirect.8
++	install -m 0755 ssi $(DESTDIR)$(CGIBINDIR)/ssi
++	install -m 0644 ssi.8 $(DESTDIR)$(MANDIR)/man8/ssi.8
++	install -m 0755 phf $(DESTDIR)$(CGIBINDIR)/phf
+ 
+ clean:
+ 	rm -f $(CLEANFILES)
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb
new file mode 100644
index 0000000..a6f14bf
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb
@@ -0,0 +1,43 @@
+# This recipe didn't exist in oe-core/meta-oe. Adding recipe here but the recipe 
+# has been submitted to meta-oe.
+
+DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server."
+LICENSE = "BSD"
+HOMEPAGE = "http://www.acme.com/software/thttpd/"
+PR ="r0"
+
+LIC_FILES_CHKSUM = "file://thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
+SRC_URI = "http://www.acme.com/software/thttpd/thttpd-${PV}.tar.gz \
+	   file://install.patch \
+	   file://acinclude.m4 \
+	   file://init \
+	   file://htpasswd_shared.diff \
+       file://htpasswd_getline.diff"
+
+S = "${WORKDIR}/thttpd-${PV}"
+
+PARALLEL_MAKE = ""
+
+INITSCRIPT_NAME = "thttpd"
+INITSCRIPT_PARAMS = "defaults"
+
+inherit autotools update-rc.d
+
+EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
+FILES_${PN}-dbg_append = " ${servicedir}/www/cgi-bin/.debug"
+FILES_${PN}_append = " ${servicedir}"
+
+do_configure () {
+	install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
+	autotools_do_configure
+}
+
+do_install_append () {
+	install -d "${D}${sysconfdir}/init.d"
+	cat ${WORKDIR}/init | sed -e 's,@@SRVDIR,${servicedir}/www,g' > ${WORKDIR}/thttpd
+	install -c -m 755 ${WORKDIR}/thttpd ${D}${sysconfdir}/init.d/thttpd
+}
+
+
+SRC_URI[md5sum] = "156b249b3b0bcd48b06badd2db0d56c5"
+SRC_URI[sha256sum] = "07719b08b1cff6a21c08697a7bcb4395425b07ee753106262fb62a03a7d32360"
-- 
1.7.0.4


