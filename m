Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9FE8E529A4
	for <meta-arago@arago-project.org>;
	Mon, 13 May 2019 21:32:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4DLWEXW121096
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 16:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557783134;
	bh=eaiDOo+iIXSgg66yvDOy7ocyXF02I7AX92L7niqc3uk=;
	h=From:To:Subject:Date;
	b=EziiEiYlU1V2Ta/HGLlD0/RGTQva1x/hDgzhM367bER59CuFjweZW4a7in83YHxZD
	uNNosfaLOxOrqu6+6ESqgvvEF7JkKCFdNX0CnASXgoDR4aCb3OB8R1Ojs/Xal8Fl8d
	i191CVtDbXpoot8IH3O6OuP1+mi+5GVCdykmhlDw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4DLWEWb122490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 16:32:14 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 16:32:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 16:32:13 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4DLWDej023843
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 16:32:13 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 17:32:05 -0400
Message-ID: <20190513213205.45955-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] qtwebkit: disable bmalloc for AM654x
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
X-List-Received-Date: Mon, 13 May 2019 21:32:45 -0000
Content-Type: text/plain

- bmalloc does not support 64k page size yet and therefore should be
  disabled.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 61c099fc..31c929a7 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -8,6 +8,8 @@ SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 "
 
-PR_append = ".arago5"
+PR_append = ".arago6"
+
+EXTRA_OECMAKE_append_k3 = " -DUSE_SYSTEM_MALLOC=ON"
 
 DEPENDS += "flex-native bison-native"
-- 
2.17.1


