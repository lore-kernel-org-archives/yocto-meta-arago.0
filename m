Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DA4BB52976
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 19:07:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82J7SpD007270
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82J7RDf031125
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 14:07:27 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s82J7Qmi007602;	Tue, 2 Sep 2014 14:07:27 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s82J7OcT001691;	Wed, 3 Sep 2014 00:37:25 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 14:07:17 -0500
Message-ID: <1409684841-19677-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 0/4] New patchset
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
X-List-Received-Date: Tue, 02 Sep 2014 19:07:29 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Please completely ignore the previous patchset and focus only on this patchset.

Franklin S. Cooper Jr (4):
  arago.conf: Disable TSLIB in Qt 5
  qtwayland: Add Touch issue fix
  packagegroup-arago-*: Conditionally include tslib
  qtbase: Remove references of TSLIB

 meta-arago-distro/conf/distro/arago.conf           |    2 +-
 .../packagegroups/packagegroup-arago-console.bb    |    4 +-
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    7 --
 .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |    2 +-
 .../packagegroup-arago-standalone-sdk-target.bb    |    4 +-
 .../qt5/qtwayland/0001-Fix-touch-with-Weston.patch |   74 ++++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |    7 +-
 7 files changed, 86 insertions(+), 14 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch

-- 
1.7.9.5


