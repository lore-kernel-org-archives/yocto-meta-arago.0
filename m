Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0FBF2529F7
	for <meta-arago@arago-project.org>;
	Mon, 19 Jun 2017 19:50:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5JJo9jp026659
	for <meta-arago@arago-project.org>; Mon, 19 Jun 2017 14:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497901809;
	bh=KgpvESLJPln2qR/tDHPMZa7qRF+uw2J6Yxi8ZMXKcIU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PpRBkxLuYnysj/skv4G3ukFdOK2ufyjNilbowsLUf4Jvue0ytRg/UYwHOTfXbjS8X
	yT8g126iMK90OrdoDUQVD+jcxAOCwHLHSSHOPiigb6sR+Ytd067xlkJpg43xfSe7L3
	UCgEE/VfwRtBwmh+7T0Ia6jpc1ZmH31hrtZny9kY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5JJo82d017667
	for <meta-arago@arago-project.org>; Mon, 19 Jun 2017 14:50:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Jun 2017 14:50:08 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5JJo8hh021000;	Mon, 19 Jun 2017 14:50:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Jun 2017 15:43:58 -0400
Message-ID: <1497901439-31567-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497901439-31567-1-git-send-email-j-stiffler@ti.com>
References: <1497901439-31567-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tisdk-rootfs-image: add the matrix-extra packagegroup
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
X-List-Received-Date: Mon, 19 Jun 2017 19:50:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index c511b83..1a477d1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -15,6 +15,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
-- 
2.7.4


