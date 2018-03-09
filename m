Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D278E529F9
	for <meta-arago@arago-project.org>;
	Fri,  9 Mar 2018 21:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0F3FF20B23;
	Fri,  9 Mar 2018 21:07:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gAYE4FHLEO7O; Fri,  9 Mar 2018 21:07:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF2E320059;
	Fri,  9 Mar 2018 21:07:10 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7C58A163325;
	Fri,  9 Mar 2018 16:07:10 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  9 Mar 2018 16:07:10 -0500
Message-Id: <1520629630-15316-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] branding-{core, processor-sdk}: re-enable sgx and gc320 graphics support
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
X-List-Received-Date: Fri, 09 Mar 2018 21:07:58 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc          | 4 ----
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 717d355..10c5acf 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -15,9 +15,5 @@ ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 # latest code base, until it is fixed for gstreamer > 1.10
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
 
-# Temporarily disable "sgx" machine feature for all SOCs while building
-# latest code base, until it is fixed for kernel 4.14
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-
 # Temporarily disable UBI images for K2 "server" rootfs due to size
 IMAGE_FSTYPES_remove_pn-tisdk-server-rootfs-image = "ubi ubifs"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 549c52a..e434f0d 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -36,7 +36,3 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
 # Temporarily disable "mmip" machine feature for all SOCs while building
 # latest code base, until it is fixed for gstreamer 1.12
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
-
-# Temporarily disable "sgx" machine feature for all SOCs while building
-# latest code base, until it is fixed for kernel 4.14
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-- 
2.7.4


