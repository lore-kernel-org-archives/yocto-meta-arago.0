Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6AEFB529A6
	for <meta-arago@arago-project.org>;
	Mon, 23 Apr 2018 21:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 038CE20B70;
	Mon, 23 Apr 2018 21:01:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9OchDpkRaRBw; Mon, 23 Apr 2018 21:01:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9740204D6;
	Mon, 23 Apr 2018 21:01:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4B70716343D;
	Mon, 23 Apr 2018 17:01:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Apr 2018 17:01:24 -0400
Message-Id: <1524517285-20944-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] netboot-initrd: fix ROOTFS_POSTPROCESS_COMMAND missing separator
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
X-List-Received-Date: Mon, 23 Apr 2018 21:01:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
index 0d0aaf0..e165d9a 100644
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
@@ -40,7 +40,7 @@ IMAGE_LINGUAS = ""
 # To further reduce the size of the rootfs, remove the /boot directory from the final image
 # this is usually done by adding RDEPENDS_kernel-base = "" in the configuration file. In our case we can't use
 # this method. Instead we just wipe out the content of "/boot" before creating the image.
-ROOTFS_POSTPROCESS_COMMAND += 'empty_boot_dir'
+ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
 empty_boot_dir () {
 	rm -rf ${IMAGE_ROOTFS}/boot/*
 }
-- 
2.7.4


