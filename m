Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8CFE752079
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2018 17:36:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w92Ha2Jj107507
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2018 12:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538501762;
	bh=tNuRGBq5/JL0i31ReJLQEA2lc4TxmDwOHqnzxZaUCPk=;
	h=From:To:CC:Subject:Date;
	b=XfHQ0LbD5JJRwFKAc4mbH853Quy+R1xs3dtkk+CW+4adRFSX3tn9M4Jwr6zTbwgwg
	//hZqu52JF3GQsEok7pQw6qj/kNuCsm4z7YPj42HcBD+U7oc5KKp5sHO8O+MI1xH2D
	h2JrXJ3nb39vTJLMvJP1GhvKZ/es0Tv1v5AdCJO4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w92Ha2Y6028452
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2018 12:36:02 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 2 Oct 2018 12:36:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 2 Oct 2018 12:36:02 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w92Ha17C008383;
	Tue, 2 Oct 2018 12:36:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Oct 2018 17:31:47 +0000
Message-ID: <20181002173147.17504-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] netboot-initrd: add phy-omap-usb2 to list of modules
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
X-List-Received-Date: Tue, 02 Oct 2018 17:36:12 -0000
Content-Type: text/plain

It used to be built-in, now it's a module. It's required for ETH-over-USB.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
index 260236e1..c774af0a 100644
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb
@@ -3,10 +3,12 @@ DESCRIPTION = "Small image capable of mounting a newtwork root filesystem (NFS)"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+PR = "r1"
+
 inherit core-image image_types
 
 #by default include the kernel modules necessary to use a ASIX USB/Ethernet adapter
-NETBOOT_KERNEL_MODULES ?= "dwc3 dwc3-omap asix xhci-plat-hcd extcon-usb-gpio"
+NETBOOT_KERNEL_MODULES ?= "dwc3 dwc3-omap asix xhci-plat-hcd extcon-usb-gpio phy-omap-usb2"
 
 export IMAGE_BASENAME = "netboot-initramfs"
 
-- 
2.17.1


