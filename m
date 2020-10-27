Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 77BCF52999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 02:44:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2fEcQ095286
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 21:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603766474;
	bh=2cKB0dcm+G4D5lhuqMYPSY2y2Uo2SOUjh0kkmfis0TA=;
	h=From:To:CC:Subject:Date;
	b=RzVSBht5F7P25cH3SpximhV6YLFmFRzvzbTKjXckf75e4kQtIm9znjo6sVTZYWBNR
	NqlFAVESUPqGQMdpNwVHq6vwRbM17o/KrzmaISDpvdacIq/LxA0tAABwbCanjZ00bV
	m1kSAIi0xWf5Inea/mhv7x+QGLmjhQ4Sh+9Im6+Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2fE3R075795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 21:41:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 26 Oct 2020 21:41:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 26 Oct 2020 21:41:14 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2fDAn082070;
	Mon, 26 Oct 2020 21:41:13 -0500
Received: from localhost ([10.250.64.251])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09R2fDBn015536;
	Mon, 26 Oct 2020 21:41:13 -0500
From: Suman Anna <s-anna@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Date: Mon, 26 Oct 2020 21:41:12 -0500
Message-ID: <20201027024112.5330-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master/dunfell PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add ti-rpmsg-char dev packages
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
X-List-Received-Date: Tue, 27 Oct 2020 02:44:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the ti-rpmsg-char dev packages to make the public headers available in
the target fileystem so that applications can be compiled natively on the
target.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
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


