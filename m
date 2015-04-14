Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D0F9052A6C
	for <meta-arago@arago-project.org>;
	Tue, 14 Apr 2015 13:47:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3EDlIJ4015333
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 08:47:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EDlGur012557
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 08:47:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 08:47:16 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EDlGY6009245;
	Tue, 14 Apr 2015 08:47:16 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Yi1BM-0003y3-9n;
	Tue, 14 Apr 2015 09:47:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Apr 2015 09:47:07 -0400
Message-ID: <1429019232-15216-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] CMEM: Add package to SDK.
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
X-List-Received-Date: Tue, 14 Apr 2015 13:47:19 -0000
Content-Type: text/plain

* This patch set adds cmem and cmem module to the SDK for the omap-a15
  platform family.
* Since CMEM is an out-of-tree kernel module, the module sources are
  also provided in the SDK.

Jacob Stiffler (5):
  packagegroup-arago-tisdk-addons: Add cmem to target filesystem.
  packagegroup-arago-tisdk-addons-sdk-target: Add cmem-dev.
  arago-source-ipk: Enable cmem-mod source IPK.
  packagegroup-arago-tisdk-addons-sdk-host: Add cmem-mod-src to SDK.
  ti-tisdk-makefile: Add cmem-mod makfile fragment.

 .../conf/distro/arago-source-ipk.conf              |    4 +++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    6 +++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    6 +++-
 .../packagegroup-arago-tisdk-addons.bb             |    6 +++-
 .../ti-tisdk-makefile/Makefile_cmem-mod            |   33 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++-
 6 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod

-- 
1.7.9.5


