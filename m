Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0E67E529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:41:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83CfcGL013422
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:41:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfcrE019844
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:41:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:41:37 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhe031656;
	Wed, 3 Sep 2014 07:41:36 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:19 +0530
Message-ID: <1409748091-12617-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 00/12] Enabling WL8 R8.4 on dora
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
X-List-Received-Date: Wed, 03 Sep 2014 12:41:39 -0000
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

 ...synchronization-between-bluetoothd-and-dr.patch |  0
 .../0001-obexd-make-OPP-push-timeout-longer.patch  |  0
 .../packagegroup-arago-tisdk-connectivity.bb       |  4 +-
 .../ti-compat-wireless-wl18xx_r8.a8.10.bb          | 61 ---------------
 .../ti-compat-wireless-wl18xx_r8.a9.14.bb          | 51 ++++++++++++
 ...are_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} |  9 ++-
 ...8.a8.10.bb => hostap-daemon-wl18xx_r8.a9.14.bb} |  7 +-
 .../hostap/hostap-daemon/defconfig                 |  2 +-
 .../recipes-connectivity/hostap/hostap.inc         |  7 +-
 .../wl18xx-target-scripts_r8.a9.14.bb              | 25 ++++++
 .../{wlconf_r8.a8.10.bb => wlconf_r8.a9.14.bb}     |  9 ++-
 ....a8.10.bb => wpa-supplicant-wl18xx_r8.a9.14.bb} |  9 ++-
 .../wpa-supplicant/wpa-supplicant.inc              | 91 ++++++++--------------
 .../wpa-supplicant/wpa-supplicant/defaults-sane    |  8 --
 .../defconfig                                      | 69 ++++++++++++----
 .../fi.epitest.hostap.WPASupplicant.service        |  4 -
 .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |  4 -
 .../wpa-supplicant/p2p_supplicant.conf             |  3 +-
 .../wpa-supplicant/wpa_supplicant.conf             |  3 +-
 ...8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} |  8 +-
 20 files changed, 194 insertions(+), 180 deletions(-)
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
 mode change 100644 => 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
 rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} (72%)
 rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a8.10.bb => hostap-daemon-wl18xx_r8.a9.14.bb} (79%)
 create mode 100644 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
 rename meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a8.10.bb => wlconf_r8.a9.14.bb} (85%)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a8.10.bb => wpa-supplicant-wl18xx_r8.a9.14.bb} (76%)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx => wpa-supplicant}/defconfig (90%)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
 rename meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} (81%)

-- 
2.0.1


