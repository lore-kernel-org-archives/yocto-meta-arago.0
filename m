Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9A84652AB6
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:27 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtPcr015300
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:26 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtPZb011813
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:25 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:25 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCp020052;
	Mon, 1 Apr 2013 20:25:24 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:54 -0500
Message-ID: <1364828095-28755-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/17 v2] wpa-supplicant_r5.00.18: Create bbappend
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:27 -0000
Content-Type: text/plain

* Create a bbappend to insure that any version changes to the wpa-supplicant
  recipe will result in a new TSU exemption will be filed.
---
Version 2 changes:
None. Apart of updated patchset.

 ...1.bbappend => wpa-supplicant_r5.00.18.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 copy meta-arago-distro/recipes-connectivity/wpa-supplicant/{wpa-supplicant_r5.sp4.01.bbappend => wpa-supplicant_r5.00.18.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
similarity index 100%
copy from meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend
copy to meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
-- 
1.7.0.4


