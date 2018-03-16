Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B56DE52986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:10:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGA3SY005539
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521216603;
	bh=nWjKED/J8edNBYwTSHDYI520C54QSWT7S/a2BUIsa+k=;
	h=From:To:Subject:Date;
	b=g7jdnnApsAgILCjSiuCKDc/+zaIVMAetAuMy3khTk8gZCu2FrgGiOw8+JtKNZuiH/
	R+imxJ+VR+T6RjRBcLLQNzvq3J9oxUfIjaL/pQzBSuG4lRCZP+5xH0ST4dwwgY8srB
	LLpfEHyb+A3gyAOBK8EUyCIOyAMtS/fuYrvWdyOQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGA3gL004183
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:10:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:10:02 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:10:02 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGA20c028931
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:10:02 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:10:00 -0400
Message-ID: <1521216600-27274-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Udpating to the latest version
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
X-List-Received-Date: Fri, 16 Mar 2018 16:10:57 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
index 67305b2..75258e9 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
@@ -6,7 +6,7 @@ DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
 "
 LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"
 
-I2C_LLD_SRCREV = "137c6c60d18a14629f1a7572fd87402716bd5104"
+I2C_LLD_SRCREV = "631a38ad7245b68bfac40a417bdc9d3a0b7ca724"
 
 PV = "01.00.00.10"
 
-- 
1.9.1


