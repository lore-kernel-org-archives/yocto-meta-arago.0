Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9FA6B529A6
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2018 13:51:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAEDp6nJ100820
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:51:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542203466;
	bh=5trVTcut2hS4FXwPrW6hXgiKMACcvpFOsp3dRtpdddE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=njI9yxjgebeP4FzQ7tUvlqS4hWIBm3Ww8ZgdBTKEEfjeCoI0fn2aQr17hJi/qTRU6
	MqaMAFurdE4UWdQJTXoZlivpNeNTX+IKVismw4aTPiMQ/9I1Yxt7czb7i6X7PM3iff
	BbuaVjxuZnT2VRiRkvYwGd7pv0LHG1gDfqQGDvdk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAEDp6sl072630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:51:06 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 14 Nov 2018 07:51:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 14 Nov 2018 07:51:06 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAEDp5pU012952
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 07:51:06 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Nov 2018 08:50:41 -0500
Message-ID: <1542203441-24961-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1542203441-24961-1-git-send-email-e-ruei1@ti.com>
References: <1542203441-24961-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 2/2] Revert "recipes-apps : add evse-hmi demo"
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
X-List-Received-Date: Wed, 14 Nov 2018 13:51:17 -0000
Content-Type: text/plain

This reverts commit ea36050ee38e8e14a9fde113b50afa8ec83d482e.
To be deleted from meta-processor-sdk. The same has been upstreamed
already.
---
 recipes-apps/evse-hmi/evse-hmi_git.bb | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb

diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
deleted file mode 100755
index 1bb66f5..0000000
--- a/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
-
-inherit qt-provider
-
-PV = "1.0"
-PR = "r0"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
-
-SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
-
-S = "${WORKDIR}/git"
-
-CREATE_SRCIPK = "1"                                                                               
-SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 evse_hmi ${D}${bindir}
-}
-- 
1.9.1


