Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by arago-project.org (Postfix) with ESMTPS id CA1FD52A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:41 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id tb18so2737408obb.31
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=B6KrkwZX7+2m/SAePzKaQZAGFtSAd0O2vsSmQYV2jzs=;
	b=x+kEGDGnnp8c7MOwuiUTlcjWFsAa5p/v3dfDEqy1ZyZle9s/zxtR78qaPL3LUaGOl4
	KK90xmKCU/9aTPw1PehhBp9lvUR/6bldXk0ZLL4KtJJpctmK/tf/MgoSquKm8x8+gzl3
	KJbLyw5UnLjc6aXb0wrIqdN/q3S/LM7ud9RWzYSm6Iv80s94EdrPPHRHNtbl1st7NbJM
	vaUsLRzc4PHJ59y5DU3Rr/DkkHlosmvIQK8Wnv6F8oMttj1WlQTCdK2qRKIXdyfNg173
	VGLprlcPjbtgeByQGWJrnSMG70nRiDXvk8dYgYTHxU22OfHq9gBB6JsoKd4TlrOW4FQ0
	ODKA==
X-Received: by 10.60.21.167 with SMTP id w7mr11689413oee.18.1359393939625;
	Mon, 28 Jan 2013 09:25:39 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:38 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:01 -0600
Message-Id: <1359393932-31361-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/32] tisdk-image.bbclass: Add additional GPLv3 tables
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:43 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add tables that list only the GPLv3 libraries.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 8ef8ad8..4434155 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -259,6 +259,14 @@ sw_manifest_toolchain_host() {
     opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/var/lib/opkg/info"
 
 echo "
+<h2><u>GPLv3 Development Host Content</u></h2>
+<p>This table describes any GPLv3 software being delivered that is expected to run on a Development Host, instead of the target device.</p>
+" >> ${SW_MANIFEST_FILE}
+
+    generate_sw_manifest_table $opkg_dir "true"
+
+
+echo "
 <h2><u>Development Host Content</u></h2>
 <p>This table describes any software being delivered that is expected to run on a Development Host, instead of the target device.  Some of this software may be licensed under GPLv3 but it is not expected to be shipped as a product.</p>
 " >> ${SW_MANIFEST_FILE}
@@ -273,6 +281,13 @@ sw_manifest_toolchain_target() {
     opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/arm-arago-linux-gnueabi/var/lib/opkg/info"
 
 echo "
+<h2><u>GPLv3 Development Libraries Installed on Host</u></h2>
+<p>This table describes GPLv3 software libraries and headers that are installed on the development host and used during the development of software to run on the target. Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
+" >> ${SW_MANIFEST_FILE}
+
+    generate_sw_manifest_table $opkg_dir "true"
+
+echo "
 <h2><u>Development Libraries Installed on Host</u></h2>
 <p>This table describes software libraries and headers that are installed on the development host and used during the development of software to run on the target.  Some of this software may be licensed under GPLv3.  Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
 " >> ${SW_MANIFEST_FILE}
-- 
1.7.0.4


