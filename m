Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4C9F952970
	for <meta-arago@arago-project.org>;
	Mon,  6 Mar 2017 17:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9ED1920BCD;
	Mon,  6 Mar 2017 17:20:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NXXam2uC8Ahm; Mon,  6 Mar 2017 17:20:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 801F220BCC;
	Mon,  6 Mar 2017 17:20:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 18F5D16216E;
	Mon,  6 Mar 2017 12:20:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  6 Mar 2017 12:20:52 -0500
Message-Id: <1488820852-128371-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] tisdk-image: handle case when both zImage and uImage are available
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
X-List-Received-Date: Mon, 06 Mar 2017 17:20:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Prefer and package zImage in that case.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index cb47861..0a0c570 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -740,9 +740,12 @@ tisdk_image_build () {
     fi
 
     # Copy the Kernel image if it exists
-    if [ -e ${DEPLOY_DIR_IMAGE}/[uz]Image-${MACHINE}.bin ]
+    if [ -e ${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin ]
     then
-        cp ${DEPLOY_DIR_IMAGE}/[uz]Image-${MACHINE}.bin ${prebuilt_dir}/
+        cp ${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin ${prebuilt_dir}/
+    elif [ -e ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ]
+    then
+        cp ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ${prebuilt_dir}/
     else
         echo "Could not find the Kernel image"
         return 1
-- 
2.7.4


