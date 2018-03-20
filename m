Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 432AA52998
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 22:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 828FF20B73;
	Tue, 20 Mar 2018 22:51:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Fhlo7pTUE_HO; Tue, 20 Mar 2018 22:51:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5585E2099C;
	Tue, 20 Mar 2018 22:51:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C5E6416337A;
	Tue, 20 Mar 2018 18:51:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Mar 2018 18:51:15 -0400
Message-Id: <1521586275-2477-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] toolchain-linaro: also set preference for gdb-cross-canadian
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
X-List-Received-Date: Tue, 20 Mar 2018 22:52:17 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index a3d52fe..cba29bb 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -50,6 +50,7 @@ SDKLINUXLIBCVERSION ?= "4.9%"
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gdb-crosssdk-${SDK_SYS} ?= "${SDKGDBVERSION}"
+PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${SDKGDBVERSION}"
 PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
 
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-- 
2.7.4


