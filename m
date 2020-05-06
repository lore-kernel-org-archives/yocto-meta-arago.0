Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5519652A05
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 18:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5672240C2E;
	Wed,  6 May 2020 18:14:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iygL2Bc2jcEk; Wed,  6 May 2020 18:14:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7674540A6E;
	Wed,  6 May 2020 18:14:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2BF4416EC83;
	Wed,  6 May 2020 14:14:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  6 May 2020 14:14:45 -0400
Message-Id: <1588788886-53641-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] external-arm-sdk-toolchain: avoid clashing when doing multiple archs
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
X-List-Received-Date: Wed, 06 May 2020 18:17:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

This properly separates cross-canadian packages for multiple architectures
in a single build.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-arm.inc           | 6 +++---
 meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb | 5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index fd63256..0ee0a4c 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -27,9 +27,9 @@ TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-arm-toolchain"
 
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
-#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain"
+PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
+#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
 
 # Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
 bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
index 45ae218..e432389 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
@@ -2,7 +2,10 @@ inherit cross-canadian
 
 require external-arm-bfd-version.inc
 
-PR = "r8"
+PR = "r9"
+
+PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
+BPN = "external-arm-sdk-toolchain"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4


