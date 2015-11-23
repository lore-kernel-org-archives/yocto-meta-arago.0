Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7E87052A89
	for <meta-arago@arago-project.org>;
	Mon, 23 Nov 2015 17:40:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tANHejBe019321
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHejpK001683
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Nov 2015 11:40:46 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHejrK006601;
	Mon, 23 Nov 2015 11:40:45 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1a0v6b-0005JO-AU; Mon, 23 Nov 2015 12:40:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Nov 2015 12:40:36 -0500
Message-ID: <1448300436-20360-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
References: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] arago-core-tisdk-image: use meta-toolchain-arago-tisdk-server for keystone
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
X-List-Received-Date: Mon, 23 Nov 2015 17:40:49 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index ed61d23..26bf4a7 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -36,8 +36,8 @@ TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
 
-TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago"
-TOOLCHAIN_SUFFIX_keystone = "-sdk"
+TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
+TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
-- 
1.9.1


