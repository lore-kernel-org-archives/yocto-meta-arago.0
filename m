Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 6F54A52AE4
	for <meta-arago@arago-project.org>;
	Tue,  5 May 2015 18:35:00 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NNW00FVT3LL9D70@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 05 May 2015 13:34:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ap5ZB14n c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=KGgA8u6hXsqP5-OKcjkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6BBA620030;	Tue,
	5 May 2015 14:34:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 05 May 2015 14:34:32 -0400
Message-id: <1430850872-9396-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] nativesdk-packagegroup-*: reorder inheriting of nativesdk and packagegroup classes
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
X-List-Received-Date: Tue, 05 May 2015 18:35:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is important to get the PACKAGE_ARCH set properly.
It used to be a mere warning before:

WARNING: The recipe nativesdk-packagegroup-* is trying to install
    files into a shared area when those files already exist. Those files and
    their manifest location are: ...

Now it gets manifested in md5sum mismatch from opkg when the package gets rebuilt
in multi-machine build.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb  | 4 ++--
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
index b0166ed..25d4f15 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Host packages for Qt Embedded SDK"
-PR = "r9"
+PR = "r10"
 LICENSE = "MIT"
 
-inherit nativesdk packagegroup qt-vars
+inherit packagegroup nativesdk qt-vars
 
 RDEPENDS_${PN} = "\
     nativesdk-packagegroup-arago-sdk-host \
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index f0b2d78..ec80bcb 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r8"
+PR = "r9"
 LICENSE = "MIT"
 
-inherit nativesdk packagegroup
+inherit packagegroup nativesdk
 
 EXTRA_TOOLS = "nativesdk-ti-cgt6x"
 
-- 
2.2.0


