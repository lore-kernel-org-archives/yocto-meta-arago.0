Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 8874252972
	for <meta-arago@arago-project.org>;
	Tue, 28 Jan 2014 01:07:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0300MXZ72X1E30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 27 Jan 2014 19:06:48 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ED157200AC; Mon,
	27 Jan 2014 20:06:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 27 Jan 2014 20:06:32 -0500
Message-id: <1390871192-3063-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] php: amend URL with the new location of the source tarball
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
X-List-Received-Date: Tue, 28 Jan 2014 01:07:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
index fb1c25d..ebf480c 100644
--- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
@@ -1,10 +1,13 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
 
+python __anonymous () {
+    d.setVar("SRC_URI", d.getVar("SRC_URI").replace('http://www.php.net/distributions/php-${PV}.tar.bz2', 'http://museum.php.net/php5/php-${PV}.tar.bz2'))
+}
 
 # Work around to address the fact that php-fpm and php-cgi can not coexist
 # php-cgi is used by Matrix and php-fpm is in beta for this version of php.
-- 
1.8.3.2


