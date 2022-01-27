Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.21701.1643242928239059626
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D3A240CCA
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jx08VjtEi9X for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8895E40CB6
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 67AB217472F
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 07/23] linux-firmware: Package intel 9260 WiFi and BT firmware
Date: Wed, 26 Jan 2022 19:21:48 -0500
Message-Id: <1643242924-25090-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Sinthu Raja <sinthu.raja@ti.com>

The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
repository, so package it to make it available.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../linux-firmware/linux-firmware_%.bbappend               | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 146596a..3472f26 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -1,4 +1,16 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+PACKAGES =+ "${PN}-iwlwifi-9260"
+PACKAGES =+ "${PN}-ibt-18"
+
+LICENSE_${PN}-iwlwifi-9260 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-ibt-18 = "Firmware-ibt_firmware"
+
+FILES_${PN}-iwlwifi-9260 = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
+FILES_${PN}-ibt-18 = "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
+
+RDEPENDS_${PN}-iwlwifi-9260 += "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-ibt-18 += "${PN}-ibt-license"
 
 do_install_append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
-- 
2.7.4

