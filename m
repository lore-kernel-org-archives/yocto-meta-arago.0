Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDFCC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 15:53:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16062.1706025188313867389
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 07:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k3Bt5MXV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NFr7Cw073273
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:53:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706025187;
	bh=xvXYg6XXpa3iIdMiAGlxcawfxrjOBkufoNGdlq0WlR8=;
	h=From:To:CC:Subject:Date;
	b=k3Bt5MXVVO/kjHOgEzTcV86RZGQ9SwOzUUJYNg+WKt/aThUoUJKzC3uHk+wRAH3i7
	 O+0kxcumMYUMSZVGiFVsZD1QkDyUwQn1X1fMJWPuT++wboGFRtPLyy7elOSPndgFmt
	 lTrAiYXHbwsFt2Srd7dwl9Hj3a70im7tFuX2buJM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NFr7VF090842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:53:07 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 09:53:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 09:53:07 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NFr6J4061964;
	Tue, 23 Jan 2024 09:53:07 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 0/2] Increase min buffers or CSI capture
Date: Tue, 23 Jan 2024 21:23:02 +0530
Message-ID: <20240123155304.832636-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 15:53:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15086

While at it, add same set of gstreamer patches across the Machines
to make it easier to maintain

v2:
    * Give more details in the patch
    * Fix the patch indexing in the bb file
    * Mark the patch as HACK

Rahul T R (2):
  gstreamer1.0-plugins-good: Maintain same set of patches for all
    machines
  gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI
    capture

 ...2-Changes-for-DMA-Buf-import-j721s2.patch} |  0
 ...nce-to-contiguous-format-if-support.patch} |  0
 ...ct-Increase-min-buffers-for-CSI-capt.patch | 32 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend | 24 +++-----------
 4 files changed, 36 insertions(+), 20 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/{0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch => 0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/{0002-v4l2-Give-preference-to-contiguous-format-if-support.patch => 0004-v4l2-Give-preference-to-contiguous-format-if-support.patch} (100%)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch

-- 
2.34.1


