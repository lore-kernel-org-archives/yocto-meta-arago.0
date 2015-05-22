Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4607752A7D
	for <meta-arago@arago-project.org>;
	Fri, 22 May 2015 21:38:59 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOR00AC2TGF5X50@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 22 May 2015 16:38:40 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ZJdgQs+z c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8 a=67BIL_jfAAAA:8	a=WrUew-f8XKMvGGEqbEYA:9
	a=udp4jTLay8sA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 34EDC20099;	Fri,
	22 May 2015 17:38:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 22 May 2015 17:38:39 -0400
Message-id: <1432330719-16698-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] php, openobex: use _remove and don't expand EXTRA_OECONF to not kill sstate
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
X-List-Received-Date: Fri, 22 May 2015 21:38:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/openobex/openobex_1.5.bbappend           | 6 +++---
 meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend        | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend b/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
index b4d7319..458e1d4 100644
--- a/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 # Add apps/obex_test for testing
 do_configure_prepend() {
@@ -12,8 +12,8 @@ do_configure_prepend() {
 # enabling log and dump prints lots of debug messages and hex dump value during BT
 # file transfer using openobex, due to which BT transfer get slow.
 
-EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--enable-syslog', '')}"
-EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--enable-dump', '')}"
+EXTRA_OECONF_remove = "--enable-syslog"
+EXTRA_OECONF_remove = "--enable-dump"
 
 # WiLink Bluetooth application build depends on libmisc.a.
 do_install_append() {
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
index b8dff82..2cc5630 100644
--- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 SRC_URI_append = " file://fix-race-condition-during-install.patch"
 
@@ -16,10 +16,10 @@ python __anonymous () {
 # Once this issue is fix in meta-oe the below won't be needed.
 # Issue mentioned here: https://bugs.php.net/bug.php?id=60144
 
-EXTRA_OECONF := "${@oe_filter_out('--enable-fpm', '${EXTRA_OECONF}', d)}"
+EXTRA_OECONF_remove = "--enable-fpm"
 
-PACKAGES := "${@oe_filter_out('${PN}-fpm', '${PACKAGES}', d)}"
-PACKAGES := "${@oe_filter_out('${PN}-fpm-apache2', '${PACKAGES}', d)}"
+PACKAGES_remove = "${PN}-fpm"
+PACKAGES_remove = "${PN}-fpm-apache2"
 
 do_install_prepend_pn-php() {
     # Add the below file even though we aren't going to use it.
-- 
2.2.0


