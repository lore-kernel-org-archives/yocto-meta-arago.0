Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283ABC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 19:10:13 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2511.1741288204830301819
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 11:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CnLzRmEo;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526JA3xC3825967
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Mar 2025 13:10:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741288204;
	bh=2eSiRQptc+kF226QQHX0DewVZD1dqdd3zzCUKL6GcCI=;
	h=From:To:CC:Subject:Date;
	b=CnLzRmEoxIBq9ICZVAv12jrufXo1SxmKCgAAk+AINo0Ad5pEYK2VANqV3P1oVlaRW
	 8meVV1xDvrS88feAyXtsE3yZriij6VLtr6Yo5LD/VrzaYAHY1EKycQLDcZg985ezMQ
	 0OIq1NHASDt8XBTcAVGOz95/A1rWupHT3/tUKPHo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526JA3TE012695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Mar 2025 13:10:03 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 13:10:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 13:10:02 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526JA2Uk079327;
	Thu, 6 Mar 2025 13:10:02 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <a-christidis@ti.com>,
        <detheridge@ti.com>, <praneeth@ti.com>, <d-mittal@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] weston-init: do not require any outputs to start
Date: Thu, 6 Mar 2025 13:08:02 -0600
Message-ID: <20250306190801.3185864-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 19:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15956

From: Randolph Sapp <rs@ti.com>

We're in a bit of a bind now. With the addition of display hotplug, the
very real possibility of Weston trying to start before all displays are
correctly enumerated, and the lack of display managers available in
Yocto there is a need for Weston to start without any displays being
present.

This change will allow Weston to start so long as the seat has graphic
capabilities, regardless of whether or not a display is currently connected. As
displays are connected they will be enumerated as usual under the Weston
session.

This will likely come back to bite us. Users will need to remember to
disable Weston for headless applications to save on startup time and
resources. That being said, this is part of the weston-init package.
That alone should make it clear that this is only required behavior in
the event a display manager or greeter service is unable to detect and
wait for resources.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston-init/weston.ini              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
index b9610fa8..1bc7a010 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
@@ -1,6 +1,7 @@
 [core]
 idle-time=0
 require-input=false
+require-outputs=none
 
 [shell]
 locking=false
-- 
2.48.1


