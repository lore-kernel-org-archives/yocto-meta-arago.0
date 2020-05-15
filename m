Return-Path: <a0389345@swubn03>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D6A8C52979
	for <meta-arago@arago-project.org>;
	Fri, 15 May 2020 18:47:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FIimO9038267
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 13:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589568288;
	bh=3y/fhOug1SlcDGkTFxW5IQqqtXteJI/ofUEgpd+o75g=;
	h=From:To:CC:Subject:Date;
	b=cjvb9VT8xoiK/ln7Mpco35xSG4Rrf7uJsVjEZXC92ZrwD/PaVPIPw8WYHMR/Qxh4g
	2Jw/UDPQaOpLmrvgNsJWCqI0BWBVxo17Jot5svoq/f1Lcho7c/Zuqzfbm3ym3KLwFz
	XMAmRdqtEYF2ut4LdVC1ZS/TlUJ/QyThLhIxIAc0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04FIimRf103063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 15 May 2020 13:44:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 15 May 2020 13:44:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 15 May 2020 13:44:48 -0500
Received: from swubn03 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FIilQ6064079;
	Fri, 15 May 2020 13:44:48 -0500
Received: from a0389345 by swubn03 with local (Exim 4.90_1)
	(envelope-from <a0389345@swubn03>)
	id 1jZfKB-00017c-2L; Sat, 16 May 2020 00:14:47 +0530
From: <prao@ti.com>
To: <denys@ti.com>
Date: Sat, 16 May 2020 00:14:39 +0530
Message-ID: <20200515184439.3339-1-prao@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Praveen Rao <prao@ti.com>
Subject: [dunfell/master PATCH] packagegroup: Add ti-sci-fw-src to tisdk-addons-sdk-host
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
X-List-Received-Date: Fri, 15 May 2020 18:47:15 -0000
Content-Type: text/plain

From: Praveen Rao <prao@ti.com>

Add source package for k3 image gen in the tisdk-addons-sdk-host

Signed-off-by: Praveen Rao <prao@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 6dcb253c..32d6c98b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -38,6 +38,7 @@ UTILS_append_k2g = " \
 
 UTILS_append_k3 = " \
     jailhouse-src \
+    ti-sci-fw-src \
     arm-trusted-firmware-src \
 "
 
-- 
2.17.1


