Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569CEC4321E
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:53:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.10864.1665510806616239490
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UVfstG5v;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrLSn015924;
	Tue, 11 Oct 2022 12:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665510801;
	bh=YG97BUNKmvAE7+tR/TunBqkE2+MhUHhxKOKEC0SE0YI=;
	h=From:To:CC:Subject:Date;
	b=UVfstG5vkMghYIDzhFKKjovUi+KFloQ+Zo8BHSeoK2L2l2KdzLpF03IlXrI5cqnJO
	 tyxqs7rjfa++8K1aBLIOaphMuZJqT+9sp4hlQvmYiANQ2DC4CvZptA/nIbyFs08KWB
	 ZmpPoIgowMCirA8UbUzMaRmbPXPW6m/KMoUYMmEI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHrLT9030167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:53:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:53:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:53:20 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrKFD089061;
	Tue, 11 Oct 2022 12:53:20 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 0/6] Deprecated recipe
 removals
Date: Tue, 11 Oct 2022 12:53:14 -0500
Message-ID: <20221011175320.26843-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 17:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14073

Hello all,

Same series as last time, just removed that last patch
(meta-arago: Use new J7 SoC names over specific board names)
as it will be expanded into a new series.

Thanks,
Andrew

Andrew Davis (6):
  ti-crypto-examples: Remove ti-crypto-examples
  big-data-ipc-demo: Merge include file and rename
  cmem: Remove Makefile_cmem-mod and cmem refrences
  meta-arago: Remove remaining bits of ti-ocf-crypto-module
  ti-pru-sw: Remove old TI-PRU-SW examples and helpers
  ti-tisdk: Remove uio-module-drv kernel module

 .../conf/distro/include/arago-source-ipk.inc  | 19 ++---------
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 19 +----------
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  5 ---
 .../packagegroup-arago-tisdk-addons.bb        | 24 +-------------
 .../packagegroup-arago-tisdk-crypto.bb        |  1 -
 .../recipes-core/packagegroups/ti-test.bb     |  2 --
 .../ti-tisdk-makefile/Makefile_cmem-mod       | 33 -------------------
 .../Makefile_ti-crypto-examples               | 24 --------------
 .../Makefile_ti-ocf-crypto-module             | 18 ----------
 .../ti-tisdk-makefile/Makefile_uio-module-drv | 28 ----------------
 .../ti-tisdk-makefile_1.0.bb                  | 11 -------
 .../big-data-ipc-demo/big-data-ipc-demo.inc   | 30 -----------------
 ...-linux_git.bb => big-data-ipc-demo_git.bb} | 30 +++++++++++------
 .../ti-crypto-examples_git.bb                 | 30 -----------------
 .../ti-pru-sw-app-loader_1.00.00.bb           | 26 ---------------
 .../ti-pru-sw-edma-library_1.00.00.bb         | 30 -----------------
 .../ti-pru-sw-examples_1.00.00.bb             | 31 -----------------
 17 files changed, 24 insertions(+), 337 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
 delete mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
 rename meta-arago-extras/recipes-apps/big-data-ipc-demo/{big-data-ipc-demo-linux_git.bb => big-data-ipc-demo_git.bb} (54%)
 delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb

-- 
2.37.3


