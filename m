Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2EE8452A10
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D916140C0E;
	Tue, 17 Mar 2020 20:11:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aRZWMn3xSMRQ; Tue, 17 Mar 2020 20:11:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD9A240C2C;
	Tue, 17 Mar 2020 20:11:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3722317126B;
	Tue, 17 Mar 2020 16:11:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2020 16:11:44 -0400
Message-Id: <1584475904-3730-9-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584475904-3730-1-git-send-email-denys@ti.com>
References: <1584475904-3730-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 9/9] toolchain-arm: update component versions
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
X-List-Received-Date: Tue, 17 Mar 2020 20:14:00 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index 3ce56e3..c5520ed 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -48,9 +48,9 @@ PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
 
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "arm-9.2%"
-SDKGDBVERSION ?= "8.3%"
-SDKBINUVERSION ?= "2.32%"
-SDKGLIBCVERSION ?= "2.30%"
+SDKGDBVERSION ?= "9.1%"
+SDKBINUVERSION ?= "2.34%"
+SDKGLIBCVERSION ?= "2.31%"
 SDKLINUXLIBCVERSION ?= "5.4%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -70,9 +70,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
 GCCVERSION ?= "arm-9.2%"
-GDBVERSION ?= "8.3%"
-BINUVERSION ?= "2.32%"
-GLIBCVERSION ?= "2.30%"
+GDBVERSION ?= "9.1%"
+BINUVERSION ?= "2.34%"
+GLIBCVERSION ?= "2.31%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
-- 
2.7.4


