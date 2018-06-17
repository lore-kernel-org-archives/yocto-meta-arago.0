Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 43CF052A3D
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AFE9220BBE;
	Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AQe-ghGPgl0n; Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8F98720BBF;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E06711634B1;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:37 -0400
Message-Id: <1529264260-41284-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 6/9] amsdk-av-files: drop COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:52 -0000

No need to restrict this package - those are just AV files.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb              | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
index 4598416..9d20b1a 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
@@ -5,7 +5,6 @@ SECTION = "multimedia"
 LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
 PR = "r1"
 
-COMPATIBLE_MACHINE = "(omap3|ti33x|ti43x|omap-a15|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 VIDEO_FILES = "video_480p "
-- 
2.7.4


