Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3CE9A52A2E
	for <meta-arago@arago-project.org>;
	Tue, 16 Apr 2019 17:30:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3GHTc7m024976
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 12:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555435778;
	bh=h945kikR10jQMOVHJJHJuPTISVbUS5kIDpcWyfNR8wI=;
	h=From:To:CC:Subject:Date;
	b=fjjdIMooV/n1l++x8DMOXGdozH15fy1+2qWwLc7rQDhDl8hMluqk6ue/FtiTDD2PV
	0eK84WkQfSeC3ImedTmlBam7PuW60rf9q3fNq+meR3SNdaOw+/xnfH4jBxt6dOcbTK
	9Dit5kzrdo7NH6GxwhqHj4viKfoolstlEInbOkRQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3GHTcFX049635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 12:29:38 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Apr 2019 12:29:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Apr 2019 12:29:37 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3GHTb61116306;
	Tue, 16 Apr 2019 12:29:37 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Apr 2019 13:17:26 -0400
Message-ID: <1555435047-9643-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 1/2] mmwave-ros-pkg-master: fix do_install for upstream changes
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
X-List-Received-Date: Tue, 16 Apr 2019 17:30:01 -0000
Content-Type: text/plain

* Some build outputs have moved, so reflect that in the
  do_install_append().

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
index 179651e..efcf0a9 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-ti-mmwave-rospkg-launch-rviz.patch \
             file://setup.bash \
 "
 
-PR = "r1"
+PR = "r2"
 
 # do not use rpath
 EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
@@ -23,8 +23,8 @@ inherit catkin
 
 do_install_append() {
      install -d  ${D}${ros_libdir}/ti_mmwave_rospkg
-     cp ${WORKDIR}/build/devel/lib/libmmwave.so ${D}${ros_libdir}
-     cp ${WORKDIR}/build/devel/lib/ti_mmwave_rospkg/* ${D}${ros_libdir}/ti_mmwave_rospkg/
+     cp ${WORKDIR}/devel/lib/libmmwave.so ${D}${ros_libdir}
+     cp ${WORKDIR}/devel/lib/ti_mmwave_rospkg/* ${D}${ros_libdir}/ti_mmwave_rospkg/
      cp ${S}/mmWave_nodelets.xml ${D}${ros_datadir}/ti_mmwave_rospkg/
      cp -r ${S}/cfg ${D}${ros_datadir}/ti_mmwave_rospkg/
      cp -r ${S}/launch ${D}${ros_datadir}/ti_mmwave_rospkg/
-- 
2.7.4


