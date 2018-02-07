Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9BB9052A53
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 474BB20B04;
	Wed,  7 Feb 2018 20:33:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id I1ckx-Bv22pE; Wed,  7 Feb 2018 20:33:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28857200BB;
	Wed,  7 Feb 2018 20:33:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0BA93163289;
	Wed,  7 Feb 2018 15:33:18 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:06 -0500
Message-Id: <1518035594-38357-7-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 07/15] external-linaro-toolchain, gcc: move external-linaro-toolchain-cross dependency
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:31 -0000

Since gcc is the one that needs it and no common sysroot available now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend                  | 3 +++
 meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
index b84c9e4..92f2874 100644
--- a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
@@ -1 +1,4 @@
 DEPENDS =+ "flex-native"
+
+EXTRA_DEPS = "${@['','external-linaro-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE', True) == 'external' and d.getVar('TOOLCHAIN_BRAND', True) == 'linaro']}"
+DEPENDS += "${EXTRA_DEPS}"
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index ae74e37..df5b5c0 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -26,8 +26,6 @@ PACKAGES =+ "libgcc-dev"
 
 DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
 
-DEPENDS += "external-linaro-toolchain-cross-${TARGET_ARCH}"
-
 RDEPENDS_${PN}-utils = ""
 
 PKGV = "${ELT_VER_LIBC}"
-- 
2.7.4


