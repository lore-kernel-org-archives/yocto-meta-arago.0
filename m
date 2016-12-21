Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E848C52AD2
	for <meta-arago@arago-project.org>;
	Wed, 21 Dec 2016 20:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1057020B32;
	Wed, 21 Dec 2016 20:53:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9-nlXcvcGS2J; Wed, 21 Dec 2016 20:53:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DD86A2091B;
	Wed, 21 Dec 2016 20:53:23 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 556521621E3;
	Wed, 21 Dec 2016 15:53:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 15:53:20 -0500
Message-Id: <1482353600-445-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482353600-445-1-git-send-email-denis@denix.org>
References: <1482353600-445-1-git-send-email-denis@denix.org>
Subject: [krogoth][PATCH 2/2] linux-dtb: strip DTB extension properly in postinst/postrm
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
X-List-Received-Date: Wed, 21 Dec 2016 20:53:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

The use of awk -F "." in do_install/do_deploy to strip filename extension
was deprecated long time ago in 72980d5bb465f0640ed451d1ebb9c5d2a210ad0c.

Make a similar change in postinst/postrm to properly use basename command.

Otherwise DTB files that contain dots in the name result in broken symlinks
that point to non-existent truncated files.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
A slightly different version of this patch was sent upstream for master/morty

 meta-arago-distro/recipes-kernel/linux/linux-dtb.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc b/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc
index 651a19e..121ef97 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc
+++ b/meta-arago-distro/recipes-kernel/linux/linux-dtb.inc
@@ -57,7 +57,7 @@ pkg_postinst_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
 	for DTB in ${KERNEL_DEVICETREE}
 	do
-		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
+		DTB_BASE_NAME=`basename ${DTB} .dtb`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
@@ -67,7 +67,7 @@ pkg_postrm_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
 	for DTB in ${KERNEL_DEVICETREE}
 	do
-		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
+		DTB_BASE_NAME=`basename ${DTB} .dtb`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
-- 
2.7.4


