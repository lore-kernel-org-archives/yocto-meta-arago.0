Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 78D0D52A0B
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB00F0VU79X130@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:22 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ReEn0Opq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=LNp7xqXEDATwGpXNvhgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 720C72025C;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:52:01 -0400
Message-id: <1426546322-25230-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426546322-25230-1-git-send-email-denis@denix.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/7] arago-prefs: set up preferences for target gcc
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index fa7a83c..4f2c854 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,18 +1,17 @@
 # Set *target* toolchain preferences at global distro level.
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "4.8%"
-BINUVERSION ?= "2.24%"
-EGLIBCVERSION ?= "2.19%"
+GCCVERSION ?= "linaro-4.7%"
+BINUVERSION ?= "linaro-2.24%"
+EGLIBCVERSION ?= "linaro-2.19%"
+EGLIBCINITVERSION ?= "2.19%"
 LINUXLIBCVERSION ?= "3.14"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
-PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-initial ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-initial ?= "${EGLIBCINITVERSION}"
 
 # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
 include conf/distro/include/qt5-versions.inc
-- 
2.2.0


