Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 18C225298F
	for <meta-arago@arago-project.org>;
	Tue,  6 Feb 2018 20:16:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w16KFtM1003477
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517948155;
	bh=5RvmTEbazH19LCto6sOhwypKRXVytG/adbXAzRSv2vM=;
	h=From:To:Subject:Date;
	b=nGYxXtniFwCoem/KVY0JzfbHSDSlIhCysbqobGbZb4amLxSksM3RsImPYLxeWXEpD
	c2GiMXvrJfi+6fnqybNdUHj2pb+RBrpyS7JPdo47Vjw9wLqDJ6LpdtRmOFG3vLJL6u
	W+SYtc6aE79yJ6kcXiJkIcgwBso5VKDO/bRY6dVY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFtcD003771
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Feb 2018 14:15:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Feb 2018 14:15:55 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFtSX029875
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:55 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Feb 2018 15:15:46 -0500
Message-ID: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 0/4] Enable thermostat demo for QT5
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
X-List-Received-Date: Tue, 06 Feb 2018 20:16:04 -0000
Content-Type: text/plain

Eric Ruei (4):
  packagegroup-arago-tisdk-matrix: add thermostat demo back to
    MATRIX_QT_APPS
  packagegroup-arago-tisdk-qte(-sdk-host): move qt-tstat to QT_DEMOS
  ti-tisdk-makefile: add qt-tstat to MAKEFILES_MATRIX_GUI
    unconditionally
  qt-tstat: pickup the latest version for both Qt4/Qt5 support

 .../packagegroup-arago-tisdk-matrix.bb              |  4 ++--
 .../packagegroup-arago-tisdk-qte-sdk-host.bb        |  5 ++---
 .../packagegroups/packagegroup-arago-tisdk-qte.bb   |  5 ++---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      |  4 ++--
 .../thermostat-demo/qt-tstat/qt_tstat.sh            | 13 +++++++++++++
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb    | 21 +++++++++++----------
 6 files changed, 32 insertions(+), 20 deletions(-)
 create mode 100755 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh

-- 
1.9.1


