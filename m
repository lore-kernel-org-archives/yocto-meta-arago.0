Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8F79452004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 14:32:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QEWntR004260
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 08:32:49 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QEWnVb000376
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 08:32:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 08:32:49 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1QEWmdL026291	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 08:32:49 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Feb 2016 09:32:36 -0500
Message-ID: <1456497158-46802-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] Enable wayland/drm support and the corresponding 3D demos for AM3
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
X-List-Received-Date: Fri, 26 Feb 2016 14:32:51 -0000
Content-Type: text/plain

Eric Ruei (2):
  conf: enable wayland/drm support for AM3
  matrix: enable corresponding 3D demos including kmscube for AM3

 meta-arago-distro/conf/distro/arago.conf                       |  5 ++++-
 .../conf/distro/include/branding-processor-sdk.inc             |  3 ---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 +++++++++-
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb             |  6 +++++-
 4 files changed, 18 insertions(+), 6 deletions(-)

-- 
1.9.1


