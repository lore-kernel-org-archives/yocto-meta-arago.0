Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3BFF5529BF
	for <meta-arago@arago-project.org>;
	Fri, 21 Jul 2017 18:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25F9320ABA
	for <meta-arago@arago-project.org>;
	Fri, 21 Jul 2017 18:51:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8_Ivyv5qVwHw for <meta-arago@arago-project.org>;
	Fri, 21 Jul 2017 18:51:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D2D7208AE
	for <meta-arago@arago-project.org>;
	Fri, 21 Jul 2017 18:51:51 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 848F916253C
	for <meta-arago@arago-project.org>;
	Fri, 21 Jul 2017 14:51:51 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Jul 2017 14:51:51 -0400
Message-Id: <1500663111-13003-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [morty/master][PATCH] kernel: fitimage: deploy real fit-image
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
X-List-Received-Date: Fri, 21 Jul 2017 18:51:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Gaël PORTAY <gael.portay@savoirfairelinux.com>

Currently, do_deploy installs a standard kernel image as an ITB. This
image is linux.bin and it is prepared by uboot_prep_kimage.

The real kernel fit-image is build under arch/${ARCH}/boot/fitImage.

This patch deploys the real fit-image instead of the one prepared by
u-boot and which is included in the ITB.

Note: this patch only concerns fit-images without initramfs.

Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 3a4da6d..1249644 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -578,7 +578,7 @@ kernel_do_deploy_append() {
 		cd ${B}
 		echo "Copying fit-image.its source file..."
 		install -m 0644 fit-image.its ${DEPLOYDIR}/${FITIMAGE_ITS_IMAGE}
-		install -m 0644 linux.bin ${DEPLOYDIR}/${FITIMAGE_ITB_IMAGE}
+		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${FITIMAGE_ITB_IMAGE}
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-- 
2.7.4


