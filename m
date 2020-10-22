Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id EA5C352999
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2020 16:27:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MGOlta078591
	for <meta-arago@arago-project.org>; Thu, 22 Oct 2020 11:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603383887;
	bh=K9NVR67e228W+ETAs5OIsy/leXsy6AZW+9tBn27rvbE=;
	h=From:To:CC:Subject:Date;
	b=hLA9OsRuC/x5VmSfvCcnRep5LBAlO1InLUDOz4JeiknbV6bqF3FrFjgy6HUzzKT2p
	FgBFffWUmhJNDNE6+/ER87M1L7hnRismP6ltt7Hz/I3xLtFXLgUWLNU/CQqaRufyZG
	zdJPK/K1tu3YLdSSK1WGR+P3W7FPB2s6ZvToC09Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MGOleA011549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Oct 2020 11:24:47 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 22 Oct 2020 11:24:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 22 Oct 2020 11:24:47 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MGOlac065066;
	Thu, 22 Oct 2020 11:24:47 -0500
Received: from localhost ([10.250.39.72])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	09MGOlO1129064; Thu, 22 Oct 2020 11:24:47 -0500
From: Suman Anna <s-anna@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Date: Thu, 22 Oct 2020 11:24:38 -0500
Message-ID: <20201022162438.31072-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master/dunfell][PATCH v2] packagegroup-arago-tisdk-addons: add ti-rpmsg-char for all K3 platforms
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
X-List-Received-Date: Thu, 22 Oct 2020 16:27:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libti_rpmsg_char is a new utility library providing a simple API for
applications wanting to talk to remote processors over the rpmsg_char
Linux kernel driver with virtio-rpmsg back-end transport.

Add this library and examples for all the K3 platforms. It does not
support legacy SoCs at the moment, but this can be adjusted later on
when the support for the same is added to the library.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index e2c3774a287a..adfd45f2af11 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r77"
+PR = "r78"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -72,6 +72,8 @@ UTILS_append_k3 = " mmc-utils \
                     switch-config \
                     irqbalance \
                     jailhouse \
+                    ti-rpmsg-char \
+                    ti-rpmsg-char-examples \
 "
 
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
-- 
2.28.0


