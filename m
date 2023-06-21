Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE861EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 09:18:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6777.1687339088757469220
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 02:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rXbAlnwx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35L9I6AG039171;
	Wed, 21 Jun 2023 04:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687339086;
	bh=okcc0VJBMv07elfQiKgB3UevY8yZhVsqEEGZUuQCnBQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rXbAlnwxCpA2L6SxJn0smK7GM3pMyM0zgtaskzrsstVl2hSGUIwSEQxX3s23KRDI1
	 E6h4akCP7s8miaunC3xo0P/W8dQPBE9SeJri46AwZm6d4RArlib1yDSuSTVKriQO/e
	 k3iozorSvyfqLsgNTIOgxY6DiUUzDt0PI4S/OYtA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35L9I6Pw020956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 04:18:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 04:18:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 04:18:06 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35L9I2AL058227;
	Wed, 21 Jun 2023 04:18:04 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>
Subject: [master/kirkstone 1/3] meta-arago-extras: sysrepo: Update checksum for nw-configurator
Date: Wed, 21 Jun 2023 14:47:59 +0530
Message-ID: <20230621091801.14944-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230621091801.14944-1-r-gunasekaran@ti.com>
References: <20230621091801.14944-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jun 2023 09:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14667

Update the checksum values for nw-configurator

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 .../recipes-sysrepo/nw-configurator/nw-configurator.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index 5a152017..b8a93f1c 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -1,6 +1,6 @@
 LICENSE="GPLv2"
 DESCRIPTION = "Sysrepo based repo to configure EST"
-LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
+LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=f2ec672593c3707bb4fe68307dbf0506"
 
 SRC_URI = "file://nw-configurator.c"
 
-- 
2.17.1


