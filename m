Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 997A2529C6
	for <meta-arago@arago-project.org>;
	Tue,  5 May 2015 12:22:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NNV009EPMCO6P90@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 05 May 2015 07:22:01 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=E6x6fhYN c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=ZFKxosHXK7b1d1tgXCsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AD9C920076;	Tue,
	5 May 2015 08:22:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 05 May 2015 08:22:00 -0400
Message-id: <1430828520-13941-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] nativesdk-packagegroup-arago-sdk-host: cgt6x deps is machine-specific
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
X-List-Received-Date: Tue, 05 May 2015 12:22:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Continue fixing md5sum related issues in multi-machine builds...

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 6615839..46722e2 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r6"
+PR = "r7"
 LICENSE = "MIT"
 
 inherit nativesdk packagegroup
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 EXTRA_TOOLS = ""
 EXTRA_TOOLS_omap-a15 = "nativesdk-ti-cgt6x"
 
-- 
2.2.0


