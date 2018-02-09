Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E433E52092
	for <meta-arago@arago-project.org>;
	Fri,  9 Feb 2018 15:35:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w19FZYlb001138
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 09:35:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518190534;
	bh=ywcv1PI3Jxo4QwIUY0jsvlKz3K7tUCYxMIWnQAEUwEY=;
	h=From:To:Subject:Date;
	b=hkbYIOaOwKdf/wEjz3kmUtdDbT9Gu/Owajz0hgzpkGis81hKFfGOJr/cycWYjS3tc
	6Um2Bgmx2KtBLY8nIONT+bXO2gYYDAJOAFMEXEB2gVfFxCbhPoxWZ6tDeiZcw3nblF
	LozZqMtqTYW2Yg5WW1VuwuwZugZR//Q/bVWiifIE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w19FZYSk021406
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 09:35:34 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 9 Feb 2018 09:35:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 9 Feb 2018 09:35:34 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w19FZYA5030759
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 09:35:34 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Feb 2018 10:35:22 -0500
Message-ID: <1518190522-46326-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Updating version & checksum
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
X-List-Received-Date: Fri, 09 Feb 2018 15:35:47 -0000
Content-Type: text/plain

---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
index f46d2b6..d4da4ce 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
@@ -4,4 +4,11 @@ DEPENDS_append_ti43x = " pruss-lld-rtos \
 "
 DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
 "
+LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"
+
+I2C_LLD_SRCREV = "137c6c60d18a14629f1a7572fd87402716bd5104"
+
+PV = "01.00.00.10"
+
 INSANE_SKIP_${PN} = "arch"
+
-- 
1.9.1


