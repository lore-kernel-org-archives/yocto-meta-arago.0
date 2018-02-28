Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 07D9752975
	for <meta-arago@arago-project.org>;
	Wed, 28 Feb 2018 18:41:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1SIf4CQ017872
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519843264;
	bh=MGgKPYgeMS8ETaSppV9ayzhh3ntCk7z9934v+GhoF1I=;
	h=From:To:Subject:Date;
	b=ABKC6widL9CJYX3lAfJtTvc1cMnc2T+v+axHjCwqpbOuxlu40aTI9Peez7JOqQNv7
	SBoQ50z2LBethKsZH/7+YN8XnE8t+XG0dlBbBqicvSz92Rh6V5tiQpWFNZ1I14BAUF
	FB2QYvI/u663L05VhUEC/eBbw5oWBiqtxHnJz7Ik=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIf4NK012498
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 28 Feb 2018 12:41:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 28 Feb 2018 12:41:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIf3H3030624
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Feb 2018 13:40:56 -0500
Message-ID: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v3 0/4] Re-enable thermostat demo for Qt5
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
X-List-Received-Date: Wed, 28 Feb 2018 18:41:39 -0000
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


