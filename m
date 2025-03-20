Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E5CC36019
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:54 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1852.1742494249594924975
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jiwJV1S6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAlub703240
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494247;
	bh=XUZExcz7wc9pzWV32ZhlQ9NcrFG745NDvpbkoWXUwQA=;
	h=From:To:Subject:Date;
	b=jiwJV1S6TnAqBbKCvVYsdkUg4ehD9Pqj2Qr0VNZxHIr84PoVBiJNVEJQeHPrHh5b4
	 4BcpG77YkkRlbtDnAkhk7+XK9Ez7cKaY8Px+97mD4Mcvli/6ldRIm6Q7OswWEGdtrO
	 IIY+Ra4ZF1FR5W5CSWT/HHzORUgH4i1kQ/1CMZP4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAlFK020244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:47 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:47 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAl7S085657;
	Thu, 20 Mar 2025 13:10:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLv-0006sn-4f; Thu, 20 Mar 2025 13:10:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 00/26] Wrap bbappends in a compliant manner
Date: Thu, 20 Mar 2025 13:10:21 -0500
Message-ID: <20250320181047.18035-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16109

We are moving to make the meta-arago layers Yocto Project Compatible.

https://www.yoctoproject.org/development/yocto-project-compatible-layers/

We have been cleaning up the layer according to the yocto-check-layer
tool.  This series address the idea that simply adding a layer into a
build (but not referencing anything from that layer), should not change
the builds in any way.  The main source for violating this check is
having a "naked" bbappend file that just blindly makes changes to a
recipe from another layer.

To address this we are wrapping our bbappends behind a guard.  We move
the contents of the bbappend into a .inc file, and change the bbappend
to only load that .inc if we are building something related to the
layer.  In this case, basing it off of building Arago as the distro.

Ryan Eatmon (26):
  alsa-state: Wrap the bbappend in a compliant manner
  iproute2: Wrap the bbappend in a compliant manner
  base-files: Wrap the bbappend in a compliant manner
  busybox: Wrap the bbappend in a compliant manner
  dbus: Wrap the bbappend in a compliant manner
  init-ifupdown: Wrap the bbappend in a compliant manner
  psplash: Wrap the bbappend in a compliant manner
  systemd: Wrap the bbappend in a compliant manner
  sysvinit: Wrap the bbappend in a compliant manner
  eudev: Wrap the bbappend in a compliant manner
  cmake: Wrap the bbappend in a compliant manner
  bash: Wrap the bbappend in a compliant manner
  shadow-securetty: Wrap the bbappend in a compliant manner
  libdrm: Wrap the bbappend in a compliant manner
  freetype: Wrap the bbappend in a compliant manner
  tslib: Wrap the bbappend in a compliant manner
  weston: Wrap the bbappend in a compliant manner
  weston-init: Wrap the bbappend in a compliant manner
  cryptodev-module: Wrap the bbappend in a compliant manner
  linux-firmware: Wrap the bbappend in a compliant manner
  tiff: Wrap the bbappend in a compliant manner
  cifs-utils: Wrap the bbappend in a compliant manner
  libnl: Wrap the bbappend in a compliant manner
  netperf: Wrap the bbappend in a compliant manner
  strongswan: Wrap the bbappend in a compliant manner
  syslog-ng: Wrap the bbappend in a compliant manner

 ...sa-state.bbappend => alsa-state-arago.inc} |  2 +-
 .../alsa-state/alsa-state.bbappend            |  6 +-
 ...iproute2_%.bbappend => iproute2-arago.inc} |  2 +-
 .../iproute2/iproute2_%.bbappend              |  9 +--
 ...-files_%.bbappend => base-files-arago.inc} |  2 +-
 .../base-files/base-files_%.bbappend          |  6 +-
 .../{busybox_%.bbappend => busybox-arago.inc} |  2 +-
 .../recipes-core/busybox/busybox_%.bbappend   | 10 +---
 .../dbus/{dbus_%.bbappend => dbus-arago.inc}  |  0
 .../recipes-core/dbus/dbus_%.bbappend         |  5 +-
 ...own_%.bbappend => init-ifupdown-arago.inc} |  2 +-
 .../init-ifupdown/init-ifupdown_%.bbappend    |  6 +-
 ...psplash_git.bbappend => psplash-arago.inc} |  2 +-
 .../recipes-core/psplash/psplash_git.bbappend | 12 +---
 .../{systemd_%.bbappend => systemd-arago.inc} |  2 +-
 .../recipes-core/systemd/systemd_%.bbappend   | 59 +------------------
 ...sysvinit_%.bbappend => sysvinit-arago.inc} |  0
 .../recipes-core/sysvinit/sysvinit_%.bbappend | 12 +---
 .../{eudev_%.bbappend => eudev-arago.inc}     |  2 +-
 .../recipes-core/udev/eudev_%.bbappend        | 24 +-------
 .../{cmake_%.bbappend => cmake-arago.inc}     |  2 +-
 .../recipes-devtools/cmake/cmake_%.bbappend   |  5 +-
 .../bash/{bash_%.bbappend => bash-arago.inc}  |  0
 .../recipes-extended/bash/bash_%.bbappend     |  5 +-
 ..._%.bbappend => shadow-securetty-arago.inc} |  0
 .../shadow/shadow-securetty_%.bbappend        | 17 +-----
 .../{libdrm_%.bbappend => libdrm-arago.inc}   |  2 +-
 .../recipes-graphics/drm/libdrm_%.bbappend    | 13 +---
 ...freetype_%.bbappend => freetype-arago.inc} |  0
 .../freetype/freetype_%.bbappend              |  5 +-
 .../{tslib_%.bbappend => tslib-arago.inc}     |  0
 .../recipes-graphics/tslib/tslib_%.bbappend   |  6 +-
 ...eston_14.0.%.bbappend => weston-arago.inc} |  2 +-
 ...on-init.bbappend => weston-init-arago.inc} |  2 +-
 .../wayland/weston-init.bbappend              | 16 +----
 .../wayland/weston_14.0.%.bbappend            |  9 +--
 ..._%.bbappend => cryptodev-module-arago.inc} |  0
 .../cryptodev/cryptodev-module_%.bbappend     |  5 +-
 ...re_%.bbappend => linux-firmware-arago.inc} |  0
 .../linux-firmware/linux-firmware_%.bbappend  |  8 +--
 .../{tiff_%.bbappend => tiff-arago.inc}       |  0
 .../libtiff/tiff_%.bbappend                   |  6 +-
 ...tils_7.0.bbappend => cifs-utils-arago.inc} |  2 +-
 .../cifs/cifs-utils_7.0.bbappend              |  6 +-
 .../{libnl_%.bbappend => libnl-arago.inc}     |  0
 .../recipes-support/libnl/libnl_%.bbappend    | 11 +---
 ...netperf_git.bbappend => netperf-arago.inc} |  0
 .../netperf/netperf_git.bbappend              |  5 +-
 ...ngswan_%.bbappend => strongswan-arago.inc} |  0
 .../strongswan/strongswan_%.bbappend          | 20 +------
 ...slog-ng_%.bbappend => syslog-ng-arago.inc} |  0
 .../syslog-ng/syslog-ng_%.bbappend            |  6 +-
 52 files changed, 93 insertions(+), 225 deletions(-)
 copy meta-arago-distro/recipes-bsp/alsa-state/{alsa-state.bbappend => alsa-state-arago.inc} (53%)
 copy meta-arago-distro/recipes-connectivity/iproute2/{iproute2_%.bbappend => iproute2-arago.inc} (71%)
 copy meta-arago-distro/recipes-core/base-files/{base-files_%.bbappend => base-files-arago.inc} (53%)
 copy meta-arago-distro/recipes-core/busybox/{busybox_%.bbappend => busybox-arago.inc} (63%)
 copy meta-arago-distro/recipes-core/dbus/{dbus_%.bbappend => dbus-arago.inc} (100%)
 copy meta-arago-distro/recipes-core/init-ifupdown/{init-ifupdown_%.bbappend => init-ifupdown-arago.inc} (52%)
 copy meta-arago-distro/recipes-core/psplash/{psplash_git.bbappend => psplash-arago.inc} (83%)
 copy meta-arago-distro/recipes-core/systemd/{systemd_%.bbappend => systemd-arago.inc} (97%)
 copy meta-arago-distro/recipes-core/sysvinit/{sysvinit_%.bbappend => sysvinit-arago.inc} (100%)
 copy meta-arago-distro/recipes-core/udev/{eudev_%.bbappend => eudev-arago.inc} (93%)
 copy meta-arago-distro/recipes-devtools/cmake/{cmake_%.bbappend => cmake-arago.inc} (59%)
 copy meta-arago-distro/recipes-extended/bash/{bash_%.bbappend => bash-arago.inc} (100%)
 copy meta-arago-distro/recipes-extended/shadow/{shadow-securetty_%.bbappend => shadow-securetty-arago.inc} (100%)
 copy meta-arago-distro/recipes-graphics/drm/{libdrm_%.bbappend => libdrm-arago.inc} (87%)
 copy meta-arago-distro/recipes-graphics/freetype/{freetype_%.bbappend => freetype-arago.inc} (100%)
 copy meta-arago-distro/recipes-graphics/tslib/{tslib_%.bbappend => tslib-arago.inc} (100%)
 copy meta-arago-distro/recipes-graphics/wayland/{weston_14.0.%.bbappend => weston-arago.inc} (70%)
 copy meta-arago-distro/recipes-graphics/wayland/{weston-init.bbappend => weston-init-arago.inc} (84%)
 copy meta-arago-distro/recipes-kernel/cryptodev/{cryptodev-module_%.bbappend => cryptodev-module-arago.inc} (100%)
 copy meta-arago-distro/recipes-kernel/linux-firmware/{linux-firmware_%.bbappend => linux-firmware-arago.inc} (100%)
 copy meta-arago-distro/recipes-multimedia/libtiff/{tiff_%.bbappend => tiff-arago.inc} (100%)
 copy meta-arago-distro/recipes-support/cifs/{cifs-utils_7.0.bbappend => cifs-utils-arago.inc} (62%)
 copy meta-arago-distro/recipes-support/libnl/{libnl_%.bbappend => libnl-arago.inc} (100%)
 copy meta-arago-distro/recipes-support/netperf/{netperf_git.bbappend => netperf-arago.inc} (100%)
 copy meta-arago-distro/recipes-support/strongswan/{strongswan_%.bbappend => strongswan-arago.inc} (100%)
 copy meta-arago-distro/recipes-support/syslog-ng/{syslog-ng_%.bbappend => syslog-ng-arago.inc} (100%)

-- 
2.17.1


