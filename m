Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 26A5652AC8
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54A0520BAA;
	Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UErpsfHmuuqm; Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDE6C20BA6;
	Fri,  3 Mar 2017 02:59:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D31601623AA;
	Thu,  2 Mar 2017 21:59:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 21:58:53 -0500
Message-Id: <1488509945-12853-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 00/12] various fixes for latest master
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
X-List-Received-Date: Fri, 03 Mar 2017 02:59:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Currently only builds with internal toolchain, as Linaro is broken with RSS

Denys Dmytriyenko (12):
  libnl: update bbappend for 3.2.29
  Revert "cryptodev: backport patch for user page API change in recent
    kernels"
  packagegroup-*-test: iperf is already in base-tisdk packagegroup
  packagegroup-*-base-tisdk: iperf was replaced by iperf3
  packagegroup-*-connectivity: crda was blacklisted upstream for
    breakage
  images: disable matrix, as php was blacklised upstream for breakage
  packagegroup-*-base: alsa-lib no longer provides smixer libs, depend
    directly on libasound
  arago.conf: qtwayland 5.8 now requires qtbase with xkbcommon-evdev
    PACKAGECONFIG
  ackagegroup-*-qte: use qtdeclarative-qmlplugins instead of -plugins
  toolchain-gcc: update preferences to current versions
  arago-prefs: prefer latest libnl version
  arago-prefs: update gstreamer preference to 1.10.4

 meta-arago-distro/conf/distro/arago.conf           |  2 +-
 .../conf/distro/include/arago-prefs.inc            | 13 ++++---
 .../conf/distro/include/toolchain-gcc.inc          | 10 +++---
 .../recipes-core/images/arago-core-tisdk-image.inc |  3 +-
 .../recipes-core/images/tisdk-rootfs-image.bb      |  3 +-
 .../images/tisdk-server-rootfs-image.bb            |  3 +-
 .../packagegroups/packagegroup-arago-base-tisdk.bb |  2 +-
 .../packagegroups/packagegroup-arago-base.bb       |  2 +-
 .../packagegroups/packagegroup-arago-qte.bb        |  2 +-
 .../packagegroups/packagegroup-arago-test.bb       |  1 -
 .../packagegroup-arago-tisdk-connectivity.bb       |  3 +-
 .../cryptodev/cryptodev-module_%.bbappend          |  6 +---
 ...st-to-another-change-in-the-user-page-API.patch | 40 ----------------------
 ...libnl_3.2.28.bbappend => libnl_3.2.29.bbappend} |  0
 14 files changed, 24 insertions(+), 66 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.2.28.bbappend => libnl_3.2.29.bbappend} (100%)

-- 
2.7.4


