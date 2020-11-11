Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A383C52985
	for <meta-arago@arago-project.org>;
	Wed, 11 Nov 2020 15:10:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABF7NX4113921;
	Wed, 11 Nov 2020 09:07:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605107243;
	bh=Gk973tdTknxHtFMpLqcbgY7KGTUSCHjLmS7a4KpOesI=;
	h=From:To:CC:Subject:Date;
	b=XIrvEMb44+dJDe4N8cAB0Z/UGzWoTWIvtoZRVGJjGB9khE4xvcEhM5Xj2Imf/6awb
	kxGK9uvBPgFq396Yradglv4cDNJEypsb6Q37l4fJGvvJ3JDBfX1TqDogvf8l2xJgSk
	92A45GvSrOIWd47tGlt4Iqn2fkssHb2AuLUMFLv4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABF7MdP066332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2020 09:07:22 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 11 Nov 2020 09:07:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 11 Nov 2020 09:07:22 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABF7Mx6115926;
	Wed, 11 Nov 2020 09:07:22 -0600
Received: from localhost ([10.250.38.244])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 0ABF7Ma4009492;
	Wed, 11 Nov 2020 09:07:22 -0600
From: Suman Anna <s-anna@ti.com>
To: Dan Murphy <dmurphy@ti.com>, Denys Dmytriyenko <denis@denix.org>
Date: Wed, 11 Nov 2020 09:07:10 -0600
Message-ID: <20201111150710.18138-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master/dunfell PATCH v2] packagegroup-arago-tisdk-addons-sdk-target: Add ti-rpmsg-char dev packages
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
X-List-Received-Date: Wed, 11 Nov 2020 15:10:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the ti-rpmsg-char dev packages to make the public headers available in
the target sysroot in the devkit so that applications can cross-compile
against these on the host.

Signed-off-by: Suman Anna <s-anna@ti.com>
Tested-by: Lucas Weaver <l-weaver@ti.com>
---
v2: Update patch description, no code changes

 .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index e372dd67744e..b55c79a4d4df 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r43"
+PR = "r44"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -143,7 +143,11 @@ UTILS_append_dra7xx = " can-utils-dev \
                         elfutils-staticdev \
 "
 UTILS_append_k2g = " can-utils-dev"
-UTILS_append_k3 = " can-utils-dev"
+UTILS_append_k3 = "\
+	can-utils-dev \
+	ti-rpmsg-char-dev \
+	ti-rpmsg-char-staticdev \
+"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_ti43x = "\
-- 
2.28.0


