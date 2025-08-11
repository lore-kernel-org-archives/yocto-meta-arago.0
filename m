Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E757FCA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 17:39:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.54097.1754933990135727825
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 10:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YSl8nROO;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BHdns91660207;
	Mon, 11 Aug 2025 12:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754933989;
	bh=ySY4yI6EFENjwT/iQl8Sx/BHZXnodME9Ka/0aZoAFBQ=;
	h=From:To:Subject:Date;
	b=YSl8nROOoii7Qh+6FjJzgZOJ1ZP1Ey6bmNFU+T9vTx3rkZzp1NhypvjykW82JqmVD
	 VByS2F129U8TpyCzBlELS7zv1PEcOI6D9Dr+ZQwZpljE09mPKEWXkd7/p6EoCjytvy
	 d2uqFJuctJuQ4JK633NUqaEnqihOrRAbH13oBhlA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BHdmhB3882983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 12:39:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 12:39:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 12:39:48 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BHdmqU3261203;
	Mon, 11 Aug 2025 12:39:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ulWUu-0005BZ-DH; Mon, 11 Aug 2025 12:39:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago: Pull in the Yocto space optimization settings
Date: Mon, 11 Aug 2025 12:39:48 -0500
Message-ID: <20250811173948.19890-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Aug 2025 17:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16357

Turns out there is a .inc file in oe-core that sets some variables to
reduce the amount of space that a build takes up based on common
criteria.  Poky explicitly includes this file, but it is not included by
default.  So we need to include it as well.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8e45ca53..1ad4b4ce 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -6,6 +6,8 @@ BUILD_VARIANT = "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
 TISDK_VERSION ?= "live"
 FEEDURIPREFIX ?= "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
 
+require conf/distro/include/yocto-space-optimize.inc
+
 OPKG_ARGS:remove = "--prefer-arch-to-version"
 
 TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
-- 
2.17.1


