Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2AF4652A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:58:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99NwwBc027435
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:58:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nwwas016234
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:58:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:58:58 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99NwvDX028275	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:58:57 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0veVn013663	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:40 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0veVI013662	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:40 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:27 +0100
Message-ID: <1381366658-13630-1-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/11] meta-arago-extras - Add wilink8 r8.a7.02
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
X-List-Received-Date: Wed, 09 Oct 2013 23:58:59 -0000
Content-Type: text/plain

This patchset adds recipes for Wilink8 version r8.a7.02.

Whilst this version is suitable for all platforms using wilink8, it is initially enabled for omap-a15 only targets, using k3.8 based kernels, as used by GLSDK for omap5-uevm and dra7xx-evm.

This patchset adds the following :-

   * compat-wireless drivers (for k3.8) kernel
   * wlan firmware (including workaround fixes required in some systems)
   * wlan utils/configuration tools
   * latest wpa-supplicant and hostapd updates, including WIFI_DISPLAY
   * bluetooth firmware (updated for all targets)
   * user-space wilink8 serial port shared-transport daemon (UIM)

Roger Monk (11):
  ti-connectivity/ti-compat-wireless-wl18xx: Add Wilink8 r8.a7.02
  ti-connectivity/wl18xx-firmware: Add Wilink8 r8.a7.02
  ti-connectivity/wl18xx-firmware: Apply Workaround PD Recovery Fix
  ti-connectivity/wpa-supplicant-wl18xx: Add Wilink8 r8.a7.02
  ti-connectivity/wpa-supplicant-wl18xx: Ensure version'd patch applied
    first
  ti-connectivity/hostap-daemon-wl18xx: Add Wilink8 r8.a7.02
  ti-connectivity/hostap-daemon-wl18xx: Ensure version'd patch applied
    first
  ti-connectivity/wlconf: Add Wilink8 r8.a7.02
  ti-connectivity/ti-wifi-utils-wl18xx: Add Wilink8 r8.a7.02
  ti-connectivity/bt-firmware: Update to latest BT Firmware + allow
    more targets
  ti-connectivity/uim: Add Usermode Init Mgr for TI Wilink Shared
    Transport

 ...-Remove-platform-check-and-install-defaul.patch |   41 ++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   10 +-
 .../ti-compat-wireless-wl18xx_r8.a7.02.bb          |   71 +++
 .../wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb    |   33 ++
 ...d-change-conf-file-for-better-oob-startup.patch |   43 ++
 .../hostap/hostap-daemon-wl18xx_r8.a7.02.bb        |   25 +
 ...mand-line-args-for-passing-sysfs-node-pat.patch |  135 ++++++
 .../recipes-connectivity/uim/files/uim-sysfs       |   34 ++
 .../recipes-connectivity/uim/uim_git.bb            |   28 ++
 .../recipes-connectivity/wlconf/wlconf_r8.a7.02.bb |   39 ++
 ...0001-revert-android-patches-to-enable-wfd.patch |   44 ++
 .../wpa-supplicant-wl18xx-r8.a7.02/defconfig       |  508 ++++++++++++++++++++
 .../wpa-supplicant-wl18xx_r8.a7.02.bb              |   29 ++
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb |   30 ++
 14 files changed, 1066 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a7.02.bb
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
 create mode 100755 meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs
 create mode 100644 meta-arago-extras/recipes-connectivity/uim/uim_git.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-wfd.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx-r8.a7.02/defconfig
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a7.02.bb
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb

-- 
1.7.9.5


