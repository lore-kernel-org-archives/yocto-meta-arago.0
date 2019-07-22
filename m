Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DFD8352980
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2019 18:15:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6MIEp2I031779
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2019 13:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563819291;
	bh=8+kOztRrh0/XRqomagbdsRMOXXVVHkyIZCCgeN1W7pU=;
	h=From:To:CC:Subject:Date;
	b=HxVBlLkg+MkI5ShsT+FCOqRqFYM3UR5mUOT+aLdCAl91ZG4Ho6uWvaPRM2zBtnonL
	4K40DtP5VSK1reKtHO08D3SVkPWiaB2bFm9ox9EMugLeWyJDfBl1YWZ+vQbjeLTWyZ
	LaHrQsgo0IEmzmQGthhapmU2B5oTKWDmRirKuDCw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6MIEpZK048754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2019 13:14:51 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 22 Jul 2019 13:14:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 22 Jul 2019 13:14:51 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6MIEoYp059307;
	Mon, 22 Jul 2019 13:14:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Jul 2019 18:01:32 +0000
Message-ID: <20190722180132.22483-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] parse-ip: move init script to "k2g" to apply to both GP and HS devices
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
X-List-Received-Date: Mon, 22 Jul 2019 18:15:43 -0000
Content-Type: text/plain

k2g is a common SoC family name for k2g-evm and k2g-hs-evm

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-tisdk/parse-ip/parse-ip/{k2g-evm => k2g}/init         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/{k2g-evm => k2g}/init (100%)

diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g/init
similarity index 100%
rename from meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g-evm/init
rename to meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/k2g/init
-- 
2.17.1


