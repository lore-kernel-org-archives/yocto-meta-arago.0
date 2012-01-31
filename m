Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 063FF52A40
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 20:12:02 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0VKBx50003691
	for <meta-arago@arago-project.org>; Tue, 31 Jan 2012 14:12:00 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKBxvh026002
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2012 01:41:59 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 1 Feb 2012 01:41:59 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKBvAU025974;
	Wed, 1 Feb 2012 01:41:58 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Jan 2012 14:11:50 -0600
Message-ID: <1328040714-29036-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Move matrix to meta-arago
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
X-List-Received-Date: Tue, 31 Jan 2012 20:12:06 -0000
Content-Type: text/plain

This patch series adds the latest matrix recipes from the
old arago overlay while adjusting them for the oe-core
differences.  The dependencies were also updated in this
patch set.

Chase Maupin (4):
  matrix-gui-browser: port from old arago overlay
  refresh-screen: add package from old arago overlay
  matrix-lighttpd-config: enable matrix in lighttpd
  matrix-gui: update to latest version

 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb |   22 +
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |   10 +
 .../matrix/matrix-gui-apps-images_2.0.bb           |   20 +
 .../recipes-core/matrix/matrix-gui-apps.inc        |   40 +
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |   17 +
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |   24 +
 .../matrix/matrix-gui-camera-loopback_2.0.bb       |   18 +
 .../recipes-core/matrix/matrix-gui-clocks_2.0.bb   |   32 +
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |   17 +
 .../matrix/matrix-gui-display-control_2.0.bb       |   18 +
 .../matrix/matrix-gui-multimedia-demos_2.0.bb      |   17 +
 .../matrix/matrix-gui-oprofile-demos_2.0.bb        |   19 +
 .../recipes-core/matrix/matrix-gui-paths.inc       |    3 +
 .../recipes-core/matrix/matrix-gui-pm-demos_2.0.bb |   17 +
 .../matrix/matrix-gui-pru-demos_2.0.bb             |   17 +
 .../matrix/matrix-gui-qt4-demos_2.0.bb             |   17 +
 .../matrix/matrix-gui-settings-demos_2.0.bb        |   17 +
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |   50 +
 .../matrix/matrix-gui-usb-demos_2.0.bb             |   17 +
 .../matrix/matrix-gui-v4l2-demos_2.0.bb            |   17 +
 .../matrix/matrix-gui-wifi-demos_2.0.bb            |   17 +
 .../recipes-core/matrix/matrix-gui/init            |   87 ++
 .../recipes-core/matrix/matrix-gui/php.ini         | 1342 ++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui_2.0.bb          |   61 +
 .../recipes-core/matrix/matrix-lighttpd-config.bb  |   26 +
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |  341 +++++
 .../recipes-core/matrix/refresh-screen_2.0.bb      |   25 +
 27 files changed, 2308 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-paths.inc
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/init
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
 create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb


