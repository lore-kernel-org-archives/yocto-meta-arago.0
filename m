Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 82757529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 19:46:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CJkPBA029753
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:46:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJkOHD032411
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:46:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 14:46:24 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2CJkOH3003754;	Thu, 12 Mar 2015 14:46:24 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YW93o-0002MX-7v;
	Thu, 12 Mar 2015 15:46:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 15:46:18 -0400
Message-ID: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 0/4] Implment the wayland DISTRO_FEATURE.
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
X-List-Received-Date: Thu, 12 Mar 2015 19:46:26 -0000
Content-Type: text/plain

* Only include wayland, weston, and example packages if 'wayland' is a
  DISTRO_FEATURE.
* By default, if 'screen' is a MACHINE_FEATURE, then add 'wayland' as a
  DISTRO_FEATURE.
* Configure qt5 to use wayland if it is a DISTRO_FEATURE, otherwise use eglfs.
* Add processor-sdk brand to remove wayland from DISTRO_EFATURES for the ti33x
  and ti43x soc families.


Jacob Stiffler (4):
  arago.conf: Include wayland in DISTRO_FEATURES by default.
  packagegroup-*: Include wayland/weston if specified in
    DISTRO_FEATURES.
  qtbase: Use DISTRO_FEATURES to set appropriate qpa.
  branding-processor-sdk: Add processor-sdk brand.

 meta-arago-distro/conf/distro/arago.conf           |    2 +-
 .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    4 +--
 8 files changed, 47 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

-- 
v2: Change order of patches.

1.7.9.5


