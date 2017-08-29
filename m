Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7F9B852ABB
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 20:20:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TKK9dW003611
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 15:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504038009;
	bh=8e+lzEB0kRDetl2c6H8a/143l3rOFdluPguW9Q6EVpQ=;
	h=From:To:Subject:Date;
	b=nBLwIo+QpYJN46ofSzFCYEC3GBve9gR64MrEaFmpaEKY9aMlcMwdKPjWhn9axX8rY
	YR+mCJmrMN+g3mfaKFdtfjkbVRqM8zASzpfepNenEB1NTGPnmAd1Cl0hINs9FiIo/l
	/XXkue+D+y9cIoi9F19VhWaQnGMGx3wT6k6Cfvzw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TKK4bK006250
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 15:20:04 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 15:20:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 15:20:03 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TKK39c032012
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 15:20:03 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 16:20:00 -0400
Message-ID: <1504038000-53588-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] weston: add SoC performance monitor utilities
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
X-List-Received-Date: Tue, 29 Aug 2017 20:20:19 -0000
Content-Type: text/plain

Note: This patch will remain here until those utilities are moved
outside the Weston package.


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/wayland/weston_1.11.0.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-graphics/wayland/weston_1.11.0.bbappend

diff --git a/recipes-graphics/wayland/weston_1.11.0.bbappend b/recipes-graphics/wayland/weston_1.11.0.bbappend
new file mode 100644
index 0000000..7349e71
--- /dev/null
+++ b/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -0,0 +1,7 @@
+PR_append = ".tisdk0"
+
+# SoC Performance Monitoring Utility
+
+SRC_URI += " \
+	file://0001-Add-soc-performance-monitor-utilites.patch \
+"
-- 
1.9.1


