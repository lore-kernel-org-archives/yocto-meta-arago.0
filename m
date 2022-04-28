Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5D9C4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 17:18:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.408.1651166334854497075
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 10:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lijSvEZy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SHIspj112666;
	Thu, 28 Apr 2022 12:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651166334;
	bh=2DFtQQtmiBmYqPQw1i4vsGg+Y+erQtZWxeWYRC0UDt8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lijSvEZy5lt9f/Uh9PtUIU0EUieCuaFkruomfHxdm6p+uyUvNl6fZ/xb8FxajJMAW
	 YhMNCf/OaQzQtjLQsveZm9bcDFsJ0hc+3wPDqGk2Rk7o3nuuIgco+x3MzeHGvl2gdi
	 d2pfXHECR8vVgAilwWVmwiAXT4ipZEya3awKkk7U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SHIsYr110188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 12:18:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 12:18:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 12:18:53 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SHIp7C090758;
	Thu, 28 Apr 2022 12:18:53 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH v2 5/5] Build Poky using meta-yocto
 instead of combined poky repo
Date: Thu, 28 Apr 2022 12:18:51 -0500
Message-ID: <20220428171851.19270-5-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428171851.19270-1-afd@ti.com>
References: <20220428171851.19270-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 17:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13828

The Poky repo contains meta-yocto plus extra bits needed for an
all-in-one build, but since we already pull in tools with this
script like bitbake and oe-core, lets use those and save some
space/bandwidth.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 configs/poky-master-config.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index b395ff8..a541501 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -1,8 +1,10 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
-poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
+meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
-- 
2.17.1


