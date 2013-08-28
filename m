Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 9984152099
	for <meta-arago@arago-project.org>;
	Wed, 28 Aug 2013 17:41:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS9002LR54YZ740@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 28 Aug 2013 12:41:32 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DF5EE20087; Wed,
	28 Aug 2013 13:41:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 28 Aug 2013 13:41:16 -0400
Message-id: <1377711676-11007-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] arago.conf: bump wget connection timeout to 5 min
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
X-List-Received-Date: Wed, 28 Aug 2013 17:41:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Longer timeout helps dealing with slow proxies
* Fix typo

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 73c1d19..18299bd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -13,6 +13,9 @@ SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 # Mask some broken recipes
 BBMASK = "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-oe/recipes-extended/lighttpd|meta-linaro/recipes-core/netbase"
 
+# Bump the connection timeout to 5 minutes to overcome slow proxy servers
+FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 300 -nv --passive-ftp --no-check-certificate"
+
 # Also build 32bit Pseudo on 64bit machines, fix error when preloading libpseudo.so
 NO32LIBS = "0"
 
@@ -50,7 +53,7 @@ POLKITAUTH = ""
 # Enable generation of source packages for SDKs
 require arago-source-ipk.conf
 
-# Set ENTERPRISE_DISTRO flag to insure that recipes that have been flagged
+# Set ENTERPRISE_DISTRO flag to ensure that recipes that have been flagged
 # do not attempt to enable features that have potential commercial
 # licensing issues.
 ENTERPRISE_DISTRO = "1"
-- 
1.8.3.2


