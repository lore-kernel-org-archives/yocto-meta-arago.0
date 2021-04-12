Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id ECBE452C4D
	for <meta-arago@arago-project.org>;
	Mon, 12 Apr 2021 03:45:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13C3jeen078834;
	Sun, 11 Apr 2021 22:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618199140;
	bh=sYMwU65pYER9HTdcmOW96TytE8k4Iz5HIGX00fpS3rw=;
	h=From:To:CC:Subject:Date;
	b=meK6RclyzD8ZvNUEetbTgWC0s4qlcFMbIP9fXNB7ly+uhIabw0pLrdclzPeFzPEsn
	8fgK/K54JHAu2CcM0jJ2gIbHzVF0MLfj7o2+U2AT+cv7u3ka9AIsxM5hShI/dYZdnN
	ue7XzWjqYBfm8I+IfONbyBMBfoxtKxp9+n+tZGHo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13C3jexO028686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Apr 2021 22:45:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Sun, 11 Apr 2021 22:45:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Sun, 11 Apr 2021 22:45:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13C3jee3046188;
	Sun, 11 Apr 2021 22:45:40 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Sun, 11 Apr 2021 22:45:40 -0500
Message-ID: <20210412034540.18980-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master PATCH] branding-core: Remove PREFERRED_VERSION to pick 2021LTS baseline
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
X-List-Received-Date: Mon, 12 Apr 2021 03:45:17 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit 400d58becfb5 ("branding: Add branding-core-next to aid in migration")
added support of PREFERRED_VERSION as 2020LTS kernel and uboot for branding core.

Now that migration to 2021LTS (i.e 5.10 kernel and 2021.01 u-boot) is added,
removing the PREFERRED_VERSION so that core brand picks the expected
kernel and uboot baseline.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 10853d8b..3d259d2d 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -12,10 +12,5 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 
-PREFERRED_VERSION_linux-ti-staging = "5.4%"
-PREFERRED_VERSION_linux-ti-staging-rt = "5.4%"
-PREFERRED_VERSION_linux-ti-staging-systest = "5.4%"
-PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
-
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
 MACHINE_FEATURES_remove = "mmip"
-- 
2.17.1


