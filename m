Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 68E3F52983
	for <meta-arago@arago-project.org>;
	Mon, 19 Feb 2018 18:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B9D7C20B15;
	Mon, 19 Feb 2018 18:14:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id g1IKYdYLIW7H; Mon, 19 Feb 2018 18:14:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0190B2073F;
	Mon, 19 Feb 2018 18:14:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 371151631E8;
	Mon, 19 Feb 2018 13:14:18 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Feb 2018 13:14:17 -0500
Message-Id: <1519064057-5743-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] toolchain-linaro: abstract TOOLCHAIN_PATH setting for default override
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
X-List-Received-Date: Mon, 19 Feb 2018 18:14:44 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 61a3b50..a3d52fe 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -17,9 +17,11 @@ TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-ti2018.00-armv5-x86_
 TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-2017.11-x86_64_${ELT_TARGET_SYS_ARMV7}"
 TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-2017.11-x86_64_${ELT_TARGET_SYS_ARMV8}"
 
-TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
-TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
-TOOLCHAIN_PATH_aarch64 = "${TOOLCHAIN_PATH_ARMV8}"
+DEF_TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
+DEF_TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
+DEF_TOOLCHAIN_PATH_aarch64 = "${TOOLCHAIN_PATH_ARMV8}"
+
+TOOLCHAIN_PATH ?= "${DEF_TOOLCHAIN_PATH}"
 
 TOOLCHAIN_SYS := "${ELT_TARGET_SYS}"
 TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
-- 
2.7.4


