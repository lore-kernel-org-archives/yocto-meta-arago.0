Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97712C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 14:49:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.16348.1705416547458245464
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 06:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XWyQeiVR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40GEn5Xd034441;
	Tue, 16 Jan 2024 08:49:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705416545;
	bh=lb4nWt/a5ElpXuafAJSne7CzvyHT1bWLvMaNafPQy1I=;
	h=From:To:CC:Subject:Date;
	b=XWyQeiVRzlxu36PMNXqCRDmGDL3c30b555OftLq8ivr5UH52N+IdVdYUUOoUKKhqo
	 H6669hK2ileoKoB5QnRc9wpzR/v8YBBpbVbQ9T+YEEKXPeH4NFnGyrAyJRHVEakNpO
	 d8OeCH21cwOigm1r4WmDRJPgFfQ6xAz6OXGNkZEQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40GEn5Jo097901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jan 2024 08:49:05 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 08:49:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 08:49:05 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40GEn3QX052978;
	Tue, 16 Jan 2024 08:49:04 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][kirkstone][PATCH] strongswan: fix missing strongswap-plugin-mgf1
Date: Tue, 16 Jan 2024 20:19:01 +0530
Message-ID: <20240116144901.1037514-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jan 2024 14:49:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15073

From: Denys Dmytriyenko <denys@konsulko.com>

Fix tisdk-default-image do_rootfs errors after [1]

cherry-pick commit from master branch: 922420df0f445c8f7c830965f88a5fc566eb6ff0

Upstream strongswan recipe in meta-openembedded/meta-networking sets
runtime dependency for MGF1 plugin, but it is not enabled by default
and hence no such package gets produced.

[1]: https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-support/strongswan?h=kirkstone&id=dd23a9930360f540c919ddfd35fd1f6088174ef3

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../recipes-support/strongswan/strongswan_%.bbappend             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index 0af8c9c2..ae313c74 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -8,6 +8,7 @@ PACKAGECONFIG = "charon curl openssl stroke sqlite3 \
 EXTRA_OECONF += " \
         --enable-ctr \
         --enable-pkcs11 \
+        --enable-mgf1 \
 "
 
 SRC_URI += "file://pkcs11_plugin.conf"
-- 
2.34.1


