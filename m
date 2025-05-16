Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E9CC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 18:49:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.20736.1747421383531760311
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 May 2025 11:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fkDfIZXz;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GInfY73803067;
	Fri, 16 May 2025 13:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747421381;
	bh=iGGA8/QUCBiQYMPLOiiDPzNXssKkVA0F44FWYi2oWxg=;
	h=From:To:Subject:Date;
	b=fkDfIZXzjGDKRcC6m8Lxh3yXFzHPHUpdjav2EXPqtRd5at5tKE2O8MZqv/Wjq4c6Z
	 zhKo1n24Mp5byW4Tng6q83rTY57qMWWERPVRRh48c9YwYe7Sb9+osiiMN6tE5yHD9P
	 8A5YDa+YnUUg2rjMuTl7GObTWFdAkZfp8Gxh4adY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GInfVo2363578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 13:49:41 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 13:49:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 13:49:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GIneTr080174;
	Fri, 16 May 2025 13:49:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uG07o-0001XT-9Q; Fri, 16 May 2025 13:49:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2 1/3] bpftool: Fix for building bpftool-native
Date: Fri, 16 May 2025 13:49:38 -0500
Message-ID: <20250516184940.4818-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 May 2025 18:49:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16208

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


