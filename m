Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1868652986
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2019 08:34:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB98Wjuf029711
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 02:32:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575880365;
	bh=mTnzJ80AOZY9Pxxlk51jdsjJi7EilEGDByyY1mEi4qE=;
	h=From:To:CC:Subject:Date;
	b=EYyCth1l6yODjjZ6CDplphtMYf8FhhOFmBXNI4nMyvqgjCkzjkzCBlI4KAjAu5F0s
	PSUNZQitEqLgmq20EPIO84vb59RbB/044130ZlIleCPa50bYRfN7vBE6KanMjbVVED
	rTzJXuhSmQUVuY57AagV9BLKkWsQSzlm6haHwAs8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB98WjKt098189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 02:32:45 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 9 Dec 2019 02:32:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 9 Dec 2019 02:32:44 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB98WdYL082898; 
	Mon, 9 Dec 2019 02:32:42 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Dec 2019 14:02:38 +0530
Message-ID: <1575880358-112711-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] Rules.make: Initialie DESTDIR and EXEC_DIR conditionally
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
X-List-Received-Date: Mon, 09 Dec 2019 08:34:19 -0000
Content-Type: text/plain

DESTDIR and EXEC_DIR in the Rules.make point to the paths where
the files should be installed.

Initialize the conditionally so that command line override is
allowed. This is useful when you want to switch between NFS rootfs
and SD card rootfs.
e.g. Following can be done now from installer.

$> DESTDIR=/path/to/sd/card make install #custom installation
$>                          make install #NFS installation

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index 96f248a..a2b7769 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -14,7 +14,7 @@ UBOOT_MACHINE=__UBOOT_MACHINE__
 export TI_SDK_PATH=__SDK__INSTALL_DIR__
 
 #root of the target file system for installing applications
-DESTDIR=__DESTDIR__
+DESTDIR ?=__DESTDIR__
 
 #Points to the root of the Linux libraries and headers matching the
 #demo file system.
@@ -42,4 +42,4 @@ SDK_PATH_TARGET=$(TI_SDK_PATH)/__SDK_PATH_TARGET__
 
 # Set EXEC_DIR to install example binaries.
 # This will be configured with the setup.sh script.
-EXEC_DIR=__EXEC_DIR__
+EXEC_DIR ?=__EXEC_DIR__
-- 
1.9.1


