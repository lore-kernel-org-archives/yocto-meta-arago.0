Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 914CB52A08
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW006RN5RS7Y10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=67BIL_jfAAAA:8	a=ijFNF1gXmi4lDK3DKxUA:9
	a=vTkQX3rwq8RlNF_n:21 a=Q5MI8HgEFfMVbFSe:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2E9D9161ACC;	Thu,
	2 Jul 2015 23:02:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:29 -0400
Message-id: <1435892533-6046-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 10/54] php: update to latest version, drop upstreamed fixes
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../php/php/fix-race-condition-during-install.patch           | 10 ----------
 .../php/{php_5.4.14.bbappend => php_5.5.21.bbappend}          | 11 +++--------
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
 rename meta-arago-distro/recipes-devtools/php/{php_5.4.14.bbappend => php_5.5.21.bbappend} (70%)

diff --git a/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch b/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
deleted file mode 100644
index f4f3fb6..0000000
--- a/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
+++ /dev/null
@@ -1,10 +0,0 @@
-diff -rupN php-5.4.14/sapi/cgi/Makefile.frag php-5.4.14.0/sapi/cgi/Makefile.frag
---- php-5.4.14/sapi/cgi/Makefile.frag	2013-04-10 03:47:04.000000000 -0400
-+++ php-5.4.14.0/sapi/cgi/Makefile.frag	2015-05-08 11:41:10.389484079 -0400
-@@ -5,5 +5,6 @@ $(SAPI_CGI_PATH): $(PHP_GLOBAL_OBJS) $(P
- 
- install-cgi: $(SAPI_CGI_PATH)
- 	@echo "Installing PHP CGI binary:        $(INSTALL_ROOT)$(bindir)/"
-+	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
- 	@$(INSTALL) -m 0755 $(SAPI_CGI_PATH) $(INSTALL_ROOT)$(bindir)/$(program_prefix)php-cgi$(program_suffix)$(EXEEXT)
- 
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.5.21.bbappend
similarity index 70%
rename from meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
rename to meta-arago-distro/recipes-devtools/php/php_5.5.21.bbappend
index 2cc5630..9ed88ef 100644
--- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_5.5.21.bbappend
@@ -1,16 +1,10 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago4"
-
-SRC_URI_append = " file://fix-race-condition-during-install.patch"
+PR_append = "-arago1"
 
 SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
 
-python __anonymous () {
-    d.setVar("SRC_URI", d.getVar("SRC_URI").replace('http://www.php.net/distributions/php-${PV}.tar.bz2', 'http://museum.php.net/php5/php-${PV}.tar.bz2'))
-}
-
 # Work around to address the fact that php-fpm and php-cgi can not coexist
 # php-cgi is used by Matrix and php-fpm is in beta for this version of php.
 # Once this issue is fix in meta-oe the below won't be needed.
@@ -24,5 +18,6 @@ PACKAGES_remove = "${PN}-fpm-apache2"
 do_install_prepend_pn-php() {
     # Add the below file even though we aren't going to use it.
     # do_install will complain and fail if this file isn't found.
-    touch ${S}/sapi/fpm/init.d.php-fpm
+    mkdir -p ${B}/sapi/fpm/
+    touch ${B}/sapi/fpm/init.d.php-fpm
 }
-- 
2.2.0


