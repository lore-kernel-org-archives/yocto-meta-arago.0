Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A447DC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 20:54:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.7867.1740084869305897112
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 12:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xtZfGeGI;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KKsSfE675220
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 14:54:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740084868;
	bh=zHvJNTGDNTOqmqJpEl5WEjz7PXz7FgvLtHpaKWU4IVE=;
	h=From:To:CC:Subject:Date;
	b=xtZfGeGIOAg7DNNn241XHtEKFPsam3TPv1yyzjj0OiQGonveLAITjDYVVsKZ8OBVJ
	 dh3WazqMtLNHarUzcdBoDWScHs1ejXvUH9jRqQADhpU3hLAvimjQ3kjIjxhcFM6xTl
	 lw4GROglAGOA/qZZUTjT9gFiROzAmf5mjcMDFaXA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KKsS1T116788
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 14:54:28 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 14:54:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 14:54:28 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KKsSDL096914;
	Thu, 20 Feb 2025 14:54:28 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 0/3 v2] Introducing Opencl-cts
Date: Thu, 20 Feb 2025 14:54:25 -0600
Message-ID: <20250220205428.212747-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 20:54:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15874

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

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

Antonios Christidis (3):
  meta-arago-test: add recipe opencl-cts
  meta-arago-test: ignore compiler warnings patch for opencl-cts
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


