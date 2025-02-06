Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08048C02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:07:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.50447.1738868829074901351
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 11:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A+Bp0yez;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516J77Yt2858063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 13:07:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738868827;
	bh=tZkW6O3ZW78VPS7AVfpED29I5erzNg+0aJtIWv4PaM8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A+Bp0yezpYbXwG6MUitbZaKMfAfUAatR6c4IFd5KS6TVUDGoLCSEXiK432R2okx1T
	 PGQvJuMqOj77we75Ndw4OqjN8HeAf/cCHXEtsYXnm7MofMrXCfYyep6iVCdkPG5487
	 l0xONzjwCuTi65Y9luChmueNlUx+EO7hZdeEQprk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516J77Iw040178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 13:07:07 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 13:07:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 13:07:01 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516J70u7111637;
	Thu, 6 Feb 2025 13:07:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/5] meta-arago-extras: onnx: Remove FILESEXTRAPATHS
Date: Thu, 6 Feb 2025 13:06:57 -0600
Message-ID: <20250206190700.1190499-2-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15832

This is being set to the default value, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
index fead0e61..84dd17c9 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
@@ -4,8 +4,6 @@ HOMEPAGE = "https://www.onnx.ai/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
 SRC_URI = "git://github.com/onnx/onnx.git;protocol=https;branch=rel-1.16.1"
 SRC_URI += "\
 	file://0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch \
-- 
2.39.2


