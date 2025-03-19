Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F966C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:12:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.6723.1742418723644285906
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HVHOjZvQ;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLC1c83027730
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 16:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742418721;
	bh=RPNvVUyCv9kTfJBavJY4CP1ifq6qByG39LjggVw+bPU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HVHOjZvQ3TI7VjuFj0YY2S4zgjNN0+Av5LPIG5eaXZbD2Sbx3UHzL7n3Z9iZMAaue
	 IAhsqvfRl/vd3VHa1WpZiCEoX4YieAn9hYCqrMOGMsopSzQez9URmJY7YHdio4TPpw
	 1xkkMRPwoiWcCWICc870jH8wmX9wQlU5ncckc7AY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLC07Y084496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 16:12:00 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:12:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:12:00 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLC0AW010253;
	Wed, 19 Mar 2025 16:12:00 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 2/2] emptty: address feedback around append usage
Date: Wed, 19 Mar 2025 16:11:49 -0500
Message-ID: <20250319211149.730403-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319211149.730403-1-rs@ti.com>
References: <20250319211149.730403-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:12:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16095

From: Randolph Sapp <rs@ti.com>

Shy away from using append when not strictly necessary. Move the pam
specific runtime dependency under the relevant PACKAGECONFIG.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/emptty/emptty_0.13.0.bb   | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
index 176c9537..ce84898c 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
@@ -16,23 +16,25 @@ SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
 
 SRCREV_FORMAT .= "_pam"
 
-PACKAGES:append = " ${PN}-conf"
+PACKAGES += "${PN}-conf"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
-PACKAGECONFIG[pam] = ",,libpam"
+PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
 PACKAGECONFIG[x11] = ",,virtual/libx11"
 
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'libxcrypt', d)}"
+
 GO_TAGS = ""
 GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
 GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
 
-GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
+GOBUILDFLAGS += "-tags=${GO_TAGS}"
 
 export GO111MODULE="off"
 
 inherit go update-rc.d systemd
 
-DEPENDS:append = " gzip"
+DEPENDS += "gzip-native"
 
 do_install () {
     # general collateral
@@ -64,11 +66,11 @@ FILES:${PN} = "\
     ${sysconfdir}/pam.d/emptty \
 "
 
-FILES:${PN}-conf:append = " ${sysconfdir}/emptty/conf"
-CONFFILES:${PN}-conf:append = " ${sysconfdir}/emptty/conf"
-RPROVIDES:${PN}-conf:append = " virtual-emptty-conf"
+FILES:${PN}-conf += "${sysconfdir}/emptty/conf"
+CONFFILES:${PN}-conf += "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN}-conf += "virtual-emptty-conf"
 
-RDEPENDS:${PN}:append = " virtual-emptty-conf pam-plugin-succeed-if"
+RDEPENDS:${PN} += "virtual-emptty-conf"
 
 SYSTEMD_SERVICE:${PN} = "emptty.service"
 
-- 
2.48.1


