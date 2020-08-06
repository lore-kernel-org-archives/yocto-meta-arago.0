Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2DC9B52970
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2020 12:00:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076BvoEt069473
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2020 06:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596715070;
	bh=mzaUYi2f4wTVreIE0fJZIO/Xo8WisO3DnUpBfWs5USM=;
	h=From:To:CC:Subject:Date;
	b=C8+DBJH9B2OfsbbWbd0ptEHTydMTe1P6tEs0gJr7895Nh9LfUwa7FBPgztFp8RyJI
	kEtUnFqkkxylKyCORrQxV/vRyzYW/4V5rmnXgBlpKZNpeMiYaaVEySttZvnD/HrjBx
	P+SsU6AiXJbEymTmZPzFfmrlYJwa+p1JPiWWnyEU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 076BvonW045263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Aug 2020 06:57:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 6 Aug 2020 06:57:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 6 Aug 2020 06:57:49 -0500
Received: from lta0271916c.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076BvnOQ092397;
	Thu, 6 Aug 2020 06:57:49 -0500
From: <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Thu, 6 Aug 2020 06:57:46 -0500
Message-ID: <20200806115746.6292-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.16.2.windows.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] wayland-ivi-extension: Fix patch file name
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
X-List-Received-Date: Thu, 06 Aug 2020 12:00:36 -0000
Content-Type: text/plain

From: Gowtham Tammana <g-tammana@ti.com>

During the upate to weston-8, one of the patch file name was changed but
the corresponding change in the append was missing. Fixing it.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
index 0b20b91b..a172c1bf 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
@@ -10,7 +10,7 @@ SRCREV = "e9c2fe4c5034a06b159cfd45dbd485755cbaf4c8"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
            file://01-ivi-input-controller-update-to-weston-7.patch \
            file://02-ivi-id-agent-update-to-weston-7-header.patch \
-           file://03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch \
+           file://03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch \
     "
 
 S = "${WORKDIR}/git"
@@ -27,7 +27,7 @@ FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
 
 EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-PR = "r0"
+PR = "r1"
 
 # Need these temporarily to prevent a non-fatal do_package_qa issue
 INSANE_SKIP_${PN} += "dev-deps"
-- 
2.17.1


