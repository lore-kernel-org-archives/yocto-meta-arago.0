Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 99B01529BA
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:44:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iS04120458
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798269;
	bh=bPHtaE76B8RxzotIY44Yf5Rmt3vEiihCrhLqh4eKwCo=;
	h=From:To:Subject:Date;
	b=O/ickPM3q1Rxov6ELDMlUavwakPN/VXeNOlVtHR5gxEEzevzb7sp9N+Q82z9k+mQw
	oHRZJ2vr+F2YFw1mcSeZaU2d6Uakangr89wlZM+2FyOC56eb3v6/GY/iZwjHbjZEnt
	uv0z5aeA6bImbeZHDSCa/SbAB7cF1rUT8z+l8RZ4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1iSRa124458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:28 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:44:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:44:28 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iSuE064750
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:28 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:44:13 -0400
Message-ID: <20190514014418.20156-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/5] Replace qtwebengine with qtwebkit unconditionally
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
X-List-Received-Date: Tue, 14 May 2019 01:45:01 -0000
Content-Type: text/plain

Disable qtwebengine for now because version 5.11.3 is broken. We shall
revert these recipe  changes when fix is available.

Eric Ruei (5):
  packagegroup-arago-qte: replace qtwebengine with qtwebkit
  ackagegroup-arago-qte-toolchain-target: replace qtwebengine with
    qtwebkit
  ackagegroup-arago-tisdk-qte: replace qtwebengine examples with
    qtwebkit ones
  ackagegroup-arago-tisdk-matrix: replace qtwebengine browser with
    qtwebkit one
  matrix-gui-browser: pick up the matrix-gui-browser built on top of
    qtwebkit

 .../packagegroups/packagegroup-arago-qte.bb   | 16 ++++++-------
 .../packagegroup-arago-tisdk-matrix.bb        | 12 +++++-----
 .../packagegroup-arago-tisdk-qte.bb           | 20 +++++++---------
 .../matrix/matrix-gui-browser_2.0.bb          | 13 +++++-----
 ...packagegroup-arago-qte-toolchain-target.bb | 24 +++++++++----------
 5 files changed, 42 insertions(+), 43 deletions(-)

-- 
2.17.1


