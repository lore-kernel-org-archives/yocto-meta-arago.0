Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 438DE5203A
	for <meta-arago@arago-project.org>;
	Thu,  7 Feb 2019 04:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 55B7540B53;
	Thu,  7 Feb 2019 04:11:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qNyYspDEtb1X; Thu,  7 Feb 2019 04:11:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37DD740951;
	Thu,  7 Feb 2019 04:10:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 58DE716986C;
	Wed,  6 Feb 2019 23:10:58 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Feb 2019 23:10:57 -0500
Message-Id: <1549512657-8810-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] toolchain-arm.inc: binutils "arm-2.30" is not available, use 2.31 for now
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
X-List-Received-Date: Thu, 07 Feb 2019 04:11:14 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 15e9af2..623aed4 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -46,7 +46,7 @@ PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "arm-8.2%"
 SDKGDBVERSION ?= "8.2"
-SDKBINUVERSION ?= "arm-2.30%"
+SDKBINUVERSION ?= "2.31%"
 SDKGLIBCVERSION ?= "2.28%"
 SDKLINUXLIBCVERSION ?= "4.14%"
 
@@ -68,7 +68,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Can be overwritten globally, if needed
 GCCVERSION ?= "arm-8.2%"
 GDBVERSION ?= "8.2"
-BINUVERSION ?= "arm-2.30%"
+BINUVERSION ?= "2.31%"
 GLIBCVERSION ?= "2.28%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
2.7.4


