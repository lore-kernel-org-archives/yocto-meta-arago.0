Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE16C3601B
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:54 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1853.1742494249634553841
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c4J8L7QL;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmtr684430
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494248;
	bh=AzC7kekP7HTw7HtxfEYiX+xMP4EYnevt/eQ+dfGXWmg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=c4J8L7QLQjL/wPtu20r0ecnmuKKNDuwAY9ueSLLH8QOiDY6oUztt7ZArDjx8DVEH+
	 P1dq8/9oj1FCbmJP8Wo0KyeTziK1SiCtTZESmRr/QPDoCKbELzpp7bT5tuIJogAsDh
	 RtZgY40xSSd1e/ZP3JlnndFWwkhnCoWy6RVksySY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAmGM049394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:48 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAmOb126207;
	Thu, 20 Mar 2025 13:10:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLw-00009I-AC; Thu, 20 Mar 2025 13:10:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 09/26] sysvinit: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:30 -0500
Message-ID: <20250320181047.18035-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16110

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{sysvinit_%.bbappend => sysvinit-arago.inc}      |  0
 .../recipes-core/sysvinit/sysvinit_%.bbappend        | 12 +++---------
 2 files changed, 3 insertions(+), 9 deletions(-)
 copy meta-arago-distro/recipes-core/sysvinit/{sysvinit_%.bbappend => sysvinit-arago.inc} (100%)

diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend b/meta-arago-distro/recipes-core/sysvinit/sysvinit-arago.inc
similarity index 100%
copy from meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
copy to meta-arago-distro/recipes-core/sysvinit/sysvinit-arago.inc
diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend b/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
index 6f65b42d..1db52f4a 100644
--- a/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
+++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
@@ -1,10 +1,4 @@
-PR:append = ".arago1"
+SYSVINIT_ARAGO = ""
+SYSVINIT_ARAGO:arago = "sysvinit-arago.inc"
 
-PACKAGES =+ "${PN}-initramfs"
-
-do_install:append() {
-	[ ! -e ${D}/init ] && ln -s ${base_sbindir}/init ${D}/init
-}
-
-FILES:${PN}-initramfs = "/init"
-RDEPENDS:${PN}-initramfs = "${PN}"
+require ${SYSVINIT_ARAGO}
-- 
2.17.1


