Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 21EFA52AA0
	for <meta-arago@arago-project.org>;
	Fri, 23 Sep 2016 16:36:52 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODY00AI9U4L5R70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 Sep 2016 11:36:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=0-LPCDr9iQurJelC1pUA:9
Received: by 100.15.110.130 with SMTP id 72e27d5d;
	Fri, 23 Sep 2016 16:36:36 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id B33FD162146;	Fri, 23 Sep 2016 12:36:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 Sep 2016 12:36:20 -0400
Message-id: <1474648580-3614-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago.conf: enable FIT image for am3 and k2e HS platforms
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
X-List-Received-Date: Fri, 23 Sep 2016 16:36:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 256d904..db6f119 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -39,6 +39,14 @@ KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_am437x-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_am437x-hs-evm = "cpio.xz"
 
+KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_am335x-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_am335x-hs-evm = "cpio.xz"
+
+KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_k2e-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_k2e-hs-evm = "cpio.xz"
+
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-- 
2.7.4


