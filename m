Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C41A552981
	for <meta-arago@arago-project.org>;
	Fri,  9 Nov 2018 17:09:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA9H8qiV081954
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1541783332;
	bh=Nj4rHrlKGGGFfFlZxajfMzEILwm7kX/jNRuS5eHAM3k=;
	h=From:To:CC:Subject:Date;
	b=ff79BZuR27yf4NQ5Pb4PN2iXdW4E+2XS/2jXkF299LHUXWddT1L9gPCDjKGaIumMA
	vMf7o2KAQ8yK9UQyYcPQGmLC16Tq1WydRhUhgq9glPGRzxp/8n2fXHKfwYrKONQcdF
	2UxUjacnl1foL3iO3sUUmU1QjNuAIBWPjuTIVPp4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA9H8qqB008505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:52 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 9 Nov 2018 11:08:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 9 Nov 2018 11:08:52 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA9H8qo9029532;
	Fri, 9 Nov 2018 11:08:52 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Nov 2018 11:56:21 -0500
Message-ID: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 0/6] K3 SDK Updates
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
X-List-Received-Date: Fri, 09 Nov 2018 17:09:05 -0000
Content-Type: text/plain

Update the SDK packaging for the separation of the sysfw out of
U-Boot. Enable rebuilding the sysfw image from the top-level makefile.

Jacob Stiffler (6):
  ti-sci-fw: deploy original firmware
  arago-core-tisdk-image: k3: deploy ti-sci-fw
  arago-source-ipk: enable srcipk of sysfw-image-gen
  packagegroup: amsdk-sdk-host: k3: add ti-sci-fw-src
  ti-tisdk-makefile: k3: u-boot-spl: sysfw is no longer built-in
  ti-tisdk-makefile: add sysfw-image target

 .../conf/distro/include/arago-source-ipk.inc        |  4 ++++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb      |  2 ++
 .../recipes-core/images/arago-core-tisdk-image.bb   |  2 +-
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb      |  2 +-
 .../ti-tisdk-makefile/Makefile_sysfw-image          | 21 +++++++++++++++++++++
 .../ti-tisdk-makefile/k3/Makefile_u-boot-spl        |  2 --
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      |  4 +++-
 7 files changed, 32 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image

-- 
2.7.4


