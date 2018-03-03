Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 613BE529EE
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 19:31:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w23JV1xf013422
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520105461;
	bh=MGgKPYgeMS8ETaSppV9ayzhh3ntCk7z9934v+GhoF1I=;
	h=From:To:Subject:Date;
	b=pnSgbYaAkD8mKrhub6JXhUyMyvahV6Qyh5wonX9lVF3YBq53WYr87GpTyyKCrptK0
	KV7htvlfqGmtxISCJ9oelUJR+ByfPA646Ub/AdU/wC5b+FT8p+aHVMyC0rUZ20xmzA
	j5DcebGa18/XaadsaZXKCFsNxwmRvyOy2ZIsw524=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV0cZ004586
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:00 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 3 Mar 2018 13:31:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 3 Mar 2018 13:31:00 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV07X019492
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:00 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 3 Mar 2018 14:30:51 -0500
Message-ID: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v4 0/4] Re-enable Thermostat Demo for Qt5
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
X-List-Received-Date: Sat, 03 Mar 2018 19:31:39 -0000
Content-Type: text/plain


Eric Ruei (4):
  qt-tstat: pickup the latest version for both Qt4/Qt5 support
  packagegroup-arago-tisdk-matrix: add thermostat demo back to
    MATRIX_QT_APPS
  packagegroup-arago-tisdk-qte(-sdk-host): move qt-tstat to QT_DEMOS
  ti-tisdk-makefile: add qt-tstat to MAKEFILES_MATRIX_GUI
    unconditionally

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb  |  4 ++--
 .../packagegroup-arago-tisdk-qte-sdk-host.bb          |  5 ++---
 .../packagegroups/packagegroup-arago-tisdk-qte.bb     |  5 ++---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        |  4 ++--
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb      | 19 +++++++++----------
 5 files changed, 17 insertions(+), 20 deletions(-)

-- 
1.9.1


