Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 62B3052090
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2018 02:42:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w922gTRm115485
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 21:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538448149;
	bh=Za8WgZxu9thI49oKDUmc5lHztkGN412XxyDjwltfPLM=;
	h=From:To:Subject:Date;
	b=R1I9SYR9gSKJEH6pTsIk92d6o62isDC0DQBKRLIcDrw0hy3/+bDyz4tMjptjmXTOw
	P7EtBvqBkZVzs4xWBN3NZAKIN3gkYzrTwoj9GqMyTJC9CEfUx1ZFYxQ+SwY7jWHh24
	SqaBr9xALkX2Rv2OPzPmISj90RdYMH8XEVk3JeDA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w922gTkR017568
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 21:42:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 1 Oct 2018 21:42:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 1 Oct 2018 21:42:29 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w922gTKk011998
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 21:42:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Oct 2018 22:42:24 -0400
Message-ID: <1538448145-23106-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] CSL SRCREV bump to 03.03.00.12A
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
X-List-Received-Date: Tue, 02 Oct 2018 02:42:39 -0000
Content-Type: text/plain

CSL SRCREV bump to 03.03.00.12A to address PRSDK-4790

Mahesh Radhakrishnan (1):
  common-csl-ip: SRCREV bump to version 03.03.00.12A

 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc  | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 +
 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend      | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend

-- 
1.9.1


