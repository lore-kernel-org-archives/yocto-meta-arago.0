Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 65B315299E
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:31:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IVlJB025853
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IVknE005265
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:46 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 12:31:46 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25IVkbr023812;	Thu, 5 Mar 2015 12:31:46 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTaYj-0005By-MZ;
	Thu, 05 Mar 2015 13:31:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 13:31:39 -0500
Message-ID: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 05 Mar 2015 18:31:48 -0000
Content-Type: text/plain

* This falg may be used to exclude wayland/weston from the file system.
* QT platform will be set based on this value.
* Add processor-sdk band to disable wayland for ti33x and ti43x.



Jacob Stiffler (4):
  arago-prefs: Add WAYLAND_SUPPORT flag.
  packagegroups: Implement WAYLAND_SUPPORT flag.
  qtbase: Set qpa based in WAYLAND_SUPPORT flag.
  branding-processor-sdk: Add processor-sdk brand.

 .../conf/distro/include/arago-prefs.inc            |    2 ++
 .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++--
 8 files changed, 51 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc

-- 
1.7.9.5


