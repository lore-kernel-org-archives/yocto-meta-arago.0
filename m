Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EE5BF52A4E
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2018 19:20:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UJKVrQ011591
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 14:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535656831;
	bh=DYNDPozmnCJoWnFHbnNhicPM0277+Ot9Co7T54b1MeE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J9qASXDEFomGQmVFB3BbFYwQCUE8a2EACLuwyEjbzSHbON25YPbq3lzZ1sAaknpNx
	lX0UQGRjFsmGv1hMU9xfcMzx8EZB/84lshSMjNnK7C1CViM2bHro7i3qp2hCbG/IKU
	AcnrAbC69r8DB2L6wdjnTBvA04vtthNL+N6eup6M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJKVhL030679
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 14:20:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 14:20:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 14:20:31 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJKV0r018722;
	Thu, 30 Aug 2018 14:20:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2018 15:08:15 -0400
Message-ID: <1535656095-12896-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535656095-12896-1-git-send-email-j-stiffler@ti.com>
References: <1535656095-12896-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-host: k3: add tisdk-uenv
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
X-List-Received-Date: Thu, 30 Aug 2018 19:20:41 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 8020bb8..b0736d4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r28"
+PR = "r29"
 
 PN = "packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX}"
 
@@ -21,6 +21,7 @@ BOOT_MONITOR_keystone = "boot-monitor-src"
 EXTRA_FILES = ""
 EXTRA_FILES_ti43x = "tisdk-uenv"
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
+EXTRA_FILES_k3 = "tisdk-readme tisdk-uenv"
 
 RDEPENDS_${PN} = "\
     ti-tisdk-setup \
-- 
2.7.4


