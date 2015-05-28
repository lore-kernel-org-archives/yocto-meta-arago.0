Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 848AF52A40
	for <meta-arago@arago-project.org>;
	Thu, 28 May 2015 11:05:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4SB4xn9020289
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 06:04:59 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SB4xEu016375
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 06:04:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 06:04:59 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4SB4waV019271;	Thu, 28 May 2015 06:04:58 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YxvcP-0000zL-Qz;
	Thu, 28 May 2015 07:04:57 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 May 2015 07:04:50 -0400
Message-ID: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] Add dsptop to SDK.
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
X-List-Received-Date: Thu, 28 May 2015 11:05:02 -0000
Content-Type: text/plain

These patches fully integrate dsptop and components into the
fileystem, devkit, and SDK.

Jacob Stiffler (5):
  packagegroups/packagegroup-arago-tisdk-addons_dra7xx: Add dsptop.
  packagegroup-arago-tisdk-addons-sdk-target_dra7xx: Add libulm.
  arago-source-ipk: Enable debugss-module-drv source ipk.
  packagegroup-arago-tisdk-addons-sdk-host_dra7xx: Add
    debugss-module-drv-src.
  ti-tisdk-makefile: Add debugss-module-drv makefile fragment.

 .../conf/distro/arago-source-ipk.conf              |    4 +++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    3 +-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    3 +-
 .../packagegroup-arago-tisdk-addons.bb             |    4 +--
 .../ti-tisdk-makefile/Makefile_debugss-module-drv  |   29 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   11 ++++++--
 6 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv

-- 
1.7.9.5


