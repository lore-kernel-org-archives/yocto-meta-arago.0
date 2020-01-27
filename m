Return-Path: <>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8228452993
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2020 16:27:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RGPFg8072285
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 10:25:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580142315;
	bh=e+2ASH5+HiqAUqfB3bD1Oy94nWEZ7okAZJ0HBv0P0dI=;
	h=From:To:CC:Subject:Date;
	b=Phwz7GVXRjhHc9VgW6gxCL3nCZyET+EW8EEND4/LdOd7UePbckcwsY6CW6W2Ud+S6
	yC+WnJ3xN15YApnfQeIrj/P1xLQeKtc9j9vRJDaPeAqbKGQP7mlE4vWtdQGIgBz/a+
	o4RN7Ft5+1YFL0uk6L0poNwKPeVwmYyVzdygbzic=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RGPFbr037906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 10:25:15 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 27 Jan 2020 10:25:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 27 Jan 2020 10:25:15 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RGPFXW099817;
	Mon, 27 Jan 2020 10:25:15 -0600
Received: from localhost ([10.250.70.160])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	00RGPE316170; Mon, 27 Jan 2020 10:25:14 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 27 Jan 2020 11:25:12 -0500
Message-ID: <20200127162512.24772-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master/thud][PATCH] arago.conf: Use OpenGL ES2 rendering with SDL2
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
X-List-Received-Date: Mon, 27 Jan 2020 16:27:06 -0000
Content-Type: text/plain

When the SDL2 recipe detects "opengl" as a distro feature it selects
desktop OpenGL, although we advertise "opengl" as a feature we only
actually support the embedded standard ES. This causes a build failure
on libsdl2 for our platforms. Specify the correct GL standard.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e7c274a1..99ba36f8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -128,6 +128,9 @@ PACKAGECONFIG_append_pn-open62541 = " encrypt"
 # Enable netperf intervals/pacing and histogram
 PACKAGECONFIG_append_pn-netperf = "intervals histogram"
 
+# Use OpenGL ES2 for SDL2
+PACKAGECONFIG_GL_pn-libsdl2 = "gles2"
+
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE = "arago-tiny-image"
 
-- 
2.17.1


