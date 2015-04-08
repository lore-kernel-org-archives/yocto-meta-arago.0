Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 569AB52A0D
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 21:59:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI00AYUD385PI0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 08 Apr 2015 16:59:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=e7Wxkht6 c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8	a=GS5-QL3eAvhQ4eZ0VYkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 16209200F0;	Wed,
	8 Apr 2015 17:59:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 08 Apr 2015 17:59:31 -0400
Message-id: <1428530371-3240-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: enhance securuty flags and stack protection
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
X-List-Received-Date: Wed, 08 Apr 2015 21:59:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c597e1d..b928acd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -54,9 +54,15 @@ TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT', True),'gcc'][d.getVar('TOOLC
 require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 
-# Enable basic stack and buffer overflow protections
-#TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
-TARGET_CPPFLAGS += "-fstack-protector"
+# Enable default stack and buffer overflow protections
+require conf/distro/include/security_flags.inc
+SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-leveldb = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-bash = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-mariadb = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-php = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-qtbase = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-ltp-ddt = "-fstack-protector"
 
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
-- 
2.2.0


