Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8AAC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:07:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.50090.1738868828606854184
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 11:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WxurOWlc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516J77eK2784728
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 13:07:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738868827;
	bh=X+yAJRR0OIwBgmgmX3COIF7QlZFmHeM4TWspfcJmbpg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WxurOWlcB7kwA2fpDQVle0h0n0d5FfkwamXO/B/VdgJ4Cl0t7TVhHTkFQgIAsGO/a
	 4mSDkJoTQxILG+wyL60OHIyjP356OIlBGNkWASbI11E+HbFdurGhX1GPegLEE0WpkV
	 M57Fk2+rLJAPhsiQBmuNRlMDjx+hQm/J7BF7+b14=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516J77th040190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 13:07:07 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 13:07:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 13:07:01 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516J70u8111637;
	Thu, 6 Feb 2025 13:07:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 3/5] meta-arago-extras: onnxruntime: Remove FILESEXTRAPATHS
Date: Thu, 6 Feb 2025 13:06:58 -0600
Message-ID: <20250206190700.1190499-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206190700.1190499-1-afd@ti.com>
References: <20250206190700.1190499-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 19:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15831

This is being set to the default value, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-framework/onnxruntime/onnxruntime_1.20.1.bb         | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
index 494bea9a..7e810739 100644
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
@@ -4,8 +4,6 @@ HOMEPAGE = "https://www.onnxruntime.ai/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f7e3b1308cb5c00b372a6e78835732d"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
 SRC_URI = "\
 	git://github.com/microsoft/onnxruntime.git;protocol=https;branch=rel-1.20.1 \
 	git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/cmake/external/date \
-- 
2.39.2


