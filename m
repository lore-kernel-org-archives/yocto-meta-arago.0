Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 9FCA752AC7
	for <meta-arago@arago-project.org>;
	Mon, 17 Aug 2015 22:53:07 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NT900MH40VC5C20@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 17 Aug 2015 17:52:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=c8FMfO_1YTAMVtt8gSgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C39D161B7A;	Mon,
	17 Aug 2015 18:52:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Aug 2015 18:52:22 -0400
Message-id: <1439851943-29587-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1439851943-29587-1-git-send-email-denis@denix.org>
References: <1439851943-29587-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 2/3] tclibc-external-linaro-toolchain: update defaults
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
X-List-Received-Date: Mon, 17 Aug 2015 22:53:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../distro/include/tclibc-external-linaro-toolchain.inc     | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc b/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
index 737523b..7c149f8 100644
--- a/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
+++ b/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
@@ -1,21 +1,18 @@
 #
-# external Linaro eglibc specific configuration
+# external Linaro glibc specific configuration
 #
 
 LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
 
-# Add glibc overrides to the overrides for eglibc.
+# Add glibc overrides to the overrides for glibc.
 LIBCOVERRIDE = ":libc-glibc"
 OVERRIDES .= "${LIBCOVERRIDE}"
 
-PREFERRED_PROVIDER_virtual/libiconv ?= "external-linaro-toolchain"
-PREFERRED_PROVIDER_virtual/libintl ?= "external-linaro-toolchain"
-PREFERRED_PROVIDER_virtual/libc ?= "external-linaro-toolchain"
 PREFERRED_PROVIDER_virtual/libc-locale ?= "external-linaro-toolchain"
 
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
 
 LIBC_DEPENDENCIES = "libsegfault \
 		     glibc \
-- 
2.2.0


