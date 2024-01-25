Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B35CC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 07:57:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12123.1706169436460005567
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 23:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rOFPn/iJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40P7vFjX040773
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 01:57:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706169435;
	bh=QMWp1wu1LezdScxvT/7HkhDP+82/cwLyYXWWPRhPRlM=;
	h=From:To:CC:Subject:Date;
	b=rOFPn/iJCxTGUpO1iQh1xQ5pLUhTGge02dQ1Wtg9tnZwRyofGzor1YXrfth0DmYvR
	 oo4puIcBF1Gx9aERKUBlTil/pgOBraGrDlMaFYUgB5XstTZl+Bg9ax9t6srOpURjoe
	 V88oUNElzGWi6uhH4hawidva0dOXW51q1ZPRX26Y=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40P7vFLl044769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 01:57:15 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 01:57:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 01:57:15 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40P7vEhs009445;
	Thu, 25 Jan 2024 01:57:15 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v3 0/2] Increase min buffers or CSI capture
Date: Thu, 25 Jan 2024 13:27:08 +0530
Message-ID: <20240125075710.843604-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 07:57:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15093

While at it, add same set of gstreamer patches across the Machines
to make it easier to maintain

v2:
    * Give more details in the patch
    * Fix the patch indexing in the bb file
    * Mark the patch as HACK

v3:
    * Add Upstream-Status to the patch

Rahul T R (2):
  gstreamer1.0-plugins-good: Maintain same set of patches for all
    machines
  gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI
    capture

 ...2-Changes-for-DMA-Buf-import-j721s2.patch} |  0
 ...nce-to-contiguous-format-if-support.patch} |  0
 ...ct-Increase-min-buffers-for-CSI-capt.patch | 34 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend | 24 +++----------
 4 files changed, 38 insertions(+), 20 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/{0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch => 0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/{0002-v4l2-Give-preference-to-contiguous-format-if-support.patch => 0004-v4l2-Give-preference-to-contiguous-format-if-support.patch} (100%)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch

-- 
2.34.1


