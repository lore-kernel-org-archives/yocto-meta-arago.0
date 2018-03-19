Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 789AC52998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa5vP004656
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484565;
	bh=sVp/zKqi1YSsuXdEVmpEwlPiXX5381v0tyyv0vcbHQs=;
	h=From:To:CC:Subject:Date;
	b=FAsvAzpzFov8qBpEz4FSlN2j3gffUyS1qUb4xxrDGFS2yDkzLByRjF+aCRJeVDdj7
	PyBVeRC3RCD8J2Irffqk8R2AapqylHX32ylsga9J6+zY/+rfOZF+BXhDURnju/jUgV
	pvnWT2NW1FYrBf7GYOVuTZP1RZc1ChDpq+QG0aok=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa5Ar014709
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:05 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:05 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4S7009580;
	Mon, 19 Mar 2018 13:36:05 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:35 -0400
Message-ID: <1521484541-8104-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 0/6] [PATCH] Add OpenVX Khronos tutorial example
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
X-List-Received-Date: Mon, 19 Mar 2018 18:37:05 -0000
Content-Type: text/plain

Add OpenVX Khronos tutorial example building upon TIOVX:

* Build and install example binary
* License is updated with the newly added example
* Make the test and tutorial example from the top-level makefile
* Enable native compilation of the test and tutorial example on target

Hongmei Gou (6):
  tiovx-app-host: add Khronos tutorial example
  tiovx-app-host: create SRCIPK
  packagegroup-arago-tisdk-addons-sdk-host: add tiovx-app-host-src
  ti-tisdk-makefile: add tiovx-app-host
  tiovx-app-host: enable compilation of app-host and tutorial example on
    target
  packagegroup-arago-tisdk-addons: add tiovx-app-host-examples

 ...ckagegroup-arago-tisdk-addons-sdk-host.bbappend |  6 +++-
 .../packagegroup-arago-tisdk-addons.bbappend       |  4 +--
 recipes-ti/tiovx/tiovx-app-host.bb                 | 39 +++++++++++++++++-----
 recipes-ti/tiovx/tiovx-sys.inc                     |  4 +--
 .../ti-tisdk-makefile/Makefile_tiovx-app-host      | 34 +++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 |  5 ++-
 6 files changed, 78 insertions(+), 14 deletions(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host

-- 
1.9.1


