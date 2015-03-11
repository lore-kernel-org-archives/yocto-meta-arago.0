Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 4E890529F8
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 17:46:00 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NL200ITY6ON1440@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Mar 2015 12:45:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Pd9IXZlY c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=3yB8C62dX_PH1BZ7gBsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1594020088;	Wed,
	11 Mar 2015 13:45:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Mar 2015 13:45:58 -0400
Message-id: <1426095958-20778-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] serialcheck: move to extras for better availability outside of arago distro
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
X-List-Received-Date: Wed, 11 Mar 2015 17:46:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../serialcheck/0001-Add-option-to-enable-internal-loopback.patch       | 0
 .../serialcheck/serialcheck/0002-Restore-original-loopback-config.patch | 0
 .../recipes-devtools/serialcheck/serialcheck_1.0.0.bb                   | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta-arago-distro => meta-arago-extras}/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch (100%)
 rename {meta-arago-distro => meta-arago-extras}/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch (100%)
 rename {meta-arago-distro => meta-arago-extras}/recipes-devtools/serialcheck/serialcheck_1.0.0.bb (100%)

diff --git a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
similarity index 100%
rename from meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
rename to meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
diff --git a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
similarity index 100%
rename from meta-arago-distro/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
rename to meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
diff --git a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
similarity index 100%
rename from meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
rename to meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index 4538bf8..5f0530f 100644
--- a/meta-arago-distro/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Application to verify operation of serial ports"
 HOMEPAGE = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
 LICENSE = "GPLv2"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
 SRC_URI = "git://git.breakpoint.cc/bigeasy/serialcheck.git"
 
 SRC_URI_append = " file://0001-Add-option-to-enable-internal-loopback.patch \
-- 
2.2.0


