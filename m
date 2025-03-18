Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594FBC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 15:12:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.363.1742310757920618826
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 08:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wjfugW9g;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IFCbse2623773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742310757;
	bh=aN+i2j/hEvq+daiwEkfi12oLuO0IuX50Kx0shZTKHmY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wjfugW9gq986H4CTtMSyzo3Sx3Pyp3yjhNTUEHqn5QiK620UhWXBL+A0rLPj6uPwG
	 Bpl0F96lzW2k99JUA7ztq13p+h77zqyhSHqelF2Nr/uIPCdiR46cwie96IFtTVtmz5
	 9pDM0xePwpv122pphiZss05kpPgImB/GZPWHuvh0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IFCbHb024668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:37 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 10:12:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Tue, 18 Mar
 2025 10:12:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 10:12:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IFCa2Y096063
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:36 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH 2/2] meta-arago-distro: add opencl headers to arago toolchain sdk recipe
Date: Tue, 18 Mar 2025 10:12:36 -0500
Message-ID: <20250318151236.561373-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318151236.561373-1-a-christidis@ti.com>
References: <20250318151236.561373-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 15:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16083

From: Antonios Christidis <a-christidis@ti.com>

Add the newly created packagegroup-arago-opencl-sdk-target within the
arago toolchain sdk target recipe.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index fc0a0241..5b1b4964 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -22,5 +22,6 @@ RDEPENDS:${PN} = "\
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl-sdk-target','',d)} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
-- 
2.34.1


