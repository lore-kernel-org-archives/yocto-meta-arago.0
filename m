Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DDA8B52A3F
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 18:55:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51Itrkh001974
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51ItrVK002911
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 13:55:52 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t51ItqdT004721;	Mon, 1 Jun 2015 13:55:52 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzUsK-0005a2-DV;
	Mon, 01 Jun 2015 14:55:52 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jun 2015 14:55:45 -0400
Message-ID: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] Add gdbc6x to the SDK.
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
X-List-Received-Date: Mon, 01 Jun 2015 18:55:55 -0000
Content-Type: text/plain

These patches fully integrate gdbc6x and components in to the
filesystem, devkit, and SDK.

Jacob Stiffler (5):
  packagegroup-arago-tisdk-addons_dra7xx: Add gdbc6x     Signed-off-by:
    Jacob Stiffler <j-stiffler@ti.com>
  packagegroup-arago-tisdk-addons-sdk-target_dra7xx: Add gdbserver-c6x
  arago-source-ipk: Enable gdbserverproxy-module-drv source ipk
  packagegroup-arago-tisdk-addons-sdk-host_dra7xx: Add
    gdbserverproxy-module-drv-src
  ti-tisdk-makefile: Add gdbserverproxy-module-drv makefile fragment

 .../conf/distro/arago-source-ipk.conf              |    4 +++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    4 +--
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    7 +++--
 .../packagegroup-arago-tisdk-addons.bb             |    4 +--
 .../Makefile_gdbserverproxy-module-drv             |   29 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    8 +++++-
 6 files changed, 49 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv

-- 
1.7.9.5


