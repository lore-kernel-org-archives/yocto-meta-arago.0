Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236E8C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:00:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6768.1702296027129537396
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 04:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FO75Fj46;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BBC0P23096112;
	Mon, 11 Dec 2023 06:00:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702296025;
	bh=g0E/ood8nfox3b11vLM1SnC5LitNEP011GNqd4SYIHQ=;
	h=From:To:CC:Subject:Date;
	b=FO75Fj46ZSpr4AV1OJWtqdfi6BEMVKlzTrY3lZ2Qo1Rx+nKtS5qgWA6D67QIQ5dTQ
	 vZZ+kA/TidfmuhhxPuLoPr7GYtCVtUr0Ib0wkDUUfCDoqUPvPFfUYT7M/iYNgx5MVX
	 vFRE12cF1w86DDtilYwUOhpKtRInXno2TXAnCBgs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BBC0PJX130409
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 06:00:25 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 06:00:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 06:00:25 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BBC0Oqh085424;
	Mon, 11 Dec 2023 06:00:24 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <k-bhargav@ti.com>, <devarsht@ti.com>, <a-limaye@ti.com>,
        <shyam.jagannathan@ti.com>, <r-ravikumar@ti.com>, <vijayp@ti.com>,
        <detheridge@ti.com>
Subject: [meta-arago] [kirkstone] [PATCH v2] receipes-multimedia: gstreamer: Add patches for AM62P
Date: Mon, 11 Dec 2023 17:30:23 +0530
Message-ID: <20231211120023.2700068-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Dec 2023 12:00:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15053

Add patches to prefer contiguous video format and supporting
dmabuf-import mode for video decoder.

This is to support use-cases involving video codec with other components
viz. GPU, Camera e.t.c.

For 0002-v4l2-Give-preference-to-contiguous-format-if-support.patch :
There are certain blocks such as camera, GPU which only seem
to support well the contigous formats (sometimes at the S/W level)
which doesn't go well with gstreamer v4l2 which prefers non-contigous
by default and we fail at negotiation.
The crux of the issue is that unlike v4l2 gstreamer has only single GST
video format for both NV12 and NV12M (non-contigous) and it prefers to
advertise latter during caps negotiation.
There was a proposal made long back to have separate GST video
formats for NV12 and NV12M but that didn't converge, perhaps they
wanted to support this with a VideoMeta based scheme as per
logs [0].

For 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch :
This is a local patch which complements a patch already made
available in driver to support dmabuf import for the decoder.
Here the gist of the issue is that v4l2 framework expects userspace
to make sure it uses same v4l2 buffer index each time with same backing
memory as kernel framework relies on these indices to identify frame
ordering [2].

There again is discussion around this to support this in upstream but
the upstream patch is not yet merged [1].

[0]:
https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/414
[1]:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/4550/diffs?commit_id=b12eaf65f489bab50917e22242758e000d69df58
[2]:
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
index a36c9760..e14a3c93 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -20,4 +20,8 @@ SRC_URI:append:am62axx = " \
     file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
 "
 
+SRC_URI:append:am62pxx = " \
+    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+"
 PR:append = ".arago0"
-- 
2.34.1


