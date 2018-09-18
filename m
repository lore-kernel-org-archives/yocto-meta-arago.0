Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7D1FB52A02
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDjjB078827
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301625;
	bh=oEFoHazEA0C+J0730z75ZD3N6QjJYwJId2FXhXIiDfY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q5cLXaKsuPBsEY23UrNJPz9HsDgz8BlheNH/pDmR7BJn+rVYK2w8rBscpqVMejDcc
	/Xsi7EWY90Pb5Sw+5MkcM7d2G3Y5YL46y1VdCMuPp8osusQQVJUraMO33eqqAPWcHW
	TnBsb/z1IZ9nwk96VM0aNqy9ihx//t1QCIt7I57o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDj8n003541
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDit6002786;
	Tue, 18 Sep 2018 15:13:44 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:36 -0400
Message-ID: <1537301622-8988-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/7] mmwave-ros-pkg-master: version update and add setup.bash
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
X-List-Received-Date: Tue, 18 Sep 2018 20:13:54 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ros/ros-mmwave/files/setup.bash                |  9 +++++++++
 ...-master_0.1.0.bb => mmwave-ros-pkg-master_2.5.1.bb} | 18 ++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)
 create mode 100644 recipes-ros/ros-mmwave/files/setup.bash
 rename recipes-ros/ros-mmwave/{mmwave-ros-pkg-master_0.1.0.bb => mmwave-ros-pkg-master_2.5.1.bb} (69%)

diff --git a/recipes-ros/ros-mmwave/files/setup.bash b/recipes-ros/ros-mmwave/files/setup.bash
new file mode 100644
index 0000000..ead7a36
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/setup.bash
@@ -0,0 +1,9 @@
+export ROS_ROOT=/opt/ros/indigo
+export PATH=$PATH:/opt/ros/indigo/bin
+export LD_LIBRARY_PATH=/opt/ros/indigo/lib
+export PYTHONPATH=/usr/lib/python3.5/site-packages:/opt/ros/indigo/lib/python3.5/site-packages
+export ROS_MASTER_URI=http://$SITARA_IP_ADDR:11311
+export ROS_IP=$SITARA_IP_ADDR
+export CMAKE_PREFIX_PATH=/opt/ros/indigo
+export ROS_PACKAGE_PATH=/opt/ros/indigo/share
+touch /opt/ros/indigo/.catkin
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_2.5.1.bb
similarity index 69%
rename from recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb
rename to recipes-ros/ros-mmwave/mmwave-ros-pkg-master_2.5.1.bb
index 9a984f5..143dd78 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_2.5.1.bb
@@ -2,12 +2,16 @@ DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
 SECTION = "devel"
 LICENSE = "BSD"
 
-LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=da4f1cae75b0590538edcb7e23a325d8"
-SRC_URI[base.md5sum] = "e85370690db8652d9d706aa77facce6a"
-SRC_URI[base.sha256sum] = "1c88f501f5e9827299b8172d5895e54cb0178a65879f1d1092761cfe0e48bae4"
-SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_1_1/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p2p1.zip;name=base;subdir=${P}"
-SRC_URI += "file://append_launch"
-SRC_URI += "file://append_cfg"
+LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=2f41c03cb07673fdbb8bc449e1d179ae"
+SRC_URI[base.md5sum] = "58594aee8e222ff7b259067ad7da0094"
+SRC_URI[base.sha256sum] = "06a93099e85ef47ad70f96db86a0601ace59512d8cc5c5ea0609285c1497dca1"
+SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p4.zip;name=base;subdir=${P}"
+SRC_URI += "file://append_launch \
+            file://append_cfg \
+            file://setup.bash \
+"
+
+PR = "r0"
 
 # do not use rpath
 EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
@@ -27,8 +31,10 @@ do_install_append() {
      cp -r ${S}/launch ${D}${ros_datadir}/ti_mmwave_rospkg/
      cp  ${WORKDIR}/append_launch/*.launch  ${D}${ros_datadir}/ti_mmwave_rospkg/launch/.
      cp  ${WORKDIR}/append_cfg/*.bt  ${D}${ros_datadir}/ti_mmwave_rospkg/cfg/.
+     cp ${WORKDIR}/setup.bash ${D}${ros_prefix}
 }
 
 FILES_${PN} += "${ros_libdir}/ti_mmwave_rospkg"
+FILES_${PN} += "${ros_prefix}/setup.bash"
 
 ROS_SPN = "ti_mmwave_rospkg"
-- 
1.9.1


