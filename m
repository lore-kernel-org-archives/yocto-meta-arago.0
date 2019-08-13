Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 86C5C52987
	for <meta-arago@arago-project.org>;
	Tue, 13 Aug 2019 19:42:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DJfqQp115115
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 14:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565725312;
	bh=sAjW48oKbJqUvGOSTI27msYth8IRU0jWi85yDNk9yVM=;
	h=From:To:Subject:Date;
	b=HMfceUB8PP5M5EVLVOwKA1hbIn73p3zFXn+QLh0kvUk2w1Mu2Bnz9WuH4VstfS+cK
	2fkfVebZ/buUDHcoLM52Xqo5FDhPCf2RU5fzq+BKP69jfGpKcdeQhIuePJA+Jw1zxO
	vD33aV16xW29qXesUeSQ6dYYbSHPx1Vyjk6oFvOk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DJfqLo113612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 14:41:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 14:41:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 14:41:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DJfpW9009303
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 14:41:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 13 Aug 2019 15:41:47 -0400
Message-ID: <1565725307-28087-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] j7-evm.conf: Adding TI_PDK_LIMIT_SOCS/BOARDS/CORES for j7
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
X-List-Received-Date: Tue, 13 Aug 2019 19:42:50 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 conf/machine/j7-evm.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 17d48d0..22914ba 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -28,4 +28,9 @@ OPTEEOUTPUTMACHINE = "k3"
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 WKS_FILE = "sdimage-bootpart.wks"
 
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS_j7-evm = "j721e"
+TI_PDK_LIMIT_BOARDS_j7-evm = "j721e_evm"
+TI_PDK_LIMIT_CORES_j7-evm = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mpu2_1 mpu3_0 mpu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
+
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
-- 
1.9.1


