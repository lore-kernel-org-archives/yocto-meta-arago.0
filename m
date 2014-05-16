Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 363C252ABC
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 19:27:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJRXGM004582
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:27:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJRXmc014009
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 14:27:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:27:33 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJRW5h027288;	Fri, 16 May 2014 14:27:32 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNn2-0006Uk-G7; Fri, 16 May 2014
	15:27:32 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 May 2014 15:27:28 -0400
Message-ID: <1400268448-24936-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] add tisdk image support for 3 Keystone II machine config
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
X-List-Received-Date: Fri, 16 May 2014 19:27:34 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Add K2HK, K2L and K2E EVM machine config support to build tisdk iamge

Hao Zhang (3):
  keystone: tisdk-image: change machine config from keystone-evm to
    k2hk-evm
  keystone: ti-sdk image: add k2l-evm core ti-sdk image
  keystone: ti-sdk: add k2e-evm core ti-sdk image

 .../recipes-core/images/arago-core-tisdk-image.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5


