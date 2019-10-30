Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 29576529F3
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 18:55:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UIs12J106409
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 13:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572461641;
	bh=ayJrZyZzTxaSRxQMhyCkGvWKiifQGz4UsMaijvMqRrc=;
	h=From:To:Subject:Date;
	b=FgYZ9/ObXaTZuHuAUB5mnMhdR4MQKbHZzuIenilXkYnVWt6NQZj/urE0wSkfemRE0
	+JeVYjMD+G2MnN06PF89SWTC/iYgKF8KaGAQ6z/0RiD/sBlB338SpCcnWiDdJXl+ce
	PGP1GwaWyeJuX2gwhL8YgCBl6tndsMQqhI8fWYbo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UIs1Nx078952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 13:54:01 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 13:54:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 13:53:48 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UIs1Nl116939
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 13:54:01 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 14:53:54 -0400
Message-ID: <20191030185354.63767-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH v2] libepoxy: specify x11 as false explicitly when config option x11 not used
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
X-List-Received-Date: Wed, 30 Oct 2019 18:55:22 -0000
Content-Type: text/plain

This is required because the default value of x11 is true if not specified.
Note: This change is already in upstream master/zeus and is only needed
      temporarily in thud.

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


