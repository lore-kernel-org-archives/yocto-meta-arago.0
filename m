Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id E222052A77
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2015 02:04:59 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXO00MA4J3XKR20@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Nov 2015 20:04:46 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=ZoNzMwvQMmpEiEY8jf8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B65A1161D0B;	Wed,
	11 Nov 2015 21:04:45 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Nov 2015 21:04:45 -0500
Message-id: <1447293885-4222-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1447293885-4222-1-git-send-email-denis@denix.org>
References: <1447293885-4222-1-git-send-email-denis@denix.org>
Subject: [PATCH] arago.conf, arago-prefs: add ARAGO_RT_ENABLE and ARAGO_RT_SUFFIX variables
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
X-List-Received-Date: Thu, 12 Nov 2015 02:05:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Allows easy switching between RT and non-RT kernel builds

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              | 4 ++++
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 5c33666..b33f311 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -53,6 +53,10 @@ PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
+# Set real-time kernel suffix
+ARAGO_RT_ENABLE ?= "0"
+ARAGO_RT_SUFFIX = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
+
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
 TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 1cafa96..874bea5 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -62,8 +62,7 @@ PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
 # Use latest TI staging kernel and u-boot trees
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_RT_SUFFIX}"
 PREFERRED_VERSION_linux-ti-staging = "4.1%"
 
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-- 
2.2.0


