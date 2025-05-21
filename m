Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD02C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:01:52 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1267.1747839707826958842
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 May 2025 08:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gv4c1Hlg;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54LF1i5Z1568043;
	Wed, 21 May 2025 10:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747839704;
	bh=g7Xxx5bQq8UM2hUjuI0AXWhbFu3fwVg6Mk9oI7qJkHk=;
	h=From:To:Subject:Date;
	b=gv4c1HlgCOokqVrQrBDuWUVh1kp3R79FmFKhqFKJIqFme6g65WA9dTeJOriefBkFF
	 TFCpRFjNQzH6jzWsFsW8AdQT5JXRQEYlcrO3UNhV+CWt1UUe42HoLC9BXRrTSXuIG8
	 dEwzTMTCxiKZ82hkWrE+Qq+uFqn2jAs10XioiR9w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54LF1iZS2808268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 10:01:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 10:01:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 10:01:44 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54LF1ifw128048;
	Wed, 21 May 2025 10:01:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uHkwx-00060x-Vv; Wed, 21 May 2025 10:01:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] sbc: Fix for gcc 15 compile error
Date: Wed, 21 May 2025 10:01:43 -0500
Message-ID: <20250521150143.23080-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 May 2025 15:01:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16234

With the move to gcc 15, the code is not generating a compile error.

../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
   error: too many arguments to function 'sbc_analyze_eight_armv6';
      expected 0, have 3

Simple fix is to drop the C standard down to gnu17 to avoid this new
error.

I am going to submit a better patch to oe-core, but we need this in
the interim to get our builds working again.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc  | 1 +
 meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc b/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
new file mode 100644
index 00000000..39725139
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
@@ -0,0 +1 @@
+CFLAGS += "-std=gnu17"
diff --git a/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend b/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
new file mode 100644
index 00000000..295b58a4
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
@@ -0,0 +1,4 @@
+SBC_ARAGO = ""
+SBC_ARAGO:arago = "sbc-arago.inc"
+
+require ${SBC_ARAGO}
-- 
2.17.1


