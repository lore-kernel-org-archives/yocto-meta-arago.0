Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 840215209D
	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 20:26:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7MKQc4L021784
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7MKQbCb025013
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 Aug 2016 15:26:37 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7MKQatl027787	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 15:26:37 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Aug 2016 16:19:05 -0400
Message-ID: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Matrix Gui: Add touchscreen demo and submenu
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
X-List-Received-Date: Mon, 22 Aug 2016 20:26:40 -0000
Content-Type: text/plain

Add matrix gui submenu touch and the touch interact demo

Eric Ruei (5):
  matrix-gui-touch-demos: add touch demo: touchscreen interaction
  matrix-gui-submenu: add touch submenu
  packagegroup-arago-tisdk-matrix: add touch demos
  matrix-gui-apps-git: bump SRCREV to pick up the touch demos
  matrix-gui: Update the "execute-command" patch to support category
    "touch"

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb  |  8 +++++++-
 .../recipes-core/matrix/matrix-gui-apps-git.inc       |  4 ++--
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb    |  5 ++++-
 .../recipes-core/matrix/matrix-gui-touch-demos_2.0.bb | 15 +++++++++++++++
 ..._command-workaround-for-GUI-apps-with-weston.patch | 19 ++++++++++---------
 .../recipes-core/matrix/matrix-gui_2.0.bb             |  2 +-
 6 files changed, 39 insertions(+), 14 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb

-- 
1.9.1


