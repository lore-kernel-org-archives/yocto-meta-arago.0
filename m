Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id B5A1352AF7
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:03:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I44tr107461;
	Fri, 9 Jul 2021 13:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853844;
	bh=F9OGk2ewZZxPplHDXfMbt0wpe1u4IdY46mJh37vi+Yo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rkR604wws4kPmS9xk9dIKnNz1T9Rnb2fx1X8kW29iXqm5D+WZ0dxafs7MAxIzBX6v
	hyWhqSdpbZCkvTwvqc+m4eBDTR5KmEZDnelYNa0eovcPTbWUT3lc1wFxY2AP7h9V3W
	i536+pX3+nTOrEOCoJsKnm2+/eAU0FdvShMZ6wxI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I44Q3104497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I44su128614;
	Fri, 9 Jul 2021 13:04:04 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:04:01 -0500
Message-ID: <20210709180401.2977-6-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709180401.2977-1-nm@ti.com>
References: <20210709180401.2977-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH 5/5] config-build-env: Switch arago-project git repo to ti git repo
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
X-List-Received-Date: Fri, 09 Jul 2021 18:04:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Arago-project is on the way down, so flip over to git.ti.com repo

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/config-build-env | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index cdfa6830eb51..2514acbe6b38 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -1,6 +1,6 @@
 #!/bin/bash
 
-TI_SDK_OELAYER_SETUP="http://arago-project.org/git/projects/oe-layersetup.git"
+TI_SDK_OELAYER_SETUP="http://git.ti.com/git/arago-project/oe-layersetup.git"
 
 # This script is intended to be called only from the top-level build-oesdk.sh
 # script which parses the configuration file and sets necessary variables.
-- 
2.32.0


