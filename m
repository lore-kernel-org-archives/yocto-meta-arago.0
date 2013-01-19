Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id A418C52ABE
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:37 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n5so5011478oag.3
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FWgMMZ+8otTH/rlXMdjf2h3j9rV1iIebIaV7D9K9TcA=;
	b=W5SUjz51XOPrRTcGmXQF6KQlajfCcw2TU1ColaKQr5mIjjOgoNLkWAW8z2gfiIhnFD
	cbwGYRkT/BcueO+Oe5vczB++uZUQPx4XA5+UeqNHvBJJOamj9JAkFHS+PvjkOa2DPmXM
	F8kFd6n3MIodyqEudGyyHvmYWqVbyRP0c11QmdvNmrtrcPOGS3RbwStI8ZPRqv+gRMlB
	ago54VCO59/nSPy5B6J+LzHxkHH/eGcgdhRR+gv5C46cZkY6BhyfQ8w6xhSuAtT7BvO1
	q6IiL8ZfL5NO/c72laoNPr7jK0txU6fCjyoaNF2NEh2YByFssufbiIv30upo6P9E1AuL
	InHQ==
X-Received: by 10.60.0.165 with SMTP id 5mr10605608oef.128.1358632357153;
	Sat, 19 Jan 2013 13:52:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:36 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:45 -0600
Message-Id: <1358632316-12266-20-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 20/31] task-arago-tisdk-connectivity: Add back wlan and bluetooth firmware and drivers
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:38 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../task-arago-tisdk-connectivity-sdk-host.bb      |   11 ++++-------
 .../tasks/task-arago-tisdk-connectivity.bb         |    8 ++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
index 40527e7..23ea14a 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -18,12 +18,9 @@ FIRMWARE_AND_DRIVERS_SRC = "\
 
 CONNECTIVITY_RDEPENDS = ""
 
-# Need to add ${FIRMWARE_AND_DRIVERS_SRC} to the below lists once the recipes
-# have been added to meta-ti
-
-CONNECTIVITY_RDEPENDS_am37x-evm = ""
-CONNECTIVITY_RDEPENDS_am180x-evm = ""
-CONNECTIVITY_RDEPENDS_ti33x = ""
+CONNECTIVITY_RDEPENDS_am37x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
+CONNECTIVITY_RDEPENDS_am180x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
+CONNECTIVITY_RDEPENDS_ti33x = "${FIRMWARE_AND_DRIVERS_SRC}"
 
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
index 1cbd0cc..293b224 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -61,25 +61,25 @@ DEMO_APPS = "\
 
 CONNECTIVITY_RDEPENDS = ""
 
-# Need to add ${FIRMWARE_AND_DRIVERS} to the below lists once the recipes have
-# been added to meta-ti
-
 CONNECTIVITY_RDEPENDS_am37x-evm = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
+    ${FIRMWARE_AND_DRIVERS} \
 "
 
 CONNECTIVITY_RDEPENDS_am180x-evm  = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
+    ${FIRMWARE_AND_DRIVERS} \
 "
 
 CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
+    ${FIRMWARE_AND_DRIVERS} \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.7.0.4


