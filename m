Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7F0AB529C3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYMoD024432
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:22 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYM6D012650
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:22 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:22 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOH003617;	Thu, 30 Jan 2014 12:34:21 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:06 -0600
Message-ID: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/11] Dora Updates
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:23 -0000
Content-Type: text/plain

All,

The following patches are my preliminary Dora updates for meta-arago
to get the process started.

Chase Maupin (11):
  qt4-embedded-gles: Update to 4.8.5 version
  matrix-gui-apps-image: remove duplicate inclusion
  matrix-gui-submenus: remove duplicate inclusion
  eglibc-initial: remove duplicate include
  arago-prefs: update linux-libc-headers version
  libav: update bbappend to latest version
  arago.conf: Add libav to LICENSE_FLAGS_WHITELIST
  update nativesdk-linux-libc-headers version
  libnl: Update PREFERRED_VERSION to latest
  Update bbappends for Dora
  bc: remove bbappend for Dora release

 meta-arago-distro/conf/distro/arago.conf           |    2 +-
 .../conf/distro/include/arago-prefs.inc            |   14 +++++-----
 .../conf/distro/include/toolchain-gcc.inc          |    2 +-
 .../conf/distro/include/toolchain-linaro.inc       |    4 +--
 ...enssh_6.1p1.bbappend => openssh_6.2p2.bbappend} |    3 +++
 ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
 .../{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend}  |    0
 ..._2012.55.bbappend => dropbear_2013.58.bbappend} |    2 ++
 .../recipes-extended/bc/bc/bc-1.06-fixes-1.patch   |   27 --------------------
 .../recipes-extended/bc/bc_1.06.bbappend           |    7 -----
 ...pe_2.4.11.bbappend => freetype_2.4.12.bbappend} |    0
 .../{libav_0.8.4.bbappend => libav_0.8.8.bbappend} |    4 ++-
 ...eaudio_3.0.bbappend => pulseaudio_4.0.bbappend} |    0
 ...bbappend => nativesdk-qt4-tools_4.8.5.bbappend} |    0
 ...4.bbappend => qt4-embedded-gles_4.8.5.bbappend} |    0
 ..._4.8.4.bbappend => qt4-embedded_4.8.5.bbappend} |    0
 .../{curl_7.29.0.bbappend => curl_7.32.0.bbappend} |    0
 .../conf/distro/include/tcmode-external-arago.inc  |    2 +-
 .../recipes-core/eglibc/eglibc-initial.inc         |    2 --
 .../matrix/matrix-gui-apps-images_2.0.bb           |    1 -
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    1 -
 ...ed-gles_4.8.4.bb => qt4-embedded-gles_4.8.5.bb} |    0
 22 files changed, 20 insertions(+), 51 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssh/{openssh_6.1p1.bbappend => openssh_6.2p2.bbappend} (91%)
 rename meta-arago-distro/recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dropbear/{dropbear_2012.55.bbappend => dropbear_2013.58.bbappend} (92%)
 delete mode 100644 meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
 delete mode 100644 meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend
 rename meta-arago-distro/recipes-graphics/freetype/{freetype_2.4.11.bbappend => freetype_2.4.12.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.4.bbappend => libav_0.8.8.bbappend} (92%)
 rename meta-arago-distro/recipes-multimedia/pulseaudio/{pulseaudio_3.0.bbappend => pulseaudio_4.0.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.4.bbappend => nativesdk-qt4-tools_4.8.5.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded-gles_4.8.4.bbappend => qt4-embedded-gles_4.8.5.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded_4.8.4.bbappend => qt4-embedded_4.8.5.bbappend} (100%)
 rename meta-arago-distro/recipes-support/curl/{curl_7.29.0.bbappend => curl_7.32.0.bbappend} (100%)
 rename meta-arago-extras/recipes-qt/qt4/{qt4-embedded-gles_4.8.4.bb => qt4-embedded-gles_4.8.5.bb} (100%)

-- 
1.7.9.5


