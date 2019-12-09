Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F218252986
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2019 08:16:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB98F09D078587
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 02:15:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575879300;
	bh=Go/J7tv6w6aiT5JrIFO5p/wluQY7NKDFVU3Vb50Ko9g=;
	h=From:To:CC:Subject:Date;
	b=w5iBzWSFjnI9Wg3+m4HidaHlIppS8VgT4+FfK7kDNahnsQLgJsHT+gkRG/Ij8V9zi
	+4xJuWOsRz0kuG+18BXRuyfFRKQFwu1biRP1dyLCmxn4a8UwumMDwdCMOI4h6MkauJ
	4r4xkFiciHAdnNABkpZPVIoxLh1HPRee96lHRLtI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB98ExDU094673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 02:14:59 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 9 Dec 2019 02:14:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 9 Dec 2019 02:14:59 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB98EwEh100975; 
	Mon, 9 Dec 2019 02:14:58 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Dec 2019 13:44:55 +0530
Message-ID: <1575879295-99580-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v1] Rules.make: Allow overwriting DESTDIR
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
X-List-Received-Date: Mon, 09 Dec 2019 08:16:34 -0000
Content-Type: text/plain

DESTDIR in the Rules.make points to the path where
the files should be installed.

setup scripts update this to the targetNFS location but
it cannot be used for installing files in the SD card.
When DESTDIR is defined conditionally, it allows following

DESTDIR=/path/to/sd/card make install #custom installation
make install #NFS installation

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index 96f248a..3382d93 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -14,7 +14,7 @@ UBOOT_MACHINE=__UBOOT_MACHINE__
 export TI_SDK_PATH=__SDK__INSTALL_DIR__
 
 #root of the target file system for installing applications
-DESTDIR=__DESTDIR__
+DESTDIR ?=__DESTDIR__
 
 #Points to the root of the Linux libraries and headers matching the
 #demo file system.
-- 
1.9.1


