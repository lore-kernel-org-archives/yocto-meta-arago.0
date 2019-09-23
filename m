Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C14FD5299C
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2019 23:08:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NN7eMX053107
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 18:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569280060;
	bh=rAOHUIsSSODgnTivm33BxpA5ucdWMxU4/tE6E7TsDg4=;
	h=From:To:CC:Subject:Date;
	b=TEVc7P+ae645NwSkIytg72SmKHv00DGjUuVekOPKZyp9hl/RX4dbtBb1+LErnoeEz
	eu5dsZvtbBRuAAj+VI3d16dbbx0ovIO7/NNygKRHwEhjZEC2rFURjINXTIyGuebMKk
	aUkuvqKgmgrdUQk35KI8wgRTt1UBeHePq147CgQY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NN7evi123910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 18:07:40 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 18:07:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 18:07:34 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NN7dtb095426;
	Mon, 23 Sep 2019 18:07:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Sep 2019 22:52:16 +0000
Message-ID: <20190923225216.29739-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] arago.conf: ensure additional wic dependencies are deployed
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
X-List-Received-Date: Mon, 23 Sep 2019 23:08:50 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6b800611..beacad7c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -131,6 +131,9 @@ JH_RAMFS_IMAGE = "arago-tiny-image"
 # K3 devices also requre R5 SPL and SYSFW to boot
 EXTRA_IMAGEDEPENDS_append_k3 = " u-boot-k3-r5 ti-sci-fw"
 IMAGE_BOOT_FILES_append_k3 = " tiboot3.bin sysfw.itb"
+EXTRA_WIC_DEPENDS = ""
+EXTRA_WIC_DEPENDS_k3 = "u-boot-k3-r5:do_deploy ti-sci-fw:do_deploy"
+do_image_wic[depends] += "${EXTRA_WIC_DEPENDS}"
 
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
-- 
2.17.1


