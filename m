Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 45ABE52960
	for <meta-arago@arago-project.org>;
	Fri, 27 Sep 2019 09:16:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R9F2JO087302
	for <meta-arago@arago-project.org>; Fri, 27 Sep 2019 04:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569575702;
	bh=tf/qXUb4EMq787qEG+iWzsmFHSDuMeaqfzFdRtB9FQk=;
	h=From:To:CC:Subject:Date;
	b=b96ZxTZLSWZqrfJwQjBwoUDF7m1bzirWPr967xpyXk/KrOZEQlfGjDUaexsvI2280
	mkq5T2PmZTg4y8sgryfQcJa3oJaUFAm4nAY9rGtqFW0/uoPQ+tB6jNuuwrkZuVZdXx
	xYPuwf6afMSnBWLoDWXVV61OTcOpNasljrUBp6RY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R9F2mn122802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 27 Sep 2019 04:15:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 04:14:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 04:14:54 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R9ExU6108724; 
	Fri, 27 Sep 2019 04:15:00 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Sep 2019 14:44:56 +0530
Message-ID: <1569575696-11975-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v2] arago-source-ipk: Include source for ivshmem-uio module
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
X-List-Received-Date: Fri, 27 Sep 2019 09:16:13 -0000
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Changes from v1:
* Split the recipe for arago-source-ipk separately

 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 9e105b8..970e3e2 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -374,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
 CREATE_SRCIPK_pn-uio-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
+SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
+
 CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
 SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
 
-- 
1.9.1


