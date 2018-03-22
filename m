Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8F4EA529A2
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 14:08:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2ME8Ln1031449
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 09:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521727701;
	bh=XAEU3+fI9NuyCwm/5XLCeSXiH6zAc279EdmeOHhohn4=;
	h=From:To:CC:Subject:Date;
	b=EfuyMsRLWLNRzT2Fm0Uzf+Z5MMD5SIQIiXuOQH+ZaVF8loOmSFL4+2Dft/pEwDwou
	6oHnofBRTiYsxnZRiV9Ea7U/v6tYpKLv7alIG2je43CgfPo6fP/XbTi9kP5Z5odVey
	VMGQS6jpZV/xwgo5QL6RLZA0gk+xbb5RrpiMEBbo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2ME8LQO027061
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 09:08:21 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 09:08:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 22 Mar 2018 09:08:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2ME8LGw014397;
	Thu, 22 Mar 2018 09:08:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:58:08 -0400
Message-ID: <1521727089-14554-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 1/2] linux-libc-headers: use latest processor-sdk-linux
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
X-List-Received-Date: Thu, 22 Mar 2018 14:08:23 -0000
Content-Type: text/plain

* This is needed for ptp_clock.h change

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb

diff --git a/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb b/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
new file mode 100644
index 0000000..7b9ba65
--- /dev/null
+++ b/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
@@ -0,0 +1,12 @@
+require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+
+PR_append = ".tisdk0"
+
+BRANCH = "processor-sdk-linux-04.03.00"
+SRCREV = "b84a80dbbb9901f550a6bff7acbb956f7f18c515"
+
+KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
2.7.4


