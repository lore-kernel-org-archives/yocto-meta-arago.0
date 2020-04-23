Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 65C9B52A40
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2020 23:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E838740C18;
	Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2Efhp_wP8KqW; Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D3A5540C35;
	Thu, 23 Apr 2020 23:57:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 98087172A08;
	Thu, 23 Apr 2020 19:57:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Apr 2020 19:57:19 -0400
Message-Id: <1587686239-6605-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587686239-6605-1-git-send-email-denis@denix.org>
References: <1587686239-6605-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 5/5] arago.conf, toolchain-arm: drop custom TCLIBC settings in favor of upstream glibc
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
X-List-Received-Date: Thu, 23 Apr 2020 23:59:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Looks like external-arm-toolchain has broken locale packaging, so disable those
dependencies for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  4 +++
 .../conf/distro/include/toolchain-arm.inc          |  1 -
 .../include/tclibc-external-arm-toolchain.inc      | 38 ----------------------
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index deaa42b..c5d33e3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -72,6 +72,10 @@ INITRAMFS_FSTYPES_k2l-hs-evm = "cpio.gz"
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
+TMPDIR .= "-${ARMPKGARCH}-${TCMODE}"
+
+LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
+
 # Start with default set of distro features
 DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
index c5520ed..d2c2b2f 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -1,6 +1,5 @@
 # Select external binary prebuilt Arm toolchain
 TCMODE = "external-arm"
-TCLIBC = "external-arm-toolchain"
 
 EAT_TARGET_SYS_ARMV5 ?= "arm-none-linux-gnueabi"
 EAT_TARGET_SYS_ARMV7 ?= "arm-none-linux-gnueabihf"
diff --git a/meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc b/meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc
deleted file mode 100644
index 934b71b..0000000
--- a/meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-#
-# external Arm glibc specific configuration
-#
-
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
-
-# Add glibc overrides to the overrides for glibc.
-LIBCOVERRIDE = ":libc-glibc"
-OVERRIDES .= "${LIBCOVERRIDE}"
-
-PREFERRED_PROVIDER_virtual/libc-locale ?= "external-arm-toolchain"
-
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
-
-LIBC_DEPENDENCIES = "libsegfault \
-		     glibc \
-		     glibc-dbg \
-		     glibc-dev \
-		     glibc-utils \
-		     glibc-thread-db \
-		     ${@get_libc_locales_dependencies(d)}"
-
-LIBC_LOCALE_DEPENDENCIES = "\
-	glibc-localedata-i18n \
-	glibc-gconv-ibm850 \
-	glibc-gconv-cp1252 \
-	glibc-gconv-iso8859-1 \
-	glibc-gconv-iso8859-15 \
-	locale-base-en-us \
-	locale-base-en-gb"
-
-def get_libc_locales_dependencies(d):
-    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
-        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
-    else:
-        return ''
-- 
2.7.4


