Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE680C54754
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:07:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.14110.1747404457421664111
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LlJrbpyu;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GE7aCJ313595;
	Fri, 16 May 2025 09:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747404456;
	bh=iGGA8/QUCBiQYMPLOiiDPzNXssKkVA0F44FWYi2oWxg=;
	h=From:To:Subject:Date;
	b=LlJrbpyuT4zuVXdSEi1I2MYRCNoPJgUQ8D4qaddaCtGJ34XNXPvmYClOogJImItW3
	 QosJaaBuL3qnnDP5bDWJzisB8WPc++l2DaBrE3FT2LwpqM5701DHezv0ycvZeNyniK
	 cWokKGxOSk5cGOmVxDhjtSUMwwpN/kQ6960q3qlA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GE7asI3323785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 09:07:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 09:07:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 09:07:36 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GE7aw9040019;
	Fri, 16 May 2025 09:07:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uFvip-00088g-Rj; Fri, 16 May 2025 09:07:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 1/3] bpftool: Fix for building bpftool-native
Date: Fri, 16 May 2025 09:07:33 -0500
Message-ID: <20250516140735.31243-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 May 2025 14:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16203

The bpftool is configured to use the DEBUG_PREFIX_MAP when building,
but this causes a problem when building bpftool-native.  Ubuntu 22.04
has gcc-11 as the default and DEBUG_PREFIX_MAP contains an option that
is only gcc-13 and beyond.

Simple fix is to remove the offending option when building bpftool-native.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc   | 1 +
 meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc
 create mode 100644 meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend

diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc b/meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc
new file mode 100644
index 00000000..0310ebaa
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/bpftool/bpftool-ti.inc
@@ -0,0 +1 @@
+DEBUG_PREFIX_MAP:remove:class-native = "-fcanon-prefix-map"
diff --git a/meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend b/meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend
new file mode 100644
index 00000000..b2dfa9d5
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/bpftool/bpftool.bbappend
@@ -0,0 +1,4 @@
+BPFTOOL_TI = ""
+BPFTOOL_TI:ti-soc = "bpftool-ti.inc"
+
+require ${BPFTOOL_TI}
-- 
2.17.1


