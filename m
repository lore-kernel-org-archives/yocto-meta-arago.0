Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E2C4A52A26
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:54:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AstTQ019847
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:54:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AstCi031860
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:54:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:54:55 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZC026077;
	Tue, 2 Sep 2014 05:54:54 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:31 +0530
Message-ID: <1409655283-4899-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Subject: [PATCH 00/12] Enabling WL8 R8.4 on dora
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:57 -0000
Content-Type: text/plain

This patch set contains the set of patches that are required to
get the latest Wilink firmware on the dora branch.
Most of the patches here are cherry picked from the master 
branch. A few of them needed minor rework.

Note that this has been tested on the GLSDK 6.10 release line for
dra7xx-evm as the target.

Denys Dmytriyenko (4):
  wl18xx-firmware: specify the branch being used for this version
  hostap-daemon: specify the branch being used for this version
  wpa-supplicant: specify the branch being used for this version
  recipes-connectivity: remove remaining unnecessary exec permissions

Yaniv Machani (8):
  wpa-supplicant-wl18xx: Update recipe to ol_r8.a9.14 version.
  hostap-daemon-wl18xx: Update recipe to ol_r8.a9.14 version
  wl18xx : update to ol_r8.a9.14
  Wl18xx : recipes update - tag changed to ol_r8.a9.14
  wl18xx-target-scripts : Add new WiFi related scripts
  wl18xx-compat: version update
  wl18xx-wlconf: version update
  wpa-supplicant-wl18xx: configuration files update

 ...synchronization-between-bluetoothd-and-dr.patch |   0
 .../0001-obexd-make-OPP-push-timeout-longer.patch  |   0
 .../packagegroup-arago-tisdk-connectivity.bb       |   4 +-
 .../ti-compat-wireless-wl18xx_r8.a8.10.bb          |  61 ---
 .../ti-compat-wireless-wl18xx_r8.a9.14.bb          |  51 ++
 .../wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb    |  30 --
 .../wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb    |  31 ++
 .../hostap/hostap-daemon-wl18xx_r8.a8.10.bb        |  23 -
 .../hostap/hostap-daemon-wl18xx_r8.a9.14.bb        |  24 +
 .../hostap/hostap-daemon/defconfig                 |   2 +-
 .../recipes-connectivity/hostap/hostap.inc         |   7 +-
 .../wl18xx-target-scripts_r8.a9.14.bb              |  25 +
 .../recipes-connectivity/wlconf/wlconf_r8.a8.10.bb |  41 --
 .../recipes-connectivity/wlconf/wlconf_r8.a9.14.bb |  42 ++
 .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig | 506 -------------------
 .../wpa-supplicant-wl18xx_r8.a8.10.bb              |  24 -
 .../wpa-supplicant-wl18xx_r8.a9.14.bb              |  25 +
 .../wpa-supplicant/wpa-supplicant.inc              |  91 ++--
 .../wpa-supplicant/wpa-supplicant/defaults-sane    |   8 -
 .../wpa-supplicant/wpa-supplicant/defconfig        | 543 +++++++++++++++++++++
 .../fi.epitest.hostap.WPASupplicant.service        |   4 -
 .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |   4 -
 .../wpa-supplicant/p2p_supplicant.conf             |   3 +-
 .../wpa-supplicant/wpa_supplicant.conf             |   3 +-
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb |  31 --
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb |  31 ++
 26 files changed, 814 insertions(+), 800 deletions(-)
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
 mode change 100644 => 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
 delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx/defconfig
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a9.14.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
 create mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb

-- 
2.0.1


