Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 86E9252B11
	for <meta-arago@arago-project.org>;
	Thu, 27 May 2021 07:47:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mFFP124148;
	Thu, 27 May 2021 02:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622101695;
	bh=06CVx+knVS3V1zjp2u/KqdnXrLWl2Vvo0nztxd/2grs=;
	h=From:To:CC:Subject:Date;
	b=FxSFEV6DKjynH8AmEwStVidSSOXf5nRjJMf2/b8PrcC7doQxBMU/79rHUve596enS
	4gHn+u8j7SB3b3ACjc2Uy88cnAVFpl7OJ1jNvzUQNMGSJvZv6W9LPstRAMIuPRV7GB
	IP5Cz+J3gzBGLH3XSrKcX+CEIokADMUqOhF+KeDQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R7mE87001255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 May 2021 02:48:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 27 May 2021 02:48:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 27 May 2021 02:48:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDkL118581;
	Thu, 27 May 2021 02:48:13 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>
Date: Thu, 27 May 2021 02:48:10 -0500
Message-ID: <20210527074813.31042-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell][PATCH 0/3] Update linux libc header to 5.10
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
X-List-Received-Date: Thu, 27 May 2021 07:47:37 -0000
Content-Type: text/plain

Updating the linux libc header to 5.10 on dunfell requires some
components to be upgraded to later version or back-port the fix from the
upstream. 

Gowtham Tammana (1):
  external-arm-toolchain: update linux-libc-headers to 5.10

Praneeth Bajjuri (1):
  switch-config: update to the latest version for kernel 5.10 fixes

Yogesh Siraswar (1):
  strace: update bbappend against 5.10 kernel

 .../conf/distro/include/toolchain-arm.inc            |  2 +-
 .../meta/external-arm-toolchain.bbappend             |  8 ++++----
 .../recipes-devtools/strace/strace_5.5.bbappend      | 12 ++++++++++++
 .../recipes-bsp/switch-config/switch-config_git.bb   |  6 +++---
 4 files changed, 20 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace_5.5.bbappend

-- 
2.17.1


