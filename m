Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 954665298A
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 19:35:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4JZeZC000898
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 13:35:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543952140;
	bh=FL72/3zuxoYoilpb2pKx9Xs7dcEsYbjDQEUpMX7qKjM=;
	h=From:To:CC:Subject:Date;
	b=KF+Sol8w7e5PxYH/F5uupmRu+S4znm4jFjBG8Ldpa56KY0+BKYmisM/xQfyyBNMRA
	vUEd2dQV1Ky8WJhEmv8bRAH9AxB/xffuEI2gAGKcDM0sNiW/HJDVA1Z2gesP7NNo1+
	DueGvnkt+njITom7c6visB044Ffhhe03eSNX2Aes=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4JZeog125368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 13:35:40 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 13:35:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 13:35:40 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4JZdP8031140;
	Tue, 4 Dec 2018 13:35:40 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Dec 2018 14:35:38 -0500
Message-ID: <1543952138-1375-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH] matrix-gui: update matrix-gui-2.0.service
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
X-List-Received-Date: Tue, 04 Dec 2018 19:35:52 -0000
Content-Type: text/plain

* Add "Requires=weston.service" to make matrix-gui start only after
  weston has successfully started

* Match matrix-gui-2.0.service with SysVinit auto-generated service
  to ensure reliable matrxi-gui startup from booting

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service        | 9 +++++++++
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb          | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
index 3ce1024..cd87d8b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
@@ -1,9 +1,18 @@
 [Unit]
 Description=Matrix GUI
 After=weston.service
+Requires=weston.service
+Before=graphical.target
+Before=thermal-zone-init.service
 
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


