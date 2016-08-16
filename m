Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 59769529A0
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 22:04:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7GM4qkr001689
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7GM4qtc009247
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 Aug 2016 17:04:51 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7GM4pip018753;	Tue, 16 Aug 2016 17:04:51 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Aug 2016 18:04:44 -0400
Message-ID: <1471385087-22759-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] add glfw3 version 3.2
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
X-List-Received-Date: Tue, 16 Aug 2016 22:04:59 -0000
Content-Type: text/plain

Add glfw3 version 3.2, which requires two new dependencis:
1. wayland-protocols
2. extra-cmake-modules

Also a patch has been created for glfw3 to specify WaylandProtocols_PKGDATADIR with the correct prefix

Hongmei Gou (3):
  wayland-protocols: add version 1.5
  extra-cmake-modules: add version 1.5.0+gitrX
  glfw3: add version 3.2

 .../wayland/wayland-protocols_1.5.bb               | 20 +++++++++++++++++
 .../recipes-devtools/cmake/extra-cmake-modules.bb  | 18 +++++++++++++++
 ...in-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch | 26 ++++++++++++++++++++++
 ...IR-prefix-for-WaylandProtocols_PKGDATADIR.patch | 11 +++++++++
 .../recipes-graphics/glfw3/glfw3_git.bb            | 24 ++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
 create mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
 create mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb

-- 
1.9.1


