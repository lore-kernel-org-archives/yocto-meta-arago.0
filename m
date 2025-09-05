Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD61CA1017
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 23:38:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2268.1757115531192156639
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 16:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NH9owkGP;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585NcoAb3855630
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757115530;
	bh=2pjQPpZJFmDre0EzfVijWNyUgdNBU0Ff0eSugKtW7KU=;
	h=From:To:Subject:Date;
	b=NH9owkGPtPShdbzWtJFw6rOWuGMx5avphJtGJbSahtMzVONuNVtjx9uM3TeYHWlA1
	 7m6FdhyCFCu/KgZTznLQlOubx7kjKmGFfu+jqvvzhY3MfzGiZJhG9X7e+U508TMkzh
	 pNTDn74yr3y9zk2kwW3bbiuz/f4eHFUXxbL8Km/s=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585Ncofq1982136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 18:38:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 18:38:50 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585Nco9V1174327;
	Fri, 5 Sep 2025 18:38:50 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][master][PATCH v2 0/3] opencl-clhpp v2.0.16 ->  v2024.05.08
Date: Fri, 5 Sep 2025 18:38:46 -0500
Message-ID: <20250905233849.2506703-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 23:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16537

From: Antonios Christidis <a-christidis@ti.com> 

Dear all, 

The C OpenCL Headers are on version 2024.05.08, however the C++ are lagging
behind. With this patch series, I am bumping the C++ OpenCL headers also to
version 2024.05.08. 

The C++ headers, depend on cmake files from the C headers. The current
package was not providing them. I made some changes to correct this. 

This series is a v2 to the following: 
https://patchwork.yoctoproject.org/project/arago/list/?series=34239&state=*

Kind Regards,
Antonios


Antonios Christidis (3): meta-arago-test: recipes-extended: Cmake support
for opencl-headers meta-arago-test: recipes-extended: Specify correct PV
for ocl headers meta-arago-test: recipes-extended: opencl-clhpp v2.0.16 ->
v2024.05.08

 .../opencl/opencl-clhpp_%.bbappend               |  4 ++++
.../recipes-extended/opencl/opencl_clhpp-ti.inc  |  7 +++++++
.../opencl/opencl_headers-ti.inc                 | 16 ++++++++++++++++ 3
files changed, 27 insertions(+) create mode 100644
meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend create mode
100644 meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc

-- 2.34.1


