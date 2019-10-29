Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1A920529D3
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 13:56:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TDtRYS098946
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572357327;
	bh=zecsJNJ61zDnbq4wJn/+fQ7RUGk/d8JiWhRWu3g9l1k=;
	h=From:To:Subject:Date;
	b=zWv2LjQCtmJ+zGpj2lomlkpmV1cbaXB3Ug/KvTK5EiWHSUFq95GFRiBXR+8G+sTcx
	y9m6PbyBgZH2L7tZ7vgb7uWMNSdZA+j2TjQJBBMdhJEjgEpgpCVYDV0/EnXaEpXCjo
	flWxB21TyUTjrEoOs5+SVF/641xfJYub3GL2OTUs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TDtQbj068784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:55:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 08:55:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 08:55:14 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TDtQom051734
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:55:26 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Oct 2019 09:55:21 -0400
Message-ID: <20191029135521.42434-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] libepoxy: specify x11 as false explicitly when config option x11 not used
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
X-List-Received-Date: Tue, 29 Oct 2019 13:56:47 -0000
Content-Type: text/plain

This is required because the default value of x11 is true if not specified.

Upstream Status: Accepted
glneo authored and rpurdie committed Sep 13, 2019

Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-graphics/libepoxy/libepoxy_%.bbappend              | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100755 meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
new file mode 100755
index 00000000..15c373cd
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".arago0"
+
+PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
-- 
2.17.1


