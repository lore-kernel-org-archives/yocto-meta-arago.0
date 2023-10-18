Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADE2CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 00:12:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.270997.1697587940679216479
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 17:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iEeXYzI+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39I0CImb071994;
	Tue, 17 Oct 2023 19:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697587938;
	bh=ZaUkZtYIEceK+xtiO0gzYxxuHB+9HSKKTSH9uYCkyS8=;
	h=From:To:Subject:Date;
	b=iEeXYzI+8DZKH+AmEwSf7QTL+egHs1EPgvaRYaXRj8ifbDnr9AuLIEjXDuhKyFfIg
	 Vi31t0R2dJ4mbk6CqRe/knxSPINlA3N8JGtk3r2k/U0fJEbD7l9i7H/CCVibEhUO92
	 /XZxTshGeKMGVAazL83AwjxhHlE+5+6riMa5PuIs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39I0CI3R085589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Oct 2023 19:12:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 19:12:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 19:12:18 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39I0CIDB091373;
	Tue, 17 Oct 2023 19:12:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qsuAc-0008F9-8Q; Tue, 17 Oct 2023 19:12:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] meta-arago-distro: layer.conf: Add meta-arago-test dependency
Date: Tue, 17 Oct 2023 19:12:18 -0500
Message-ID: <20231018001218.31204-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 00:12:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14945

Add missing LAYERDEPENDS for meta-arago-test in meta-arago-distro.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index b4538c68..74833343 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -19,6 +19,7 @@ LAYERDEPENDS_meta-arago-distro = " \
     meta-python \
     qt5-layer \
     meta-arago-extras \
+    meta-arago-test \
 "
 # clang-layer
 
-- 
2.17.1


