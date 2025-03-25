Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3A3C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 19:43:31 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.5003.1742931810006094448
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 12:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pBOWerlB;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PJhQXn1338674
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 14:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742931806;
	bh=zvTgWhIhEfNPk3sK+TkdAsK+mKFiBmkfdgMymbtgwE8=;
	h=From:To:CC:Subject:Date;
	b=pBOWerlBn6/eFlyvxHATWhFwprIwG9bF9hZLX+15ltrfFGjbGqAvjp15dgta2IQ/O
	 nenqLvi0z7iBqJTOsx3FVPeFPSEQiYCPQKOuG2uJzxR5tQg8JRINJ3c+LZzA6GOCGV
	 EwR8O2yQYqLd+0uh35uCr/0q3X410qnS+1eYoAC0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52PJhQPt125842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Mar 2025 14:43:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 14:43:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 14:43:25 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PJhP5b047645;
	Tue, 25 Mar 2025 14:43:25 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] weston-init-arago: always retry login
Date: Tue, 25 Mar 2025 14:41:40 -0500
Message-ID: <20250325194138.3291552-3-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Mar 2025 19:43:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16156

From: Randolph Sapp <rs@ti.com>

Setting this value to -1 disables the login retry counter.

Temporary workaround while we fight system time related issues. Since we
can't trust battery backed RTC values and emptty doesn't stay alive
between sessions, it attempts to check login attempt counts using a
cache file a verifies is using the last login time.

Our system time keeps rolling back to the build time until NTP kicks in.
This results in every login attempt between boots occuring within the
last 2 seconds. The emptty application will need to be patched to delete
this file or reset the count to zero on successful logins.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston-init-arago/emptty.conf      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
index 7520bc0b..ffe1a3c2 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
@@ -20,7 +20,7 @@ AUTOLOGIN=true
 AUTOLOGIN_SESSION=Weston
 
 # If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
-AUTOLOGIN_MAX_RETRY=0
+AUTOLOGIN_MAX_RETRY=-1
 
 # Default LANG, if user does not have set own in init script.
 #LANG=en_US.UTF-8
-- 
2.49.0


