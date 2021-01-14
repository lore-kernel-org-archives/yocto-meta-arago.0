Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 396FF52975
	for <meta-arago@arago-project.org>;
	Thu, 14 Jan 2021 18:59:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EIxXgb020819;
	Thu, 14 Jan 2021 12:59:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610650773;
	bh=+Brf76E6B9TIx/r2m6Z53Tzu08JNSdOujUadnh+CLW4=;
	h=From:To:CC:Subject:Date;
	b=mftUm3oPJGoBBIe2RuN3CYfPwfrqbCc4DKnL8bpd08A5sAzpjoGIJIJ4K8zxHlaDX
	PuRKzFV/MfUYHLD1c831rGVZQr9ty05LVUxEJKTFq/9G+nebTnvJk57Cn+4EO17KdX
	HXS9sxIOymVV99weKwUgKpUqab+6OxJl+oZbXiW0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EIxXFc075822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Jan 2021 12:59:33 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 14 Jan 2021 12:59:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 14 Jan 2021 12:59:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EIxXka069444;
	Thu, 14 Jan 2021 12:59:33 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Jan 2021 12:59:27 -0600
Message-ID: <20210114185927.26817-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master] [PATCH v2] branding: Add branding-core-next to aid in migration
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
X-List-Received-Date: Thu, 14 Jan 2021 18:59:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add a core-next brand branding type to be able to re-direct the recipe
preferred providers or versions to highest PV'd recipe. The
branding-core should indicate the current version to build if not the
highest version.

For the purpose of an example the Arago distribution will be migrating
from the 5.4 kernel to the 5.10 during the 2021 time frame.  In order to
assist with a smoother migration the distribution needs to be able to
build the 5.4 kernel for the core brand and build the 5.10 kernel for
the core-next.

Once the transition from 5.4->5.10 kernel is done then the
PREFERRED_VERSION in the branding-core.inc can be removed.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../conf/distro/include/branding-core-next.inc            | 8 ++++++++
 meta-arago-distro/conf/distro/include/branding-core.inc   | 5 +++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-core-next.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
new file mode 100644
index 000000000000..3828a8d72593
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
@@ -0,0 +1,8 @@
+# Special "migration" branding for testing components that are to be updated in LTS migration
+
+require branding-core.inc
+
+PREFERRED_VERSION_linux-ti-staging = ""
+PREFERRED_VERSION_linux-ti-staging-rt = ""
+PREFERRED_VERSION_linux-ti-staging-systest = ""
+PREFERRED_VERSION_u-boot-ti-staging = ""
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index cab9831be9f9..2e3759ebf4ef 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -11,3 +11,8 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
+
+PREFERRED_VERSION_linux-ti-staging = "5.4%"
+PREFERRED_VERSION_linux-ti-staging-rt = "5.4%"
+PREFERRED_VERSION_linux-ti-staging-systest = "5.4%"
+PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
-- 
2.29.2


