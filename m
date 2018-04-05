Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8AA4852986
	for <meta-arago@arago-project.org>;
	Thu,  5 Apr 2018 01:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C804D20B22;
	Thu,  5 Apr 2018 01:47:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MgLw-3nD6Y_o; Thu,  5 Apr 2018 01:47:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DDDF207AD;
	Thu,  5 Apr 2018 01:47:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1F6051633BB;
	Wed,  4 Apr 2018 21:47:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  4 Apr 2018 21:47:20 -0400
Message-Id: <1522892840-8068-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] thttpd: refresh local patches to avoid fuzz warnings
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
X-List-Received-Date: Thu, 05 Apr 2018 01:47:24 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../thttpd/thttpd-2.28/htpasswd_getline.diff       | 20 ++++--
 .../thttpd/thttpd-2.28/htpasswd_shared.diff        | 16 ++++-
 .../thttpd/thttpd-2.28/install.patch               | 82 +++++++++++++---------
 3 files changed, 77 insertions(+), 41 deletions(-)

diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
index 7edd313..0a0ec32 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
@@ -1,6 +1,16 @@
---- thttpd-2.25b/extras/htpasswd.c.old	2010-04-28 17:23:40.000000000 +0100
-+++ thttpd-2.25b/extras/htpasswd.c	2010-04-28 17:24:00.000000000 +0100
-@@ -49,7 +49,7 @@
+From f12ba2a4e43e764fb0d352e5423e30de192dedef Mon Sep 17 00:00:00 2001
+From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
+Date: Fri, 7 Sep 2012 18:36:24 -0500
+
+---
+ extras/htpasswd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/extras/htpasswd.c b/extras/htpasswd.c
+index 31ac769..dfe4c15 100644
+--- a/extras/htpasswd.c
++++ b/extras/htpasswd.c
+@@ -47,7 +47,7 @@ static void getword(char *word, char *line, char stop) {
      while((line[y++] = line[x++]));
  }
  
@@ -9,8 +19,8 @@
      int i=0;
  
      while(1) {
-@@ -189,7 +189,7 @@
-     strcpy(user,argv[2]);
+@@ -188,7 +188,7 @@ int main(int argc, char *argv[]) {
+     user[sizeof(user)-1] = '\0';
  
      found = 0;
 -    while(!(my_getline(line,MAX_STRING_LEN,f))) {
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
index 7ee2cd2..8d5a4f9 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
@@ -1,6 +1,16 @@
---- thttpd-2.25b/extras/Makefile.in.orig	2007-03-17 22:30:47.356393000 +0100
-+++ thttpd-2.25b/extras/Makefile.in	2007-03-17 22:31:34.566393000 +0100
-@@ -36,7 +36,7 @@
+From f49b3d41e74f953825f234258c1a33a5e3b914fc Mon Sep 17 00:00:00 2001
+From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
+Date: Fri, 7 Sep 2012 18:36:24 -0500
+
+---
+ extras/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extras/Makefile.in b/extras/Makefile.in
+index 56942db..f174e3f 100644
+--- a/extras/Makefile.in
++++ b/extras/Makefile.in
+@@ -36,7 +36,7 @@ CCOPT =		@V_CCOPT@
  DEFS =		@DEFS@
  INCLS =		-I..
  CFLAGS =	$(CCOPT) $(DEFS) $(INCLS)
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
index cdf92a9..03957b1 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
@@ -1,10 +1,22 @@
+From b8fdc90a5dc58a4d0f4bc53f92ee06f57eca026e Mon Sep 17 00:00:00 2001
+From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
+Date: Fri, 7 Sep 2012 18:36:24 -0500
+Subject: [PATCH] thttpd: Adding thttpd
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
 #
 
---- thttpd-2.25b/Makefile.in~install.patch
-+++ thttpd-2.25b/Makefile.in
+---
+ Makefile.in         |  5 +++--
+ cgi-src/Makefile.in | 18 +++++++-----------
+ extras/Makefile.in  | 22 ++++++++++------------
+ 3 files changed, 20 insertions(+), 25 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ded71e0..8ea5a90 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -27,6 +27,7 @@
  # Various configurable paths (remember to edit Makefile.in, not Makefile)
  
@@ -13,7 +25,7 @@
  prefix = @prefix@
  exec_prefix = @exec_prefix@
  # Pathname of directory to install the binary.
-@@ -110,11 +111,11 @@
+@@ -110,11 +111,11 @@ install:	installthis install-man installsubdirs
  
  installthis:
  	-mkdir -p $(DESTDIR)$(BINDIR)
@@ -27,9 +39,40 @@
  
  installsubdirs:
  	for i in $(SUBDIRS) ; do ( \
---- thttpd-2.25b/extras/Makefile.in~install.patch
-+++ thttpd-2.25b/extras/Makefile.in
-@@ -66,18 +66,16 @@
+diff --git a/cgi-src/Makefile.in b/cgi-src/Makefile.in
+index 6e4e9ba..27482dc 100644
+--- a/cgi-src/Makefile.in
++++ b/cgi-src/Makefile.in
+@@ -67,17 +67,13 @@ strerror.o:
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
+diff --git a/extras/Makefile.in b/extras/Makefile.in
+index a29780f..56942db 100644
+--- a/extras/Makefile.in
++++ b/extras/Makefile.in
+@@ -66,18 +66,16 @@ htpasswd.o:	htpasswd.c ../config.h
  
  
  install:	all
@@ -58,30 +101,3 @@
  
  clean:
  	rm -f $(CLEANFILES)
---- thttpd-2.25b/cgi-src/Makefile.in~install.patch
-+++ thttpd-2.25b/cgi-src/Makefile.in
-@@ -67,17 +67,13 @@
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
-- 
2.7.4


