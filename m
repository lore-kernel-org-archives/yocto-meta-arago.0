Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0885352993
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2019 20:35:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4AKYZAk073413
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 15:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557520475;
	bh=4wtLQRiDnaxec35NZ3N9+o8Gxe/v2ic5RxSLlpF5YsE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VASK51VzeJrumweIbRyqHMJpkjaiIhW9eiH9yJMkKeAaU6F3tu+YrNOjzeJ1/IHKm
	BRvL5iYBJgwK3fxliE0dYVQK28s9nVWEvES6uikVkbHq2qIX7+5Nh/lj3J/EzPlLu3
	SBpiMMIZMrOVho7N8fggSSDln/i3sHVjitC07U4Q=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4AKYZTH015494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 15:34:35 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 10 May 2019 15:34:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 10 May 2019 15:34:35 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4AKYYen045482
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 15:34:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 May 2019 16:34:23 -0400
Message-ID: <20190510203423.35367-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510203423.35367-1-e-ruei1@ti.com>
References: <20190510203423.35367-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] qtbase: fix the install path of qt5/examples symbolic link
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
X-List-Received-Date: Fri, 10 May 2019 20:35:05 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 90d04014..6056b9e5 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,7 +4,7 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = ".arago15"
+PR_append = ".arago16"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -38,6 +38,7 @@ do_install_append () {
     ln -sf ../examples ${D}${datadir}/qt5/examples
 }
 
-FILES_${PN} += "${data}/qt5/*"
+FILES_${PN}-examples +=  "${datadir}/qt5/*"
+
 
 RDEPENDS_${PN} += "${PN}-conf"
-- 
2.17.1


