Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4C2BF529EE
	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 17:46:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5CHklF8005920
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 12:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497289607;
	bh=VF6hKqQDX3GX3CSjlXDmGFrIRK74j9BHrfJTeFsGcEg=;
	h=From:To:CC:Subject:Date;
	b=XjU57vynmh+HBkRjeo+O7/c9CxRFjaH1IQ9JBftP3aMxVel7dhWD1zGbsAh6vGtCN
	4Ri+Bcp60M/FvXs+LG+8VoFPYelrBet24F/9tawtjhfCuRx56anp2y7RbIycnXD8qf
	ITlKy+2I/YesfDlh2hRnqOZ+s3LUqVXXUg6Swpwo=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CHkg9h021067
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 12:46:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 12:46:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5CHkfpl010427;	Mon, 12 Jun 2017 12:46:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Jun 2017 13:41:06 -0400
Message-ID: <1497289266-14059-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] arago-core-tisdk-image: add DTB_FILTER for omapl138
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
X-List-Received-Date: Mon, 12 Jun 2017 17:46:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index c6afdbe..fbc3161 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -28,6 +28,7 @@ DTB_FILTER_k2hk = "k2hk"
 DTB_FILTER_k2l-evm = "k2l"
 DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g = "k2g"
+DTB_FILTER_omapl138 = "da850"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
-- 
2.7.4


