Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5EB46520DE
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2019 08:43:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U8gEY9100919
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569832934;
	bh=mBCh8BRZ2Xe2LSFCc3KhkaVk9C6Fsfz8CXpJjXTWFTk=;
	h=From:To:CC:Subject:Date;
	b=ygy7xuUdWxLo0OqKtdOK3tOCW3Uy+Xiu9pXBtWpc9kfkDEkZXLIc8IylNsXVQdZI9
	63rTb/cZ0d/TFojxSj21UYL1TNEq2etm/w0LdN4nd1nSbl5ZBguwYlm1C2aMz213Gk
	nnXE9hbVMamsIiC/C++aEOiE/UUQjCMICvzUs/e4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8gEih000563
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:42:14 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 03:42:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 03:42:14 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8gCgF088386; 
	Mon, 30 Sep 2019 03:42:13 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Sep 2019 14:12:07 +0530
Message-ID: <1569832927-52857-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v2] tisdk-readme: Add separate README for k3 platforms
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
X-List-Received-Date: Mon, 30 Sep 2019 08:43:25 -0000
Content-Type: text/plain

For machines with k3 platforms, install a different README file
It describes all the new files needed for booting k3 devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Changes from v1:
* Avoid recipe changes, use machine specific README file

 .../tisdk-readme/tisdk-readme/k3/README            | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README
new file mode 100644
index 0000000..0eb6dd3
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README
@@ -0,0 +1,26 @@
+The files contained in this directory represent the images that were built
+as part of the original SDK build and packaging process.  They are meant
+to serve as a restore and starting point for your development.  In order
+to use these images with an SD card they should be placed in the appropriate
+locations.
+
+By default these locations are:
+
++-------------+-----------------------------------------+
+|    File     |                Location                 |
++-------------+-----------------------------------------+
+| tiboot3.bin | boot partition                          |
+| tispl.bin   | boot partition                          |
+| u-boot.img  | boot partition                          |
+| sysfw.itb   | boot partition                          |
+| uEnv.txt    | boot partition                          |
++-------------+-----------------------------------------+
+| Image       | /boot directory of the rootfs partition |
+| *.dtb       | /boot directory of the rootfs partition |
+| *.dtbo      | /boot directory of the rootfs partition |
++-------------+-----------------------------------------+
+
+By default the boot loaders are read from the first FAT partition, which is
+usually called the "boot" partition.  Then the bootloader will look for the
+Image and .dtb .dtbo files in the /boot directory of the ext4 partition, which is
+usually called the "rootfs" partition.
-- 
1.9.1


