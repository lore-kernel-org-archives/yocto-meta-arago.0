Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0DA445296F
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8520820BBF;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vWQAK_5kvvty; Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A01320BAB;
	Fri, 10 Mar 2017 21:10:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1805B16239D;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:05 -0500
Message-Id: <1489180211-138519-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/6] Remove WiLink8 recipes moved to meta-ti, update deps
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Denys Dmytriyenko (6):
  wl18xx-firmware: moved to meta-ti as wl18xx-fw, remove here
  bt-firmware: moved to meta-ti as bt-fw, remove here
  wlconf: moved to meta-ti, remove here
  wl18xx-target-scripts: moved to meta-ti, remove here
  ti-wifi-utils: moved to meta-ti as wl18xx-calibrator, remove here
  wilink-calibrate: remove outdated wl12xx package

 .../conf/distro/include/arago-source-ipk.inc       |  4 +-
 .../packagegroup-arago-tisdk-connectivity.bb       |  6 +--
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     | 35 ------------------
 .../recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb | 35 ------------------
 .../0001-Add-Makefile-for-SDK.patch                | 33 -----------------
 .../wl18xx-target-scripts/wl18xx-target-scripts.bb | 26 -------------
 .../recipes-connectivity/wlconf/wlconf.bb          | 43 ----------------------
 .../ti-wifi-utils/ti-wifi-utils-wl18xx.bb          | 34 -----------------
 .../ti-wifi-utils/wilink-calibrate/calibrate.sh    |  7 ----
 .../ti-wifi-utils/wilink-calibrate_1.0.bb          | 17 ---------
 10 files changed, 5 insertions(+), 235 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/0001-Add-Makefile-for-SDK.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-calibrate_1.0.bb

-- 
2.7.4


