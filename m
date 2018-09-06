Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3253152985
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 21:04:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86L4Fdk124848
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536267855;
	bh=gqTqMR/UoONH4XrsVmPvfDws0qdBT2wLNzeCVinMH3o=;
	h=From:To:CC:Subject:Date;
	b=Mdbjc5rQvD8sZoP4GNuY4pLUjwuBoToIOdoR434mpEPcj6+fW6ZgpatGT3HlTElLb
	tNXqtgcbFoNQ94M6ZidbLJTbscAoKSiapYoTZKv/OFdfFYgDOin+G0aWsrOBEiVRIz
	EEdYIinJfhVjO0ymFuoYpBJjXHfwOSJIYid3L1kA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4Fof002848
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 16:04:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 16:04:15 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4Ehe009473;
	Thu, 6 Sep 2018 16:04:14 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Sep 2018 17:04:06 -0400
Message-ID: <1536267851-5510-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 0/5] Add pru-adc demo
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
X-List-Received-Date: Thu, 06 Sep 2018 21:04:24 -0000
Content-Type: text/plain

This is a TI design to showcase multi-channel ADC via PRU. 

The major additions/changes include:
1. Modify dependent pru-icss to install header files and lib required
2. Add recipe for pru-adc itself
3. Add device tree file
4. Add support of building pru-adc demo from top-level makefile
5. Add pru-adc to packagegroups

Hongmei Gou (5):
  pru-icss: install header files and rpmsg_lib
  pru-adc: add multiple-channel adc demo with pru
  linux-processor-sdk-4.14.inc: add device tree file for pru-adc demo
  ti-tisdk-makefile: add pru-adc demo and the required dtb
  packagegroup-arago-tisdk-addons*: add pru-adc

 recipes-apps/pru-adc/pru-adc_git.bb                | 49 ++++++++++++++++
 recipes-bsp/pru/pru-icss_git.bbappend              |  8 +++
 ...ckagegroup-arago-tisdk-addons-sdk-host.bbappend |  4 +-
 .../packagegroup-arago-tisdk-addons.bbappend       |  4 +-
 .../linux/files/ti33x/am335x-pru-adc.dtsi          | 68 ++++++++++++++++++++++
 recipes-kernel/linux/linux-processor-sdk-4.14.inc  | 18 +++++-
 .../ti-tisdk-makefile/Makefile_pru-adc             | 34 +++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 |  6 +-
 8 files changed, 185 insertions(+), 6 deletions(-)
 create mode 100644 recipes-apps/pru-adc/pru-adc_git.bb
 create mode 100644 recipes-bsp/pru/pru-icss_git.bbappend
 create mode 100644 recipes-kernel/linux/files/ti33x/am335x-pru-adc.dtsi
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc

-- 
1.9.1


