Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EA639529AE
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3OWU003518
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555004;
	bh=WrjNVLQcMqOyIqOdZ0lSEkga4gxNyrKyrWHSuuioOUM=;
	h=From:To:Subject:Date;
	b=hxIRTQmiLQAz4auVVaLng5UaL6SJpexI2Q+QosKhtPUXF5ZrVY4Rh2vgRWVaLUnKu
	CQe4bPFnVCYlBMiFHNgAuesosv3Eg36IRhYvmXdD3l7u+g10wgrHym67MRWx6yP35t
	CYXPddFDRvBoH3RKKdxUBkJHCCgGIPTQoTo3137w=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OYa007453
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:24 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiS028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:24 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:13 -0400
Message-ID: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/7] Replace qtwebengine with qtwebkit for k3 devices
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:34 -0000
Content-Type: text/plain

None of qtwebengine (chromium) based browser works on k3 devices. 
Some of them just crashes and some of them runs, but does not display 
the content of web pages. This will affect the OOB experience because
marix-gui does not work. Fortunately, all qtwebkit based browsers
work normally.

These patches simply replace qtwebengine with qtwebkit and remove 
qtwebengine- or chromium-based demos for k3 devices.

Eric Ruei (7):
  packagegroup-arago-qte: replace qtwebengine with qtwebkit for k3
    devices
  packagegroup-arago-tisdk-matrix: remove matrix-gui broswer demos for
    k3 devices
  packagegroup-arago-tisdk-qte: replace qtwebengine examples with
    qtwebkit ones for k3 devices
  qtwebkit: add flex and bison to DEPENDS list
  matrix-gui-browser: use QWebView instead of QWebEgineView for k3
    devices
  matrix-gui-qt5-demos: use webkit browser instead of webengine browser
    for k3 devices
  packagegroup-arago-qte-toolchain-target: replace qtwebenine with
    qtwebkit for k3 devices

 .../packagegroups/packagegroup-arago-qte.bb        |  9 ++++++-
 .../packagegroup-arago-tisdk-matrix.bb             |  3 +--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  | 10 ++++++-
 .../recipes-qt/qt5/qtwebkit_%.bbappend             |  4 ++-
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |  6 ++++-
 ...-use-webkit-browser-instead-of-webengine-.patch | 31 ++++++++++++++++++++++
 .../matrix/matrix-gui-qt5-demos_2.0.bb             |  6 ++++-
 .../packagegroup-arago-qte-toolchain-target.bb     | 12 ++++++++-
 8 files changed, 73 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos/0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch

-- 
1.9.1


