Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B417A52A80
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JuaDi014196
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Juan9006514
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Juax5006846;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh5-0004Uy-DF; Tue, 03 Nov 2015 14:56:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:22 -0500
Message-ID: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/10] Extend SDK features to keystone
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:38 -0000
Content-Type: text/plain

* Enable default top-level makefile targets such as linux-dtbs and
  u-boot 
* Add boot-monitor source and top-level makefile target to the SDK
* Add out-of-tree kernel module sources and top-level makefile targets
  to the SDK

Jacob Stiffler (10):
  ti-tisdk-makefile: Fixes and enhancements for keystone
  hplib-mod: Adjust SRCIPK_SRC_DIR
  arago-source-ipk: Enable sourceipks for keystone
  packagegroup-arago-tisdk-amsdk-sdk-host: Add boot-monitor-src
  packagegroup-arago-tisdk-addons-sdk-host: keystone: Add kernel module
    sources
  packagegroup-arago-tisdk-crypto-sdk-host: keystone: Add cryptodev
    sources
  ti-tisdk-makefile: keystone: Enable existing makefile targets
  ti-tisdk-makefile: Add boot-monitor target
  ti-tisdk-makefile: Add hplib-mod target
  ti-tisdk-makefile: Add uio-module-drv target

 .../conf/distro/arago-source-ipk.conf              |  9 +++++++
 .../recipes-bsp/hplib/hplib-mod_git.bbappend       |  3 +++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 19 ++++++++++---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |  6 ++++-
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |  4 ++-
 .../ti-tisdk-makefile/Makefile_boot-monitor        | 30 +++++++++++++++++++++
 .../ti-tisdk-makefile/Makefile_hplib-mod           | 28 +++++++++++++++++++
 .../ti-tisdk-makefile/Makefile_uio-module-drv      | 28 +++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 31 +++++++++++++++++++---
 9 files changed, 149 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv

-- 
1.9.1


