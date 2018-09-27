Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EC43252A14
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 15:36:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFaD4G026964
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538062573;
	bh=KTau9QPShDbQex0n85izdY3DORjkegc++lna9Yy7//E=;
	h=From:To:Subject:Date;
	b=dSvUBnOimYw89ABf4o0TyFYjMla7ivlqbEyJvz84EL8nUbzaf1HLpKd09kTheiZMG
	d3oU02FfqGD4hfbPbhdNmmsoJyCyS0F1vJcV6oKgXeecHpeKBa9rDlimk5SUZ6WEHf
	OeEe9b53vDoe5O+6yKSK6l195eOc/yGJAk1NhxNg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFaDXw006871
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:36:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:36:12 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFaCvn031719
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 11:36:08 -0400
Message-ID: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 0/2] Patches for Procsdk 5.1 release
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2018 15:36:23 -0000
Content-Type: text/plain

The below patchset are the RTOS patches needed for Processor SDK 5.1 release

Mahesh Radhakrishnan (2):
  posix-smp-demo: Update to versin 01.01.00.02B
  big-data-ipc-demo: Update to version 01.02.00.00

 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
 meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.1


