Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BBD88529B3
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:32:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5MIWn8w036799
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692369;
	bh=Gk2AInB/JfQiRy4il6RZqIaPvjpirOOX0It5rEW6Awk=;
	h=From:To:CC:Subject:Date;
	b=URgzWw5k+G7knzGsByonAAShhLsrHp5xm6Pumcoa3v+iS7zRPLBq48Aj0Nny3/4JB
	7aNLzNbeGCCwlum9UOBZyFHg7EnFnadFW7OO5EYvLwLgGTtV45DVImFD+NyuTTQhTO
	2pp7412nwBi9eKqo5CFu636ZodTweUzt32X/E9Gc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn9t012529
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:49 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:32:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:32:49 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn0a021857;
	Fri, 22 Jun 2018 13:32:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:21:09 -0400
Message-ID: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH 0/6] tidl-api integration
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
X-List-Received-Date: Fri, 22 Jun 2018 18:32:56 -0000
Content-Type: text/plain

Fully integrate tidl-examples and tidl-viewer into the SDK.

Jacob Stiffler (6):
  tidl-api: various updates
  pckagegroup-arago-tisdk-opencl: add tidl-examples-dev
  packagegroup-arago-tisdk-opencl-sdk-target: add tidl-examples-dev
  packagegroup-arago-tisdk-opencl-sdk-host: add tidl-examples-src
  ti-tisdk-makefile: add tidl-examples target
  nativesdk-packagegroup-arago-sdk-host: add tidl-viewer

 .../nativesdk-packagegroup-arago-sdk-host.bbappend |  3 ++
 ...ckagegroup-arago-tisdk-opencl-sdk-host.bbappend |  4 +++
 ...agegroup-arago-tisdk-opencl-sdk-target.bbappend |  3 ++
 .../packagegroup-arago-tisdk-opencl.bbappend       |  2 +-
 recipes-ti/tidl-api/tidl-api.inc                   |  2 +-
 recipes-ti/tidl-api/tidl-examples_git.bb           | 23 ++++++++------
 .../ti-tisdk-makefile/Makefile_tidl-examples       | 35 ++++++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 |  8 +++--
 8 files changed, 67 insertions(+), 13 deletions(-)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
 create mode 100755 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tidl-examples

-- 
2.7.4


