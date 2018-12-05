Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4AEF7529A6
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2018 14:34:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB5EY8xk007521
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 08:34:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544020448;
	bh=Z2MeQ4YMRR5XjX3xiqwwovM4lvhbaZ4Jk+6bAtN3Zdw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=miSM1EXv7ul+dL8iMsnlKuoY3rg8J8oQGOlp9uN4SE7H2NXhNvC2TkguwwWc6aSpK
	4cdpisXqTVpUFRnES1hXce4PMLQgvRvrJJh5dsEtwZI2qxaSRtErRw8JTqv2Ha3Ohi
	pmLx7wgWIq0bxzOfDbEq8hV9w28Q26Xbvz+I6V5c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB5EY8G6028599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 08:34:08 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 08:34:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 08:34:07 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB5EY77l023930;
	Wed, 5 Dec 2018 08:34:07 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Dec 2018 09:21:44 -0500
Message-ID: <1544019704-20384-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544019704-20384-1-git-send-email-j-stiffler@ti.com>
References: <1544019704-20384-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 3/3] arago-core-tisdk-image: add arago-tiny-image rootfs
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
X-List-Received-Date: Wed, 05 Dec 2018 14:34:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index dddec2c..76102a1 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -31,14 +31,14 @@ DTB_FILTER_omapl138 = "da850"
 DTB_FILTER_am65xx-evm = "am65"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
+TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image arago-tiny-image"
 
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 
 # Some devices do not support display and use a server image instead
-TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
-TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
+TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
+TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
-- 
2.7.4


