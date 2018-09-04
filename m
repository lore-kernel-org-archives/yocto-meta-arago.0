Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5144B52A19
	for <meta-arago@arago-project.org>;
	Tue,  4 Sep 2018 14:27:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84ERC4L024662
	for <meta-arago@arago-project.org>; Tue, 4 Sep 2018 09:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536071232;
	bh=gUQsQjHwmn6G4aKVUNutYPkHdM//eIz1S3t4KEquj24=;
	h=From:To:CC:Subject:Date;
	b=cILOUQ4gvr8tZD0wUd0/olh4KlresOo/YNzxxnZxXOBN9h2cjxxeVYVSz3Cn9wii8
	olv3rQp0C5f8MRZJx0iO3PZK4RHhpPILUs4B+kEhx1pe2gZ+tEHgIzdfxxIkcBA+Dy
	uVO8Ra0zRJ7xOff9n42Qu1fFxOts184mpmz7sanc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84ERC0X008513
	for <meta-arago@arago-project.org>; Tue, 4 Sep 2018 09:27:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 09:27:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 4 Sep 2018 09:27:12 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84ERCuu013032;
	Tue, 4 Sep 2018 09:27:12 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Sep 2018 10:14:57 -0400
Message-ID: <1536070497-29159-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-tisdk-setup: add setup-uboot-env for k3
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
X-List-Received-Date: Tue, 04 Sep 2018 14:27:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 1408b47..52bb464 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r36"
+PR = "r37"
 
 BRANCH ?= "master"
 SRCREV = "81862f79b19bf4f312555863d247de88921a019b"
@@ -36,6 +36,7 @@ UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
 UBOOT_ENV_ti43x = "setup-uboot-env-am43x.sh"
 UBOOT_ENV_omap5-evm = "setup-uboot-env-omap5.sh"
 UBOOT_ENV_am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
+UBOOT_ENV_k3 = "setup-uboot-env-am65x.sh"
 UBOOT_ENV_keystone = "setup-uboot-env-keystone.sh"
 UBOOT_ENV_k2g = "setup-uboot-env-k2g-evm.sh"
 UBOOT_ENV = "setup-uboot-unknown.sh"
-- 
2.7.4


