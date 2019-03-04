Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 32D8C52976
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 00:03:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25036WV042281
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 18:03:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551744186;
	bh=H/XneH4GxaQhoePX65HQGGEyypVQoTl1rxrgQHazlR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AY1F81ju868QC/qQcZ+68oPn3PA2gLARXqS2QYAQW3ybVhiBAZaVfwswZ88jPVKsF
	zQXWqbrRiKuXa4PjTGrvHI8zRMOOO4r6SIErP/Ogksk+0dFSxRgXwdMeCVFQyvmC6T
	4+AHty3sQCUSdZLe4tTYRDmrML4vB58ZvuC5a87c=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x250360O022639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 18:03:06 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:03:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:03:06 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25034pm002274;
	Mon, 4 Mar 2019 18:03:06 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Mar 2019 13:56:47 -0500
Message-ID: <20190304185648.12035-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304185648.12035-1-x0157990@ti.com>
References: <20190304185648.12035-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH 2/3] [tidl] Add image segmentation examples using pre-recorded clip
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
X-List-Received-Date: Tue, 05 Mar 2019 00:03:13 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 tidl_apps/tidl_demo_segment/desc_tidl_demo_segment.html | 6 ++++++
 tidl_apps/tidl_demo_segment/runTidlSegment.sh           | 5 +++++
 tidl_apps/tidl_demo_segment/tidl_demo_segment.desktop   | 9 +++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 tidl_apps/tidl_demo_segment/desc_tidl_demo_segment.html
 create mode 100644 tidl_apps/tidl_demo_segment/runTidlSegment.sh
 create mode 100644 tidl_apps/tidl_demo_segment/tidl_demo_segment.desktop

diff --git a/tidl_apps/tidl_demo_segment/desc_tidl_demo_segment.html b/tidl_apps/tidl_demo_segment/desc_tidl_demo_segment.html
new file mode 100644
index 0000000..e1a23b0
--- /dev/null
+++ b/tidl_apps/tidl_demo_segment/desc_tidl_demo_segment.html
@@ -0,0 +1,6 @@
+<h1>TIDL Demo with Image Segmentation using 5 classes (CityScapes), 2xEVE+0xDSP</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning image semantic segmentation based on CityScape dataset, based on JSeg21 network topology.</p>
+<p>There are 5 classes recognized: road, pedestrian, road sign, vehicle and the background.</p>
+<p>Both EVE cores are used for processing (frame-based pipeline), using pre-recorded clip.</p>
+<p>This is AM5749 demo only!</p>
diff --git a/tidl_apps/tidl_demo_segment/runTidlSegment.sh b/tidl_apps/tidl_demo_segment/runTidlSegment.sh
new file mode 100644
index 0000000..d83f03d
--- /dev/null
+++ b/tidl_apps/tidl_demo_segment/runTidlSegment.sh
@@ -0,0 +1,5 @@
+cd /usr/share/ti/tidl/examples/segmentation
+if cat /proc/device-tree/model | grep "AM574"
+then
+  ./segmentation -i ./clips/traffic_pixabay_298.mp4 -f 2000 -w 720
+fi
diff --git a/tidl_apps/tidl_demo_segment/tidl_demo_segment.desktop b/tidl_apps/tidl_demo_segment/tidl_demo_segment.desktop
new file mode 100644
index 0000000..85c1fe7
--- /dev/null
+++ b/tidl_apps/tidl_demo_segment/tidl_demo_segment.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=(AM5749 only!) JSeg21 image segmentation using pre-recorded clip (0xDSP+2xEVE)
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-icon.png
+Exec=runTidlSegment.sh
+Type=Application
+ProgramType=gui
+Categories=tidl
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_demo_segment/desc_tidl_demo_segment.html
-- 
2.17.1


