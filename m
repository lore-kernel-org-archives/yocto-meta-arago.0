Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5F9A452A2E
	for <meta-arago@arago-project.org>;
	Tue, 16 Apr 2019 17:25:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3GHPPXe023634
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 12:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555435525;
	bh=totBHAuDy84qZbZ0O6NBxWiDMo6cHDRps0ovZa1EWYA=;
	h=From:To:CC:Subject:Date;
	b=BHT4U8EoC03wxDu26eMHo09wkvODIgHSF6GZf4/tgnTb3ZKF6KAcfyoSIxwwiSmn3
	TiiIUodtqRWKZr+cHnoonmeEMFNVmu5ukNDKpRRpKmulcVW8UDzHepWVRBiFruz3RH
	3nDlOnLXjAePIIwiDKmzcHS03RCWcOPEsV3QLJhw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3GHPPOF056995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 12:25:25 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Apr 2019 12:25:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Apr 2019 12:25:25 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3GHPOVD111043;
	Tue, 16 Apr 2019 12:25:24 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Apr 2019 13:13:10 -0400
Message-ID: <1555434790-6375-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] processor-sdk: disable am571x-idk-pru-excl-uio.dtb
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
X-List-Received-Date: Tue, 16 Apr 2019 17:25:51 -0000
Content-Type: text/plain

* In kernel v4.19, there is some restructuring of devicetree which
  currently leaves this broken.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 627a69d..7a05b93 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -36,6 +36,9 @@ RESERVE_CMEM_keystone = "1"
 # Enable TI UIO devices
 ENABLE_TI_UIO_DEVICES = "1"
 
+# FIXME: temporarily remove broken device tree
+KERNEL_DEVICETREE_remove = "am571x-idk-pru-excl-uio.dtb"
+
 # Configure ROS to use python3
 ROS_USE_PYTHON3 = "yes"
 
-- 
2.7.4


