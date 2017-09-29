Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id BB13952A88
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINcM3018708
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709418;
	bh=GQVrbxynbmsuuNF1kUlyU8xhB/LpY/1hHTQI08jxbcA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FlMEgvC0kyqy22EsE/OOUfZw5evqlZWBXRFeVQHrns0xVWppx1p6a/YjA4uT7hhnw
	dbQxKVj0uuqfmRtOI/PKxx1mNIkLRb5GRFrRCDzyfiSZV+mS8EsRfWWl8vmkVO7t4S
	07qOtHeV+VlH+4x2FVoZ4FFJ+kkHUErDfaAxlPx8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINX5Z010390
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8R006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:06 -0400
Message-ID: <1506709407-16448-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 02/layer.conf: select sgx-ddk based on ddk window support (xsgx vs, sgx)
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:49 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0334463..8e2c5a1 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,9 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-processor-sdk"
 BBFILE_PATTERN_meta-processor-sdk := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-processor-sdk = "15"
+
+SIGGEN_EXCLUDERECIPES_ABISAFE_remove = " ti-sgx-ddk-km  ti-sgx-ddk-um"
+SIGGEN_EXCLUDERECIPES_ABISAFE_append = " \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-km", "ti-sgx-ddk-km", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-um", "ti-sgx-ddk-um", d)} \
+"
-- 
1.9.1


