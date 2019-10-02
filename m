Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AA482520DF
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2019 19:18:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92JGxX9055685
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2019 14:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570043819;
	bh=a7+a2o5CCWxSeeER5JJboRkg5BiODcNoaQ/8e/pZFlg=;
	h=From:To:Subject:Date;
	b=RL2omm/ZkIX/Y4wqPYsh532HQf/js3waO1d7NZ5opAd5nRDOhcuoxPeqzkkNoylgt
	uGvyfZBAsVptYpEL/En86m46C0vdjlt7+KNpPtsblOPdU2q0mH8QATcE6dbCXu8y2a
	KQX6T6G16GQoW0oA+PX4c4F84D9XmyKNRq34+18M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92JGxhR107921
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2019 14:16:59 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 2 Oct 2019 14:16:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 2 Oct 2019 14:16:59 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92JGwo9016195
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2019 14:16:59 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 2 Oct 2019 15:16:56 -0400
Message-ID: <1570043817-9471-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] *** RTOS patches for 6.1 release ***
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
X-List-Received-Date: Wed, 02 Oct 2019 19:18:12 -0000
Content-Type: text/plain

*** RTOS Patches for 6.1 release ***

Mahesh Radhakrishnan (1):
  big-data-ipc-demo: SRCREV update to 01.03.00.00

 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1


