Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D416A52A41
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2018 02:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5EC5C207AB;
	Thu,  9 Aug 2018 02:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pwPzdRoawgmL; Thu,  9 Aug 2018 02:01:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D83B820C5A;
	Thu,  9 Aug 2018 02:00:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3A1CE16357C;
	Wed,  8 Aug 2018 22:00:58 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  8 Aug 2018 22:00:45 -0400
Message-Id: <1533780054-50159-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533780054-50159-1-git-send-email-denys@ti.com>
References: <1533780054-50159-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 05/14] toolchain-gcc: update binutils preference to 2.31
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
X-List-Received-Date: Thu, 09 Aug 2018 02:01:11 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 3a8c77d..da1deea 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 
 # Set Cross and SDK toolchain preferences
 SDKGCCVERSION ?= "7.3%"
-SDKBINUVERSION ?= "2.30%"
+SDKBINUVERSION ?= "2.31%"
 SDKGLIBCVERSION ?= "2.27%"
 SDKLINUXLIBCVERSION ?= "4.14%"
 
@@ -33,7 +33,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
 GCCVERSION ?= "7.3%"
-BINUVERSION ?= "2.30%"
+BINUVERSION ?= "2.31%"
 GLIBCVERSION ?= "2.27%"
 LINUXLIBCVERSION ?= "4.14%"
 
-- 
2.7.4


