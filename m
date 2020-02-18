Return-Path: <afd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E362B52994
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 16:36:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IGYPKd076523
	for <meta-arago@arago-project.org>; Tue, 18 Feb 2020 10:34:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582043665;
	bh=eIvKtmHjNCSMPhYvi/7/5bTK4q8S1e3VlCSmo+Y68QM=;
	h=From:To:CC:Subject:Date;
	b=FJp2++qlyC15T7HgI0PY+k/1xXNtQICzSXxImjtCfe6XUjLZL1OHeMhj/K/+p5BUN
	1fg/AxozhL61QK+PEHxkNDB9iCY1BqhrLvIYxWO/oTRCAKJvjAdE2nOrcEUJAwGG+J
	eYdhGYvB1JSOddgZP4qe6fwEjpvCqMCSb7m+koh4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IGYPlj043697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Feb 2020 10:34:25 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 18 Feb 2020 10:34:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 18 Feb 2020 10:34:25 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IGYO12081241;
	Tue, 18 Feb 2020 10:34:25 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Tue, 18 Feb 2020 11:34:24 -0500
Message-ID: <20200218163424.16654-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus/master][PATCH] arago.conf: add KMS/DRM backend support to libSDL2
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
X-List-Received-Date: Tue, 18 Feb 2020 16:36:24 -0000
Content-Type: text/plain

In addition to Wayland, SDL2 can run on top of the raw KMS/DRM layer.
This allows for fullscreen SDL2 apps to run without the overhead of
a full window system underneath.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d8e10275..76f7d8f9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -131,6 +131,9 @@ PACKAGECONFIG_append_pn-netperf = " intervals histogram"
 # Use OpenGL ES2 for SDL2
 PACKAGECONFIG_GL_pn-libsdl2 = "gles2"
 
+# Add KMS/DRM backend support
+PACKAGECONFIG_append_pn-libsdl2 = " kmsdrm"
+
 # Enable cryptodev/devcrypto engine in OpenSSL 1.1
 PACKAGECONFIG_append_pn-openssl = " cryptodev-linux"
 
-- 
2.17.1


