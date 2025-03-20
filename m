Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8FBC36009
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1850.1742494249494106068
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T2pl0yT+;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmv9684426
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=SA2rtfFR/q7lpuOp/cY6qa7X+RLpz3VPCKQl3KqvzaE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=T2pl0yT+YLzSwMVtHpypgUYz2MStCUcIkNEbjjn9QED0G2toK/4EBs0Y3cBcyGmPU
	 CZ7g18mpQYCZ5c86MdTETV6tk2cSfl04dYVRmxfwBvYFT+FLDdwr377aLPK8/Ku/g3
	 g5sxiK7FIuhD/BrMUuqEUUu4cpyDUM55irlaFUns=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmrG038124;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:48 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmve126201;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLw-0008Ow-6S; Thu, 20 Mar 2025 13:10:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 08/26] systemd: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:29 -0500
Message-ID: <20250320181047.18035-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16106

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{systemd_%.bbappend => systemd-arago.inc} |  2 +-
 .../recipes-core/systemd/systemd_%.bbappend   | 59 +------------------
 2 files changed, 4 insertions(+), 57 deletions(-)
 copy meta-arago-distro/recipes-core/systemd/{systemd_%.bbappend => systemd-arago.inc} (97%)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
similarity index 97%
copy from meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
copy to meta-arago-distro/recipes-core/systemd/systemd-arago.inc
index bb57d094..afcf6928 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
@@ -1,6 +1,6 @@
 PR:append = ".arago7"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"
 
 SRC_URI:append = " \
     file://local.rules \
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index bb57d094..c37a64ad 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,57 +1,4 @@
-PR:append = ".arago7"
+SYSTEMD_ARAGO = ""
+SYSTEMD_ARAGO:arago = "systemd-arago.inc"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI:append = " \
-    file://local.rules \
-    file://usb1-rules.sh \
-    file://usb2-rules.sh \
-    file://10-eth.network \
-    file://15-eth.network \
-    file://30-wlan.network \
-    file://60-usb.network \
-    file://timesyncd.conf \
-    file://37-can-j7.rules \
-    file://37-can-am62.rules \
-    file://37-can-dra7.rules \
-    file://37-can-ti33x.rules \
-"
-
-do_install:append() {
-    install -d ${D}${sysconfdir}/udev/rules.d/
-    install -m 0644 ${UNPACKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
-
-    install -d ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/
-
-    install -d ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${UNPACKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${UNPACKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${UNPACKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${UNPACKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
-
-    # Allow automount from udev
-    install -m 0644 ${D}${systemd_system_unitdir}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/
-    sed -i 's/MountFlags=slave/MountFlags=shared/g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
-
-    # Need NAMESPACES enabled in the kernel, workaround for now
-    install -m 0644 ${D}${systemd_system_unitdir}/systemd-hostnamed.service ${D}${sysconfdir}/systemd/system/
-    sed -i 's/PrivateNetwork=yes/PrivateNetwork=no/g' ${D}${sysconfdir}/systemd/system/systemd-hostnamed.service
-
-    install -d ${D}${sysconfdir}/systemd/
-    install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
-
-    install -d ${D}${libdir}/udev/rules.d
-    install -m 0644 ${UNPACKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${UNPACKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${UNPACKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${UNPACKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
-}
-
-FILES:udev += " \
-    ${libdir}/udev/rules.d/37-can-j7.rules \
-    ${libdir}/udev/rules.d/37-can-am62.rules \
-    ${libdir}/udev/rules.d/37-can-dra7.rules \
-    ${libdir}/udev/rules.d/37-can-ti33x.rules \
-"
+require ${SYSTEMD_ARAGO}
-- 
2.17.1


