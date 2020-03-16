Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 70E04529AD
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2020 18:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5123040C06;
	Mon, 16 Mar 2020 18:52:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vTYkCyOPhRQj; Mon, 16 Mar 2020 18:52:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75FDA40AB5;
	Mon, 16 Mar 2020 18:52:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 434ED16D13D;
	Mon, 16 Mar 2020 14:52:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2020 14:52:10 -0400
Message-Id: <1584384730-5630-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] thttpd: remove outdated package
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
X-List-Received-Date: Mon, 16 Mar 2020 18:54:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

thttpd has been outdated and not supported upstream for many years, which
could pose a major security risk. There is a supported fork of thttpd,
called sthttpd, and OE/Yocto provides a recipe in meta-webserver layer of
meta-openembedded, which can be added. Alternatively, lighttpd is a preferred
Web server provided by openembedded-core and is already used by Matrix.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |   1 -
 .../recipes-extended/thttpd/thttpd/init            |  47 ------
 .../recipes-extended/thttpd/thttpd_%.bbappend      |   4 -
 .../thttpd/thttpd-2.28/acinclude.m4                | 188 ---------------------
 .../thttpd/thttpd-2.28/htpasswd_getline.diff       |  30 ----
 .../thttpd/thttpd-2.28/htpasswd_shared.diff        |  21 ---
 .../recipes-extended/thttpd/thttpd-2.28/init       |  47 ------
 .../thttpd/thttpd-2.28/install.patch               | 103 -----------
 .../recipes-extended/thttpd/thttpd_2.28.bb         |  45 -----
 9 files changed, 486 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/thttpd/thttpd/init
 delete mode 100644 meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/acinclude.m4
 delete mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
 delete mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
 delete mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/init
 delete mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
 delete mode 100644 meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index c3c2a2c..5c348fa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -63,7 +63,6 @@ ARAGO_SDK_PREREQ = "\
     jpeg \
     jpeg-tools \
     freetype \
-    thttpd \
     "
 
 ARAGO_CONSOLE = "\
diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd/init b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
deleted file mode 100644
index 1cfaa65..0000000
--- a/meta-arago-distro/recipes-extended/thttpd/thttpd/init
+++ /dev/null
@@ -1,47 +0,0 @@
-#! /bin/sh 
-#
-# This is an init script for openembedded
-# Copy it to /etc/init.d/thttpd and type
-# > update-rc.d thttpd defaults 60
-#
-
-
-thttpd=/usr/sbin/thttpd
-test -x "$thttpd" || exit 0
-
-
-case "$1" in
-  start)
-    echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping thttpd"
-    start-stop-daemon --stop --quiet --exec $thttpd
-    echo "."
-    ;;
-  reload|force-reload)
-    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd 
-    ;;
-  restart)
-    echo -n "Stopping thttpd"
-    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
-    echo "."
-    echo -n "Waiting for thttpd to die off"
-    for i in 1 2 3 ;
-    do
-        sleep 1
-        echo -n "."
-    done
-    echo ""
-    echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend b/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend
deleted file mode 100644
index d66b008..0000000
--- a/meta-arago-distro/recipes-extended/thttpd/thttpd_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = ".arago0"
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/acinclude.m4 b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/acinclude.m4
deleted file mode 100644
index 56e4bcb..0000000
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/acinclude.m4
+++ /dev/null
@@ -1,188 +0,0 @@
-dnl
-dnl Improved version of AC_CHECK_LIB
-dnl
-dnl Thanks to John Hawkinson (jhawk@mit.edu)
-dnl
-dnl usage:
-dnl
-dnl	AC_LBL_CHECK_LIB(LIBRARY, FUNCTION [, ACTION-IF-FOUND [,
-dnl	    ACTION-IF-NOT-FOUND [, OTHER-LIBRARIES]]])
-dnl
-dnl results:
-dnl
-dnl	LIBS
-dnl
-
-define(AC_LBL_CHECK_LIB,
-[AC_MSG_CHECKING([for $2 in -l$1])
-dnl Use a cache variable name containing both the library and function name,
-dnl because the test really is for library $1 defining function $2, not
-dnl just for library $1.  Separate tests with the same $1 and different $2's
-dnl may have different results.
-ac_lib_var=`echo $1['_']$2['_']$5 | sed 'y%./+- %__p__%'`
-AC_CACHE_VAL(ac_cv_lbl_lib_$ac_lib_var,
-[ac_save_LIBS="$LIBS"
-LIBS="-l$1 $5 $LIBS"
-AC_TRY_LINK(dnl
-ifelse([$2], [main], , dnl Avoid conflicting decl of main.
-[/* Override any gcc2 internal prototype to avoid an error.  */
-]AC_LANG_CASE(c++, [#ifdef __cplusplus
-extern "C"
-#endif
-])dnl
-[/* We use char because int might match the return type of a gcc2
-    builtin and then its argument prototype would still apply.  */
-char $2();
-]),
-	    [$2()],
-	    eval "ac_cv_lbl_lib_$ac_lib_var=yes",
-	    eval "ac_cv_lbl_lib_$ac_lib_var=no")
-LIBS="$ac_save_LIBS"
-])dnl
-if eval "test \"`echo '$ac_cv_lbl_lib_'$ac_lib_var`\" = yes"; then
-  AC_MSG_RESULT(yes)
-  ifelse([$3], ,
-[changequote(, )dnl
-  ac_tr_lib=HAVE_LIB`echo $1 | sed -e 's/[^a-zA-Z0-9_]/_/g' \
-    -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
-changequote([, ])dnl
-  AC_DEFINE_UNQUOTED($ac_tr_lib)
-  LIBS="-l$1 $LIBS"
-], [$3])
-else
-  AC_MSG_RESULT(no)
-ifelse([$4], , , [$4
-])dnl
-fi
-])
-
-dnl
-dnl AC_LBL_LIBRARY_NET
-dnl
-dnl This test is for network applications that need socket() and
-dnl gethostbyname() -ish functions.  Under Solaris, those applications
-dnl need to link with "-lsocket -lnsl".  Under IRIX, they need to link
-dnl with "-lnsl" but should *not* link with "-lsocket" because
-dnl libsocket.a breaks a number of things (for instance:
-dnl gethostbyname() under IRIX 5.2, and snoop sockets under most
-dnl versions of IRIX).
-dnl
-dnl Unfortunately, many application developers are not aware of this,
-dnl and mistakenly write tests that cause -lsocket to be used under
-dnl IRIX.  It is also easy to write tests that cause -lnsl to be used
-dnl under operating systems where neither are necessary (or useful),
-dnl such as SunOS 4.1.4, which uses -lnsl for TLI.
-dnl
-dnl This test exists so that every application developer does not test
-dnl this in a different, and subtly broken fashion.
-
-dnl It has been argued that this test should be broken up into two
-dnl seperate tests, one for the resolver libraries, and one for the
-dnl libraries necessary for using Sockets API. Unfortunately, the two
-dnl are carefully intertwined and allowing the autoconf user to use
-dnl them independantly potentially results in unfortunate ordering
-dnl dependancies -- as such, such component macros would have to
-dnl carefully use indirection and be aware if the other components were
-dnl executed. Since other autoconf macros do not go to this trouble,
-dnl and almost no applications use sockets without the resolver, this
-dnl complexity has not been implemented.
-dnl
-dnl The check for libresolv is in case you are attempting to link
-dnl statically and happen to have a libresolv.a lying around (and no
-dnl libnsl.a).
-dnl
-AC_DEFUN([AC_LBL_LIBRARY_NET], [
-    # Most operating systems have gethostbyname() in the default searched
-    # libraries (i.e. libc):
-    AC_CHECK_FUNC(gethostbyname, ,
-	# Some OSes (eg. Solaris) place it in libnsl:
-	AC_LBL_CHECK_LIB(nsl, gethostbyname, , 
-	    # Some strange OSes (SINIX) have it in libsocket:
-	    AC_LBL_CHECK_LIB(socket, gethostbyname, ,
-		# Unfortunately libsocket sometimes depends on libnsl.
-		# AC_CHECK_LIB's API is essentially broken so the
-		# following ugliness is necessary:
-		AC_LBL_CHECK_LIB(socket, gethostbyname,
-		    LIBS="-lsocket -lnsl $LIBS",
-		    AC_CHECK_LIB(resolv, gethostbyname),
-		    -lnsl))))
-    AC_CHECK_FUNC(socket, , AC_CHECK_LIB(socket, socket, ,
-	AC_LBL_CHECK_LIB(socket, socket, LIBS="-lsocket -lnsl $LIBS", ,
-	    -lnsl)))
-    # DLPI needs putmsg under HPUX so test for -lstr while we're at it
-    AC_CHECK_LIB(str, putmsg)
-    ])
-
-dnl
-dnl Checks to see if struct tm has the BSD tm_gmtoff member
-dnl
-dnl usage:
-dnl
-dnl	AC_ACME_TM_GMTOFF
-dnl
-dnl results:
-dnl
-dnl	HAVE_TM_GMTOFF (defined)
-dnl
-AC_DEFUN([AC_ACME_TM_GMTOFF],
-    [AC_MSG_CHECKING(if struct tm has tm_gmtoff member)
-    AC_CACHE_VAL(ac_cv_acme_tm_has_tm_gmtoff,
-	AC_TRY_COMPILE([
-#	include <sys/types.h>
-#	include <time.h>],
-	[u_int i = sizeof(((struct tm *)0)->tm_gmtoff)],
-	ac_cv_acme_tm_has_tm_gmtoff=yes,
-	ac_cv_acme_tm_has_tm_gmtoff=no))
-    AC_MSG_RESULT($ac_cv_acme_tm_has_tm_gmtoff)
-    if test $ac_cv_acme_tm_has_tm_gmtoff = yes ; then
-	    AC_DEFINE(HAVE_TM_GMTOFF)
-    fi])
-
-dnl
-dnl Checks to see if int64_t exists
-dnl
-dnl usage:
-dnl
-dnl	AC_ACME_INT64T
-dnl
-dnl results:
-dnl
-dnl	HAVE_INT64T (defined)
-dnl
-AC_DEFUN([AC_ACME_INT64T],
-    [AC_MSG_CHECKING(if int64_t exists)
-    AC_CACHE_VAL(ac_cv_acme_int64_t,
-	AC_TRY_COMPILE([
-#	include <sys/types.h>],
-	[int64_t i64],
-	ac_cv_acme_int64_t=yes,
-	ac_cv_acme_int64_t=no))
-    AC_MSG_RESULT($ac_cv_acme_int64_t)
-    if test $ac_cv_acme_int64_t = yes ; then
-	    AC_DEFINE(HAVE_INT64T)
-    fi])
-
-dnl
-dnl Checks to see if socklen_t exists
-dnl
-dnl usage:
-dnl
-dnl	AC_ACME_SOCKLENT
-dnl
-dnl results:
-dnl
-dnl	HAVE_SOCKLENT (defined)
-dnl
-AC_DEFUN([AC_ACME_SOCKLENT],
-    [AC_MSG_CHECKING(if socklen_t exists)
-    AC_CACHE_VAL(ac_cv_acme_socklen_t,
-	AC_TRY_COMPILE([
-#	include <sys/types.h>
-#	include <sys/socket.h>],
-	[socklen_t slen],
-	ac_cv_acme_socklen_t=yes,
-	ac_cv_acme_socklen_t=no))
-    AC_MSG_RESULT($ac_cv_acme_socklen_t)
-    if test $ac_cv_acme_socklen_t = yes ; then
-	    AC_DEFINE(HAVE_SOCKLENT)
-    fi])
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
deleted file mode 100644
index 0a0ec32..0000000
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
+++ /dev/null
@@ -1,30 +0,0 @@
-From f12ba2a4e43e764fb0d352e5423e30de192dedef Mon Sep 17 00:00:00 2001
-From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
-Date: Fri, 7 Sep 2012 18:36:24 -0500
-
----
- extras/htpasswd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/extras/htpasswd.c b/extras/htpasswd.c
-index 31ac769..dfe4c15 100644
---- a/extras/htpasswd.c
-+++ b/extras/htpasswd.c
-@@ -47,7 +47,7 @@ static void getword(char *word, char *line, char stop) {
-     while((line[y++] = line[x++]));
- }
- 
--static int my_getline(char *s, int n, FILE *f) {
-+static int ht_getline(char *s, int n, FILE *f) {
-     int i=0;
- 
-     while(1) {
-@@ -188,7 +188,7 @@ int main(int argc, char *argv[]) {
-     user[sizeof(user)-1] = '\0';
- 
-     found = 0;
--    while(!(my_getline(line,MAX_STRING_LEN,f))) {
-+    while(!(ht_getline(line,MAX_STRING_LEN,f))) {
-         if(found || (line[0] == '#') || (!line[0])) {
-             putline(tfp,line);
-             continue;
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
deleted file mode 100644
index 8d5a4f9..0000000
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
+++ /dev/null
@@ -1,21 +0,0 @@
-From f49b3d41e74f953825f234258c1a33a5e3b914fc Mon Sep 17 00:00:00 2001
-From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
-Date: Fri, 7 Sep 2012 18:36:24 -0500
-
----
- extras/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/extras/Makefile.in b/extras/Makefile.in
-index 56942db..f174e3f 100644
---- a/extras/Makefile.in
-+++ b/extras/Makefile.in
-@@ -36,7 +36,7 @@ CCOPT =		@V_CCOPT@
- DEFS =		@DEFS@
- INCLS =		-I..
- CFLAGS =	$(CCOPT) $(DEFS) $(INCLS)
--STATICFLAG =	@V_STATICFLAG@
-+STATICFLAG =	
- LDFLAGS =	@LDFLAGS@
- LIBS =		@LIBS@
- NETLIBS =	@V_NETLIBS@
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/init b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/init
deleted file mode 100644
index df6d648..0000000
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/init
+++ /dev/null
@@ -1,47 +0,0 @@
-#! /bin/sh 
-#
-# This is an init script for openembedded
-# Copy it to /etc/init.d/thttpd and type
-# > update-rc.d thttpd defaults 60
-#
-
-
-thttpd=/usr/sbin/thttpd
-test -x "$thttpd" || exit 0
-
-
-case "$1" in
-  start)
-    echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping thttpd"
-    start-stop-daemon --stop --quiet --exec $thttpd
-    echo "."
-    ;;
-  reload|force-reload)
-    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd 
-    ;;
-  restart)
-    echo -n "Stopping thttpd"
-    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
-    echo "."
-    echo -n "Waiting for thttpd to die off"
-    for i in 1 2 3 ;
-    do
-        sleep 1
-        echo -n "."
-    done
-    echo ""
-    echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
deleted file mode 100644
index 03957b1..0000000
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b8fdc90a5dc58a4d0f4bc53f92ee06f57eca026e Mon Sep 17 00:00:00 2001
-From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
-Date: Fri, 7 Sep 2012 18:36:24 -0500
-Subject: [PATCH] thttpd: Adding thttpd
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
----
- Makefile.in         |  5 +++--
- cgi-src/Makefile.in | 18 +++++++-----------
- extras/Makefile.in  | 22 ++++++++++------------
- 3 files changed, 20 insertions(+), 25 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index ded71e0..8ea5a90 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -27,6 +27,7 @@
- # Various configurable paths (remember to edit Makefile.in, not Makefile)
- 
- # Top level hierarchy.
-+DESTDIR = 
- prefix = @prefix@
- exec_prefix = @exec_prefix@
- # Pathname of directory to install the binary.
-@@ -110,11 +111,11 @@ install:	installthis install-man installsubdirs
- 
- installthis:
- 	-mkdir -p $(DESTDIR)$(BINDIR)
--	$(INSTALL) -m 555 -o bin -g bin thttpd $(DESTDIR)$(BINDIR)
-+	$(INSTALL) -m 755 thttpd $(DESTDIR)$(BINDIR)
- 
- install-man:
- 	-mkdir -p $(DESTDIR)$(MANDIR)/man8
--	$(INSTALL) -m 444 -o bin -g bin thttpd.8 $(DESTDIR)$(MANDIR)/man8
-+	$(INSTALL) -m 644 thttpd.8 $(DESTDIR)$(MANDIR)/man8
- 
- installsubdirs:
- 	for i in $(SUBDIRS) ; do ( \
-diff --git a/cgi-src/Makefile.in b/cgi-src/Makefile.in
-index 6e4e9ba..27482dc 100644
---- a/cgi-src/Makefile.in
-+++ b/cgi-src/Makefile.in
-@@ -67,17 +67,13 @@ strerror.o:
- 	cd .. ; $(MAKE) $(MFLAGS) strerror.o
- 
- install:	all
--	-mkdir -p $(CGIBINDIR)
--	rm -f $(CGIBINDIR)/redirect
--	cp redirect $(CGIBINDIR)/redirect
--	rm -f $(MANDIR)/man8/redirect.8
--	cp redirect.8 $(MANDIR)/man8/redirect.8
--	rm -f $(CGIBINDIR)/ssi
--	cp ssi $(CGIBINDIR)/ssi
--	rm -f $(MANDIR)/man8/ssi.8
--	cp ssi.8 $(MANDIR)/man8/ssi.8
--	rm -f $(CGIBINDIR)/phf
--	cp phf $(CGIBINDIR)/phf
-+	install -d $(DESTDIR)$(CGIBINDIR)
-+	install -m 0755 redirect $(DESTDIR)$(CGIBINDIR)/redirect
-+	install -d $(DESTDIR)$(MANDIR)/man8
-+	install -m 0644 redirect.8 $(DESTDIR)$(MANDIR)/man8/redirect.8
-+	install -m 0755 ssi $(DESTDIR)$(CGIBINDIR)/ssi
-+	install -m 0644 ssi.8 $(DESTDIR)$(MANDIR)/man8/ssi.8
-+	install -m 0755 phf $(DESTDIR)$(CGIBINDIR)/phf
- 
- clean:
- 	rm -f $(CLEANFILES)
-diff --git a/extras/Makefile.in b/extras/Makefile.in
-index a29780f..56942db 100644
---- a/extras/Makefile.in
-+++ b/extras/Makefile.in
-@@ -66,18 +66,16 @@ htpasswd.o:	htpasswd.c ../config.h
- 
- 
- install:	all
--	rm -f $(BINDIR)/makeweb $(BINDIR)/htpasswd $(BINDIR)/syslogtocern
--	cp makeweb $(BINDIR)/makeweb
--	chgrp $(WEBGROUP) $(BINDIR)/makeweb
--	chmod 2755 $(BINDIR)/makeweb
--	cp htpasswd $(BINDIR)/htpasswd
--	cp syslogtocern $(BINDIR)/syslogtocern
--	rm -f $(MANDIR)/man1/makeweb.1
--	cp makeweb.1 $(MANDIR)/man1/makeweb.1
--	rm -f $(MANDIR)/man1/htpasswd.1
--	cp htpasswd.1 $(MANDIR)/man1/htpasswd.1
--	rm -f $(MANDIR)/man8/syslogtocern.8
--	cp syslogtocern.8 $(MANDIR)/man8/syslogtocern.8
-+	install -d $(DESTDIR)$(BINDIR)
-+#	install -g $(WEBGROUP) -m 2755 makeweb $(DESTDIR)$(BINDIR)/makeweb
-+	install -m 2755 makeweb $(DESTDIR)$(BINDIR)/makeweb
-+	install -m 0755 htpasswd $(DESTDIR)$(BINDIR)/htpasswd
-+	install -m 0755 syslogtocern $(DESTDIR)$(BINDIR)/syslogtocern
-+	install -d $(DESTDIR)$(MANDIR)/man1 \
-+		   $(DESTDIR)$(MANDIR)/man8
-+	install -m 0644 makeweb.1 $(DESTDIR)$(MANDIR)/man1/makeweb.1
-+	install -m 0644 htpasswd.1 $(DESTDIR)$(MANDIR)/man1/htpasswd.1
-+	install -m 0644 syslogtocern.8 $(DESTDIR)$(MANDIR)/man8/syslogtocern.8
- 
- clean:
- 	rm -f $(CLEANFILES)
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
deleted file mode 100644
index 741e1bd..0000000
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-# This recipe didn't exist in oe-core/meta-oe. Adding recipe here but the recipe 
-# has been submitted to meta-oe.
-
-DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server."
-LICENSE = "BSD"
-HOMEPAGE = "http://www.acme.com/software/thttpd/"
-PR ="r0"
-
-DEPENDS += "virtual/crypt"
-
-LIC_FILES_CHKSUM = "file://thttpd.c;beginline=1;endline=26;md5=525c6428ecff95f4e71d5b3c88a34fff"
-SRC_URI = "http://www.acme.com/software/thttpd/thttpd-${PV}.tar.gz \
-	   file://install.patch \
-	   file://acinclude.m4 \
-	   file://init \
-	   file://htpasswd_shared.diff \
-       file://htpasswd_getline.diff"
-
-S = "${WORKDIR}/thttpd-${PV}"
-
-PARALLEL_MAKE = ""
-
-INITSCRIPT_NAME = "thttpd"
-INITSCRIPT_PARAMS = "defaults"
-
-inherit autotools-brokensep update-rc.d
-
-EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
-FILES_${PN}-dbg_append = " ${servicedir}/www/cgi-bin/.debug"
-FILES_${PN}_append = " ${servicedir}"
-
-do_configure () {
-	install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
-	autotools_do_configure
-}
-
-do_install_append () {
-	install -d "${D}${sysconfdir}/init.d"
-	cat ${WORKDIR}/init | sed -e 's,@@SRVDIR,${servicedir}/www,g' > ${WORKDIR}/thttpd
-	install -c -m 755 ${WORKDIR}/thttpd ${D}${sysconfdir}/init.d/thttpd
-}
-
-
-SRC_URI[md5sum] = "f5747680740dfbf8fc73a4fd82c754bb"
-SRC_URI[sha256sum] = "8552f929d4ede26cb193411c1208168e169dda24ee9eb1da8f8da4f4f8e10328"
-- 
2.7.4


