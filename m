Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6C0D152A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 12:56:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CCu1a0017425
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu0Y8007328
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 07:55:59 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCtxDx016959;
	Thu, 12 Mar 2015 07:56:00 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YW2ed-0005jx-Iv;
	Thu, 12 Mar 2015 08:55:59 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 08:55:53 -0400
Message-ID: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Implment the wayland DISTRO_FEATURE.
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
X-List-Received-Date: Thu, 12 Mar 2015 12:56:02 -0000
Content-Type: text/plain

* Only include wayland, weston, and example packages if 'wayland' is a 
  DISTRO_FEATURE.
* By default, if 'screen' is a MACHINE_FEATURE, then add 'wayland' as a 
  DISTRO_FEATURE.
* Configure qt5 to use wayland if it is a DISTRO_FEATURE, otherwise use eglfs.
* Add processor-sdk brand to remove wayland from DISTRO_EFATURES for the ti33x
  and ti43x soc families.


Jacob Stiffler (4):
  packagegroup-*: Include wayland/weston if specified in
    DISTRO_FEATURES.
  qtbase: Use DISTRO_FEATURES to set appropriate qpa.
  arago.conf: Include wayland in DISTRO_FEATURES by default.
  branding-processor-sdk: Add processor-sdk brand.

 meta-arago-distro/conf/distro/arago.conf           |    2 +-
 .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 +++--
 8 files changed, 51 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

-- 
1.7.9.5


