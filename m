Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6DDD711CC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 17:28:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.19811.1732123733723717256
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 09:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U51XYf5H;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-shenai@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKHSq1w4168667
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2024 11:28:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732123732;
	bh=azShO5sJjJ0WuUV4wXXgBjzK8lW5DR1P20kfboeAMY8=;
	h=From:To:CC:Subject:Date;
	b=U51XYf5HabfSeKBTXsh+lpTkXEpwgBenJCtAYHJjCOJKFZQwToSP6LmZnE62BK8XM
	 PwbUqEpTsCjakeD72Gvklo+W4QuzHYPjUtUzG+mYcoFLsgbTea8ifGH8Ehgr2D0yzY
	 8ThuUtM9H6TkNKH6pv1v4HZcsq3u4moNWcTyGiV4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKHSqIe073261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 11:28:52 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 11:28:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 11:28:52 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKHSnPo061104;
	Wed, 20 Nov 2024 11:28:50 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
Subject: [oe-layersetup][master][PATCH v2 0/1] oelayersetup: Bringing meta-selinux into Yocto builds
Date: Wed, 20 Nov 2024 22:58:23 +0530
Message-ID: <20241120172824.1764599-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Nov 2024 17:28:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15618

This patch is needed to download the meta-selinux layer into TI-SDK builds

Changelog:

v1 -> v2
    - Updated config changes from .txt to .xml
    - Added 2 new configs instead of editing existing configs
    
Aashvij Shenai (1):
  oelayersetup: Bringing meta-selinux into Yocto builds

 .../arago-master-selinux-config.json          | 136 +++++++++++++
 .../arago-scarthgap-selinux-config.json       | 136 +++++++++++++
 .../bblayers.conf.sample                      |  32 +++
 .../conf-notes.txt                            |  22 +++
 .../conf-summary.txt                          |   1 +
 .../local.conf.sample                         | 186 ++++++++++++++++++
 .../bblayers.conf.sample                      |  32 +++
 .../conf-notes.txt                            |  22 +++
 .../conf-summary.txt                          |   1 +
 .../local.conf.sample                         | 184 +++++++++++++++++
 configs/arago-master-chromium-config.txt      |   1 +
 configs/arago-master-config.txt               |   1 +
 configs/arago-master-next-config.txt          |   1 +
 configs/arago-master-selinux-config.txt       |  20 ++
 configs/arago-master-wip-config.txt           |   1 +
 configs/arago-scarthgap-chromium-config.txt   |   1 +
 configs/arago-scarthgap-config.txt            |   1 +
 configs/arago-scarthgap-next-config.txt       |   1 +
 configs/arago-scarthgap-selinux-config.txt    |  20 ++
 configs/arago-scarthgap-wip-config.txt        |   1 +
 kas/arago-master-selinux-config.yml           |  68 +++++++
 kas/arago-scarthgap-selinux-config.yml        |  68 +++++++
 src/configs/arago-master-chromium-config.xml  |   3 +
 src/configs/arago-master-config.xml           |   3 +
 src/configs/arago-master-next-config.xml      |   3 +
 src/configs/arago-master-selinux-config.xml   |  75 +++++++
 src/configs/arago-master-wip-config.xml       |   3 +
 .../arago-scarthgap-chromium-config.xml       |   3 +
 src/configs/arago-scarthgap-config.xml        |   3 +
 src/configs/arago-scarthgap-next-config.xml   |   3 +
 .../arago-scarthgap-selinux-config.xml        |  75 +++++++
 src/configs/arago-scarthgap-wip-config.xml    |   3 +
 32 files changed, 1110 insertions(+)
 create mode 100644 bitbake-setup/arago-master-selinux-config.json
 create mode 100644 bitbake-setup/arago-scarthgap-selinux-config.json
 create mode 100644 conf/templates/arago-master-selinux-config/bblayers.conf.sample
 create mode 100644 conf/templates/arago-master-selinux-config/conf-notes.txt
 create mode 100644 conf/templates/arago-master-selinux-config/conf-summary.txt
 create mode 100644 conf/templates/arago-master-selinux-config/local.conf.sample
 create mode 100644 conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
 create mode 100644 conf/templates/arago-scarthgap-selinux-config/conf-notes.txt
 create mode 100644 conf/templates/arago-scarthgap-selinux-config/conf-summary.txt
 create mode 100644 conf/templates/arago-scarthgap-selinux-config/local.conf.sample
 create mode 100644 configs/arago-master-selinux-config.txt
 create mode 100644 configs/arago-scarthgap-selinux-config.txt
 create mode 100644 kas/arago-master-selinux-config.yml
 create mode 100644 kas/arago-scarthgap-selinux-config.yml
 create mode 100644 src/configs/arago-master-selinux-config.xml
 create mode 100644 src/configs/arago-scarthgap-selinux-config.xml

-- 
2.34.1


