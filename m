Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5D4F552A6C
	for <meta-arago@arago-project.org>;
	Thu,  8 Jan 2015 12:07:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t08C7M1N007263
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 06:07:22 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t08C7MJA032579
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 06:07:22 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 06:07:22 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t08C7KJw028785;
	Thu, 8 Jan 2015 06:07:21 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Jan 2015 17:37:17 +0530
Message-ID: <1420718839-32155-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [v3 WILINK R8.5 0/2] Integration of R8.5
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
X-List-Received-Date: Thu, 08 Jan 2015 12:07:23 -0000
Content-Type: text/plain

This patch set integrates R8.5 Wilink release along with the
required dependencies.

Changes from v2:
 * Fixed an offline comment from Eyal/Yaniv to move the 
   commit of wl18xx-target-scripts to a few commits below
   R8.5 tag. This addresses the issue with running the 
   script /usr/share/wl18xx/ap_start.sh

Changes from v1:
 * Added PV for all the recipes
 * Verified with the latest kernel that includes the probe
   deferral fix


Karthik Ramanan (2):
  packagegroup-*-connectivity: Include iptables package
  wl18xx, bt-firmware: Update to R8.5

 .../packagegroup-arago-tisdk-connectivity.bb       |    3 ++-
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    4 ++--
 ...xx_r8.a9.14.bb => ti-compat-wireless-wl18xx.bb} |    6 +++---
 ...8xx-firmware_r8.a9.14.bb => wl18xx-firmware.bb} |    8 +++++---
 ...-wl18xx_r8.a9.14.bb => hostap-daemon-wl18xx.bb} |    8 ++++----
 ...cripts_r8.a9.14.bb => wl18xx-target-scripts.bb} |    8 +++++---
 .../wlconf/{wlconf_r8.a9.14.bb => wlconf.bb}       |    8 +++++---
 ...wl18xx_r8.a9.14.bb => wpa-supplicant-wl18xx.bb} |    8 ++++----
 ...-wl18xx_r8.a9.14.bb => ti-wifi-utils-wl18xx.bb} |    8 +++++---
 9 files changed, 35 insertions(+), 26 deletions(-)
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a9.14.bb => ti-compat-wireless-wl18xx.bb} (93%)
 rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a9.14.bb => wl18xx-firmware.bb} (86%)
 rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a9.14.bb => hostap-daemon-wl18xx.bb} (80%)
 rename meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/{wl18xx-target-scripts_r8.a9.14.bb => wl18xx-target-scripts.bb} (83%)
 rename meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a9.14.bb => wlconf.bb} (93%)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a9.14.bb => wpa-supplicant-wl18xx.bb} (86%)
 rename meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a9.14.bb => ti-wifi-utils-wl18xx.bb} (88%)

-- 
1.7.9.5


