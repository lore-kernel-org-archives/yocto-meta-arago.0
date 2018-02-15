Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A9FCD52986
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BF8620AA4;
	Thu, 15 Feb 2018 17:05:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LC6GXvC96xy2; Thu, 15 Feb 2018 17:05:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 66C962017C;
	Thu, 15 Feb 2018 17:05:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D5E861632A5;
	Thu, 15 Feb 2018 12:05:53 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:05:53 -0500
Message-Id: <1518714353-21880-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] FIXME: branding-core/processor-sdk: remove sgx flag to disable graphics
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
X-List-Received-Date: Thu, 15 Feb 2018 17:06:13 -0000

Drivers need to be ported to K4.14

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc          | 4 ++++
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 10c5acf..717d355 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -15,5 +15,9 @@ ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 # latest code base, until it is fixed for gstreamer > 1.10
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
 
+# Temporarily disable "sgx" machine feature for all SOCs while building
+# latest code base, until it is fixed for kernel 4.14
+MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
+
 # Temporarily disable UBI images for K2 "server" rootfs due to size
 IMAGE_FSTYPES_remove_pn-tisdk-server-rootfs-image = "ubi ubifs"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index e434f0d..549c52a 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -36,3 +36,7 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
 # Temporarily disable "mmip" machine feature for all SOCs while building
 # latest code base, until it is fixed for gstreamer 1.12
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
+
+# Temporarily disable "sgx" machine feature for all SOCs while building
+# latest code base, until it is fixed for kernel 4.14
+MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-- 
2.7.4


