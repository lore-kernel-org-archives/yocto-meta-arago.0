Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 351FA52090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3gqG007301
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3gTO008842
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:42 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3fiV021469	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:41 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2OvF016865	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:24 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2OSB016864	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:24 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:11 +0100
Message-ID: <1381420942-16810-1-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 00/11] meta-arago-extras - Add wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:43 -0000
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

 ...-Remove-platform-check-and-install-defaul.patch |   41 ++++++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   10 +-
 ...01.bb => ti-compat-wireless-wl18xx_r8.a7.02.bb} |   30 ++--
 ...are_r8.a6.01.bb => wl18xx-firmware_r8.a7.02.bb} |    6 +-
 ...d-change-conf-file-for-better-oob-startup.patch |   21 +--
 ...8.a6.01.bb => hostap-daemon-wl18xx_r8.a7.02.bb} |   10 +-
 ...mand-line-args-for-passing-sysfs-node-pat.patch |  135 ++++++++++++++++++
 .../recipes-connectivity/uim/files/uim-sysfs       |   34 +++++
 .../recipes-connectivity/uim/uim_git.bb            |   28 ++++
 .../{wlconf_r8.a6.01.bb => wlconf_r8.a7.02.bb}     |    8 +-
 ...0001-revert-android-patches-to-enable-wfd.patch |   44 ++++++
 .../defconfig                                      |  150 +++++++++++++++-----
 ....a6.01.bb => wpa-supplicant-wl18xx_r8.a7.02.bb} |   13 +-
 ...8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a7.02.bb} |    8 +-
 14 files changed, 460 insertions(+), 78 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch
 copy meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a6.01.bb => ti-compat-wireless-wl18xx_r8.a7.02.bb} (73%)
 copy meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb => wl18xx-firmware_r8.a7.02.bb} (80%)
 copy meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-r5.sp4.01 => hostap-daemon-wl18xx-r8.a7.02}/0001-hostapd-change-conf-file-for-better-oob-startup.patch (67%)
 copy meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a6.01.bb => hostap-daemon-wl18xx_r8.a7.02.bb} (67%)
 create mode 100644 meta-arago-extras/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
 create mode 100755 meta-arago-extras/recipes-connectivity/uim/files/uim-sysfs
 create mode 100644 meta-arago-extras/recipes-connectivity/uim/uim_git.bb
 copy meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a6.01.bb => wlconf_r8.a7.02.bb} (89%)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx-r8.a7.02/0001-revert-android-patches-to-enable-wfd.patch
 copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-r5.sp4.01 => wpa-supplicant-wl18xx-r8.a7.02}/defconfig (74%)
 mode change 100755 => 100644
 copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a6.01.bb => wpa-supplicant-wl18xx_r8.a7.02.bb} (70%)
 copy meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a7.02.bb} (83%)

-- 
1.7.9.5


