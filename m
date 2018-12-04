Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6989452092
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 20:25:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4KPdpb002042
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 14:25:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543955139;
	bh=zoNPQgkO27P3c6cq5+d64mFbVLmCtssvEt8VbCY0pjM=;
	h=From:To:CC:Subject:Date;
	b=K3NEzr74xfMelIiiGgWVIFT9J40EkILq6qKfgyu93JCetz8X5iaWDeFJ391Vf+ISp
	r1lkkrJ1z+l2YhzI01d7Xhqo5IruqaBKmgbdMWs9xigckt9J2/WCqb9OtmW4vWJ3ck
	vxTJFfXUYWEmWo9sbnPcUKVZQMDql+62YNXl1+ak=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4KPd43114369
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 14:25:39 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 14:25:39 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 14:25:39 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4KPaEn010056;
	Tue, 4 Dec 2018 14:25:37 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Dec 2018 15:25:34 -0500
Message-ID: <1543955134-1464-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH v2] matrix-gui: update matrix-gui-2.0.service
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
X-List-Received-Date: Tue, 04 Dec 2018 20:25:56 -0000
Content-Type: text/plain

* Add "Requires=weston.service" to make matrix-gui start only after
  weston has successfully started

* Match matrix-gui-2.0.service with SysVinit auto-generated service
  to ensure reliable matrxi-gui startup from booting

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
V2 change:
  Remove "Before=thermal-zone-init.service" per the review

 .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service         | 8 ++++++++
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb           | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
index 3ce1024..40a8f0f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
@@ -1,9 +1,17 @@
 [Unit]
 Description=Matrix GUI
 After=weston.service
+Requires=weston.service
+Before=graphical.target
 
 [Service]
 Type=forking
+Restart=no
+TimeoutSec=5min
+IgnoreSIGPIPE=no
+KillMode=process
+GuessMainPID=no
+RemainAfterExit=yes
 ExecStart=/etc/init.d/matrix-gui-2.0 start
 
 [Install]
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index c79f13e..064e27d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r36"
+PR = "r37"
 
 SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
 
-- 
1.9.1


