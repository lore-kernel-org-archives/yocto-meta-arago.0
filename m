Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C05E452990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 16:28:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KGSjWS020005
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 11:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505924925;
	bh=QCeAsbro4tsg9arUFMLLg3mYxU8nzgfY4xjzkToreWA=;
	h=From:To:CC:Subject:Date;
	b=M38P29/PH1yaw1sJNQg6UvJL2oCVWnmSN3FOi++nYEM4FFWFp5ih1eBZ1y8BYIpWP
	tpft25IQfwXiMZ1ZktXgoz9JxDwY9YMrBLoiicHq8ezoEuFw2GXqSt3Z87jQ7QppSN
	/5Bcm8/z44IIS/nTlMmme90x9HmwjkT1hY/xbNjU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KGSjP6018120
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 11:28:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 11:28:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 11:28:45 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KGSjIw010034;
	Wed, 20 Sep 2017 11:28:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 12:28:42 -0400
Message-ID: <1505924922-28987-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] icss-emac-lld-rtos: add rtos recipe for icss-emac-lld
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
X-List-Received-Date: Wed, 20 Sep 2017 16:28:46 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
new file mode 100644
index 0000000..8ce16e5
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "TI RTOS low level driver for ICSS-EMAC"
+
+inherit ti-pdk
+require icss-emac-lld-01.00.00.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " osal-rtos \
+                   pruss-lld-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


