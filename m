Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB41C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 15:12:42 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.385.1742310757870190125
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 08:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v9oZSItc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IFCbN5042184
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742310757;
	bh=UMjG9Ag7UmJSSahwyvzeOTQiDXvpipc3xtNhhsEwoeE=;
	h=From:To:Subject:Date;
	b=v9oZSItcs6hUCm/ypDraO9aDDPu7ZDntAmxAHbV1lPZm/NFaebAf7pTAI+kFsGKy+
	 do4KdhYwqEYBSDP1WgPbWtYEQ4tijjLIV9pgo3LH3aCRQtlt/InbibCYexw9FEfUhW
	 Sc+FoEfPu0panETeFk4qiOzbrnJ/HO2kmN0JYIhA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IFCbgl034889
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 10:12:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 10:12:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IFCa2W096063
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:36 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH 0/2] Include OpenCL headers within arago toolchain sdk 
Date: Tue, 18 Mar 2025 10:12:34 -0500
Message-ID: <20250318151236.561373-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 15:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16082

From: Antonios Christidis <a-christidis@ti.com>

Setting everything up to include OpenCL headers within the arago
toolchain sdk recipe which later builds
arago-2025.01-aarch64-linux-tisdk.sh .

Regards,
Antonios      

Antonios Christidis (2):
  meta-arago-distro: Create opencl packagegroup for arago toolchain sdk
  meta-arago-distro: add opencl headers to arago toolchain sdk recipe

 .../packagegroup-arago-opencl-sdk-target.bb            | 10 ++++++++++
 .../packagegroup-arago-toolchain-tisdk-target.bb       |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl-sdk-target.bb

-- 
2.34.1


