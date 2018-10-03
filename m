Return-Path: <x0038811@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 70D5052092
	for <meta-arago@arago-project.org>;
	Wed,  3 Oct 2018 10:10:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93AASe2022930
	for <meta-arago@arago-project.org>; Wed, 3 Oct 2018 05:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538561428;
	bh=4la+b7mjwqcBUrHcIdK7evhZtzretrg7+BuuyFai5Nc=;
	h=From:To:CC:Subject:Date;
	b=ZL5sMgbelVtZOWe615QhfOclTVds3I1ZS+DeZHHaigsiKRHRHOa14ezLIz/q3uBQu
	4dvInGfr8ExMUhe8xtyfXkiD4rN4n7q1+TOa8mciAFLJ2MPgj4XzPzV+toiX4jcUb9
	C+kpPcI5S5e1lTq87Y/nFKecP6Wssgqkb7ZMTM3Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93AASAn003126
	for <meta-arago@arago-project.org>; Wed, 3 Oct 2018 05:10:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 3 Oct 2018 05:10:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 3 Oct 2018 05:10:28 -0500
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93AAQIV010521;
	Wed, 3 Oct 2018 05:10:27 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Oct 2018 15:40:23 +0530
Message-ID: <1538561424-29788-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: karthik.ramanan@ti.com
Subject: [rocko/master 0/1] omapdrmtest SRCREV
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
X-List-Received-Date: Wed, 03 Oct 2018 10:10:37 -0000
Content-Type: text/plain

This patch adds support for UYVY format with kmscube

Ramprasad N (1):
  omapdrmtest: Update SRCREV with latest fix

 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


