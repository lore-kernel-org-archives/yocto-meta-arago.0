Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02CBC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 05:07:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.12945.1713244040251548209
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 22:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GcS1nRR5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43G57G7c032305;
	Tue, 16 Apr 2024 00:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713244036;
	bh=hRf4tQlSlOW+xQleDDQT7ZNl4A8ihpBwa5oawXcBVoo=;
	h=From:To:CC:Subject:Date;
	b=GcS1nRR5PAS7v7yiNF+PVW3BdnqP5tS44RZVBnaEdVT6YQvfWkUIRjsA6TQb7InM3
	 NzMVN2jdi+AvQf9y0hKQPWSv2RU1vf9VFI691dQ4Wm8Y50AFwA9z2gjzXTpmNJA8XI
	 losuBy/327VnKgLsc37bHxsAM6yDDCJgbStPysHA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43G57FmT039670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 00:07:15 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 00:07:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 00:07:15 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43G57EM2001359;
	Tue, 16 Apr 2024 00:07:15 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-devtools: Drop bbappends for opkg-utils and swig
Date: Tue, 16 Apr 2024 10:37:12 +0530
Message-ID: <20240416050712.167608-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 05:07:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15285

- This workaround to exclude rm_work on these packages was
added to address issues that were observed when combined with
the sourceipk feature of arago [1].

- As the sourceipk class is dropped from arago [2], we no longer need
this workaround. If required this workaround should be carried in
Processor SDK layer (i.e. meta-tisdk) which currently has the sourceipk class [3].

[1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=0070bdfdf1a91b62eabf8a4d8e2e441bfc1d014b

[2]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=22868449008e2872a75dede8027947c36a6afc80

[3]: https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/commit/?h=scarthgap&id=aa297415d65b9bb9d1171a3dd18a2b2b2341fd79

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-devtools/opkg-utils/opkg-utils_%.bbappend          | 3 ---
 meta-arago-distro/recipes-devtools/swig/swig_%.bbappend        | 3 ---
 2 files changed, 6 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-devtools/swig/swig_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
deleted file mode 100644
index 29d90a9d..00000000
--- a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-
-RM_WORK_EXCLUDE += "${PN}"
-
diff --git a/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend b/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
deleted file mode 100644
index 29d90a9d..00000000
--- a/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-
-RM_WORK_EXCLUDE += "${PN}"
-
-- 
2.34.1


