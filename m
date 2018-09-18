Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 72248529E6
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDjR8078819
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301625;
	bh=eqyC1SlvECCDP5KUxkui43RTfIygkb6xAU0PWrqCEsY=;
	h=From:To:CC:Subject:Date;
	b=PMYxfrIge6HWfW8khNWUtfFFO1bLsNOp1Qi+Kt1+MMsCAHDaYFfJah5DREPNIljsf
	zE0O5siCNsWUvYyXrK3dP2vUKOgGWxVBkCxBAVygpCP+V92QnbZuHVcvNyU1+Fbf5P
	hRIReVi1qI3xrnC8627b/rX/zyWiBw1uuSMTOE6k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDiFf003538
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDit5002786;
	Tue, 18 Sep 2018 15:13:44 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:35 -0400
Message-ID: <1537301622-8988-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 0/7] Add ROS navigation demo with obstacle avoidance
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

The major changes include:
* Update mmwave-ros-pkg-master to version 2.5.1
* Add hector-trajectory-server and its dependent packages
* Add patches for rotate-recovery and move-base
* Add mmwave-ros-autonomous-robotics package

Hongmei Gou (7):
  mmwave-ros-pkg-master: version update and add setup.bash
  hector*: add hector-trajectory-server and its dependent packages
  packagegroup-ros-world: add hector* packages
  rotate-recovery: add patch for ROS navigation demo
  move-base: add patch for ROS navigation demo
  mmwave-ros-autonomous-robotics: added for ROS navigation demo with
    obstacle avoidance
  packagegroup-ros-ti: add mmwave-ros-autonomous-robotics demo

 .../hector-map-tools_0.3.5.bb}                     |  34 +----
 .../hector-nav-msgs_0.3.5.bb}                      |  34 +----
 .../hector-trajectory-server_0.3.5.bb}             |  35 +----
 ...navigation-rotate-recovery-mmwave-changes.patch |  88 ++++++++++++
 .../0002-navigation-move-base-mmwave-changes.patch |  22 +++
 .../move-base_1.12.14.bbappend}                    |  13 +-
 .../rotate-recovery_1.12.14.bbappend}              |  13 +-
 recipes-ros/packagegroups/packagegroup-ros-ti.bb   |   3 +
 ...p-ros-ti.bb => packagegroup-ros-world.bbappend} |  15 +-
 ...-turtlebot-bringup-description-launch-xml.patch |  12 ++
 ...e-launchers-navigation-visualization-rviz.patch | 151 +++++++++++++++++++++
 ...-turtlebot-navigation-costmap-params-yaml.patch |  22 +++
 .../0002-turtlebot-bringup-minimal-launch.patch    |  26 ++++
 recipes-ros/ros-mmwave/files/setup.bash            |   9 ++
 ....bb => mmwave-ros-autonomous-robotics_2.5.1.bb} |  63 ++++++---
 ...ter_0.1.0.bb => mmwave-ros-pkg-master_2.5.1.bb} |  18 ++-
 16 files changed, 411 insertions(+), 147 deletions(-)
 copy recipes-ros/{ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb => hector-slam/hector-map-tools_0.3.5.bb} (2%)
 copy recipes-ros/{ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb => hector-slam/hector-nav-msgs_0.3.5.bb} (2%)
 copy recipes-ros/{ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb => hector-slam/hector-trajectory-server_0.3.5.bb} (2%)
 create mode 100644 recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
 create mode 100644 recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
 copy recipes-ros/{packagegroups/packagegroup-ros-ti.bb => navigation/move-base_1.12.14.bbappend} (1%)
 copy recipes-ros/{packagegroups/packagegroup-ros-ti.bb => navigation/rotate-recovery_1.12.14.bbappend} (1%)
 copy recipes-ros/packagegroups/{packagegroup-ros-ti.bb => packagegroup-ros-world.bbappend} (1%)
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-bringup-description-launch-xml.patch
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
 create mode 100644 recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
 create mode 100644 recipes-ros/ros-mmwave/files/setup.bash
 copy recipes-ros/ros-mmwave/{mmwave-ros-pkg-master_0.1.0.bb => mmwave-ros-autonomous-robotics_2.5.1.bb} (5%)
 rename recipes-ros/ros-mmwave/{mmwave-ros-pkg-master_0.1.0.bb => mmwave-ros-pkg-master_2.5.1.bb} (69%)

-- 
1.9.1


