Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B0D3E529CE
	for <meta-arago@arago-project.org>;
	Tue, 14 Mar 2017 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEE3A20BAB;
	Tue, 14 Mar 2017 21:49:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id skdl4v5JXoOZ; Tue, 14 Mar 2017 21:49:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89A25208FB;
	Tue, 14 Mar 2017 21:49:30 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 019891623C7;
	Tue, 14 Mar 2017 17:49:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 14 Mar 2017 17:49:28 -0400
Message-Id: <1489528169-125604-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] toolchain-gcc: update preference for binutils 2.28
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
X-List-Received-Date: Tue, 14 Mar 2017 21:49:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 50fb5e1..89f00c6 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "6.3%"
-SDKBINUVERSION ?= "2.27%"
+SDKBINUVERSION ?= "2.28%"
 SDKGLIBCVERSION ?= "2.25%"
 SDKLINUXLIBCVERSION ?= "4.9%"
 
@@ -35,7 +35,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
 GCCVERSION ?= "6.3%"
-BINUVERSION ?= "2.27%"
+BINUVERSION ?= "2.28%"
 GLIBCVERSION ?= "2.25%"
 GLIBCINITVERSION ?= "2.25%"
 LINUXLIBCVERSION ?= "4.9%"
-- 
2.7.4


