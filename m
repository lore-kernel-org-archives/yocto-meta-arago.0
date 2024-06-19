Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16583C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 10:09:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.17448.1718791751410325231
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 03:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pQ1WxvjJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JA980q080759;
	Wed, 19 Jun 2024 05:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718791748;
	bh=qy2R8iOMrkN/jam6iW8NPHsUUXhQ4jQpcLEAVTai6uA=;
	h=From:To:CC:Subject:Date;
	b=pQ1WxvjJkogpuZDn7I2gM8+MbFV/6TjKUlEkymCn+eZxE4eYqhCCH1zQIEngfQcaE
	 lqiKtAg81quEmkhofSQBQzEduP4VfgzG6I89dNQMqTkprigZuF6HiLSflefdSnesE0
	 32OSNvbJT1iN0Fc0MfxRDySrb8NYKoO/3BaNmH+Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JA98CY059721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jun 2024 05:09:08 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 05:09:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 05:09:08 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JA97i2117610;
	Wed, 19 Jun 2024 05:09:08 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v3] conf: arago.conf: Add xkbcommon to PACKAGECONFIG_DISTRO of qtbase
Date: Wed, 19 Jun 2024 15:38:54 +0530
Message-ID: <20240619100854.2081721-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Jun 2024 10:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15403

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

- For QT apps to use physical keyboard, xkbcommon has to be added in
PACKAGECONFIG_DISTRO of qtbase. This was supported until 09.01 using
xkbcommon-evdev which at present is an invalid PACKAGECONFIG & hence
was dropped from meta-arago [1]

- So, add xkbcommon to PACKAGECONFIG_DISTRO of qtbase which will
enable the use of physical keyboard in QT apps

[1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=de16946741249265a38acb7bb503b39a0c2b4175

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v3: Add xkbcommon to PACKAGECONFIG_DISTRO for qtbase in arago.conf as suggested by Denys
v2: Add xkbcommon in PACKAGECONFIG to all platforms instead of making it k3 machine specific

 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b82fa76b..deaa8c02 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -67,7 +67,7 @@ PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-gene
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL:pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_DISTRO:pn-qtbase = "icu examples accessibility gif gbm kms libinput"
+PACKAGECONFIG_DISTRO:pn-qtbase = "icu examples accessibility gif gbm kms libinput xkbcommon"
 PACKAGECONFIG_FONTS:pn-qtbase = "fontconfig"
 PACKAGECONFIG:remove:pn-qtwayland = "xcomposite-egl xcomposite-glx"
 
-- 
2.34.1


