Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id DC3DD52975
	for <meta-arago@arago-project.org>;
	Fri, 16 Feb 2018 20:56:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1GKtfDb011634
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518814541;
	bh=5UhJu7ZcLfVjxaDSQlmCXXRDeTr16NtbKnmZY2NNLh4=;
	h=From:To:Subject:Date;
	b=V4opjaP3LyADHlfQ+t5d1VA/cYTXZ7XGPCqrPIPUyVISQSl51liLEE+i7lyzWdb8/
	7St2ncwQa1UQFpVIFSceEbF0JeVpMDaMrTp9PY/84eOp1iwrXiePmdTSC1TuTmGwo1
	ha1jrRdXuPOi5E+DZNn7t+d10SSjF6beNtNZxETc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtex4023824
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:40 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Feb 2018 14:55:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Feb 2018 14:55:40 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtepe017265
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:40 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Feb 2018 15:55:32 -0500
Message-ID: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v2 0/4] Re-enable QT5 Thermostat demo
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
X-List-Received-Date: Fri, 16 Feb 2018 20:56:01 -0000
Content-Type: text/plain

Eric Ruei (4):
  qt-tstat: pickup the latest version for both Qt4/Qt5 support
  packagegroup-arago-tisdk-matrix: add thermostat demo back to
    MATRIX_QT_APPS
  packagegroup-arago-tisdk-qte(-sdk-host): move qt-tstat to QT_DEMOS
  ti-tisdk-makefile: add qt-tstat to MAKEFILES_MATRIX_GUI
    unconditionally

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


