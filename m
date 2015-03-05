Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5156A52A52
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:33:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25DXblO014450
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:37 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25DXat0018324
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 07:33:36 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25DXajA010993;	Thu, 5 Mar 2015 07:33:36 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTVuB-0000W4-VF;
	Thu, 05 Mar 2015 08:33:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 08:33:25 -0500
Message-ID: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC 0/4] Add ARAGO_QT_PLATFORM preference
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
X-List-Received-Date: Thu, 05 Mar 2015 13:33:38 -0000
Content-Type: text/plain

* Add ARAGO_QT_PLATFORM variable to choose between wayland or eglfs for 
  qt platform.
* By default, use wayland as qt platform.
* If using eglfs, then exclude wayland/weston from filesystem.
* Add processor-sdk brand which will use eglfs.

Jacob Stiffler (4):
  arago-prefs: Add ARAGO_QT_PLATFORM.
  packagegroups: Add wayland/weston based on ARAGO_QT_PLATFORM.
  qtbase: Choose QT platform abstraction based on ARAGO_QT_PLATFORM.
  branding-processor-sdk: Add processor-sdk branding.

 .../conf/distro/include/arago-prefs.inc            |    2 ++
 .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
 .../recipes-qt/qt5/qtbase/qt_env_eglfs.sh          |    5 +++
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |   10 +++---
 8 files changed, 56 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh

-- 
1.7.9.5


