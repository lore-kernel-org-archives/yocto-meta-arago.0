Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 112D652A31
	for <meta-arago@arago-project.org>;
	Mon, 14 Jul 2014 15:08:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6EF8wu3015999
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 10:08:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EF8wHf013291
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 10:08:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 10:08:57 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6EF8uSp023580;	Mon, 14 Jul 2014 10:08:57 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Jul 2014 18:04:04 +0300
Message-ID: <1405350249-15037-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/5] updated wl18xx patch set to support latest release
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
X-List-Received-Date: Mon, 14 Jul 2014 15:08:59 -0000
Content-Type: text/plain

    - Moved to use git.ti.com instead of github.
    - Updated tag to ol_r8.a9.14
    - Added new scripts for better OOB expiriance 
Yaniv    

Yaniv Machani (5):
  wpa-supplicant-wl18xx: Update recipe to ol_r8.a9.14 version.
  hostap-daemon-wl18xx: Update recipe to ol_r8.a9.14 version
  wl18xx : update to ol_r8.a9.14
  Wl18xx : recipes update - tag changed to ol_r8.a9.14
  wl18xx-target-scripts : Add new WiFi related scripts

 .../packagegroup-arago-tisdk-connectivity.bb       |    1 +
 ...are_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} |    9 +-
 ...8.a8.10.bb => hostap-daemon-wl18xx_r8.a9.14.bb} |    8 +-
 .../hostap/hostap-daemon/defconfig                 |    2 +-
 .../recipes-connectivity/hostap/hostap.inc         |    7 +-
 .../wl18xx-target-scripts_r8.a9.14.bb              |   24 ++++++
 ....a8.10.bb => wpa-supplicant-wl18xx_r8.a9.14.bb} |   10 +-
 .../wpa-supplicant/wpa-supplicant.inc              |   88 +++++++-------------
 .../wpa-supplicant/wpa-supplicant/defaults-sane    |    8 --
 .../defconfig                                      |   69 ++++++++++++----
 .../fi.epitest.hostap.WPASupplicant.service        |    4 -
 .../wpa-supplicant/fi.w1.wpa_supplicant1.service   |    4 -
 ...8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} |    8 +-
 13 files changed, 132 insertions(+), 110 deletions(-)
 mode change 100644 => 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
 rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} (72%)
 mode change 100644 => 100755
 rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a8.10.bb => hostap-daemon-wl18xx_r8.a9.14.bb} (79%)
 mode change 100644 => 100755
 mode change 100644 => 100755 meta-arago-extras/recipes-connectivity/hostap/hostap.inc
 create mode 100755 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a8.10.bb => wpa-supplicant-wl18xx_r8.a9.14.bb} (76%)
 mode change 100644 => 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defaults-sane
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx => wpa-supplicant}/defconfig (90%)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.epitest.hostap.WPASupplicant.service
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/fi.w1.wpa_supplicant1.service
 rename meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} (81%)

-- 
1.7.9


