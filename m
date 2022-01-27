Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.21597.1643242929031734880
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9D7340CCB
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-ipMzCqbtfy for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 95E1D40CC3
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 69C57174730
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 08/23] packagegroups: tisdk-connectivity: package intel-9260 linux firmware images
Date: Wed, 26 Jan 2022 19:21:49 -0500
Message-Id: <1643242924-25090-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Sinthu Raja <sinthu.raja@ti.com>

Package linux-firmware-iwlwifi-9260 and linux-firmware-ibt-18 containing
firmware for Intel 9260 (WLAN and BT)

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 913795a..707c1ba 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,6 +18,7 @@ WLAN_COMMON = "\
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
+    linux-firmware-iwlwifi-9260 \
 "
 
 WLAN_TI = "\
@@ -42,6 +43,7 @@ BT_COMMON = "\
     pulseaudio-module-bluez5-discover \
     pulseaudio-lib-bluez5-util \
     sbc \
+    linux-firmware-ibt-18 \
 "
 
 BT_TI = "\
-- 
2.7.4

