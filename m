Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E294C021B7
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 20:41:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.33412.1740170514865704512
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 12:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nGWLXQ1S;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LKfsAS1000459
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 14:41:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740170514;
	bh=xpRfi1bVSGHs/nih4/mHXUU6kabIj5iYLK4xjeuRbRs=;
	h=From:To:Subject:Date;
	b=nGWLXQ1SpBNTJHDhTjLq3xWZ+EUhxIShF3bboXrTkeJx+QgjBKIGaXdLw2PQKdbqK
	 znZyP5QzBs8W3LUWJ6FqDqPzON+rYxauBoxP5G5mMGWVA2A0VQ0DebB5joFm9Du6Ni
	 VQQjSSW2kiXsRgbhFTZwJE2G5YhiDWxFkNYb8Vx4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LKfsgA077111
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 14:41:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 14:41:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 14:41:53 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LKfrlW038613;
	Fri, 21 Feb 2025 14:41:53 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v4 0/2] Introducing Opencl-cts 
Date: Fri, 21 Feb 2025 14:41:51 -0600
Message-ID: <20250221204153.428129-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 20:41:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15891

From: Antonios Christidis <a-christidis@ti.com>

Dear all, 

Adding the recipe for opencl-cts, and a patch for it. Also, changing
the version of the opencl-headers, this is done due to compatibility
issues with the header version and cts version.

All of this patch series is meant for scarthgap, which is why I am
not including a patch to add opencl-cts to any package group so that
it can be build and included in our sdk. That patch will be sent out
separately as it is both for scarthgap and master. More info on this
can be found in the upcoming patch.

Regards,
Antonios

Antonios Christidis (2):
  meta-arago-test: add recipe opencl-cts
  meta-arago-test: opencl_headers 2023.12.14 -> 2024.05.08

 .../opencl/opencl-headers_%.bbappend          |  4 +++
 .../opencl/opencl_headers-ti.inc              |  1 +
 .../files/0001-Ignore-Compiler-Warnings.patch | 18 +++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 27 +++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

-- 
2.34.1


