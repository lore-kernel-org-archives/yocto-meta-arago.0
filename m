Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 365D652A69
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 22:22:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v13MMUCf028014
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v13MMULO018478
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 16:22:29 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v13MMTKv025786;	Fri, 3 Feb 2017 16:22:29 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Feb 2017 17:22:13 -0500
Message-ID: <1486160539-23523-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 0/6] Add barcode-roi demo
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
X-List-Received-Date: Fri, 03 Feb 2017 22:22:32 -0000
Content-Type: text/plain

Add barcode demo to detect region of interest (ROI)

Hongmei Gou (6):
  barcode-roi: add barcode ROI detection demo
  arago-source-ipk: add SRCIPK for barcode-roi demo
  ti-tisdk-makefile: add barcode-roi demo
  matrix-gui-machinevision-demos: add barcode-roi demo
  packagegroup-arago-tisdk-matrix: add barcode-roi demo
  packagegroup-arago-tisdk-multimedia-sdk*: add barcode-roi demo

 .../conf/distro/arago-source-ipk.conf              |  3 +++
 .../packagegroup-arago-tisdk-matrix.bb             |  6 ++++-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  9 ++++++-
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  8 +++++-
 .../ti-tisdk-makefile/Makefile_barcode-roi         | 19 ++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  7 +++++-
 .../recipes-apps/barcode-demo/barcode-roi_git.bb   | 29 ++++++++++++++++++++++
 .../matrix/matrix-gui-machinevision-demos_2.0.bb   | 24 +++++++++++++++---
 8 files changed, 98 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi
 create mode 100644 meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb

-- 
1.9.1


