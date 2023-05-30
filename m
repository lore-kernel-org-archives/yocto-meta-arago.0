Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6647CC7EE24
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:48:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1347.1685483286028637453
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 May 2023 14:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FNJ2+qG3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ULm3J7029818;
	Tue, 30 May 2023 16:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685483283;
	bh=T7kKaTAHLb02z6j7Mjln/Fev7lBl4gL5td+NWWD5Dv0=;
	h=From:To:CC:Subject:Date;
	b=FNJ2+qG3zknIGnvpKZ+qxsXaK+VqZXH0GZSfjZR44FXVEIuwPxqyp7/x8pwcs9z+5
	 VhwktikXnMcIzJyH/rgpbZGwr/kmjQQMwek4Lsn9axjcSgYFI/Jfn0jnQYH815+Ce/
	 QvztLJCBFzOMJPCOr914GlRi/eLkG+KMqfqrz+Fs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ULm3Po125335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 16:48:03 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 16:48:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 16:48:02 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ULm2rJ026159;
	Tue, 30 May 2023 16:48:02 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 0/2] Add piglit and opencl support
Date: Tue, 30 May 2023 16:47:55 -0500
Message-ID: <20230530214757.3693099-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 May 2023 21:48:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14479

From: Randolph Sapp <rs@ti.com>

Add the piglit test utility and some conformance tests it wraps to the
ti-test package group.

Also enable opencl now that rogue umlibs properly provide that feature.

Randolph Sapp (2):
  arago.conf: add opencl as a distro feature
  ti-test: add piglit to ARAGO_TEST

 meta-arago-distro/conf/distro/arago.conf                | 5 ++++-
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.40.1


