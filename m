Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B7ED711CE
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 17:29:36 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.19798.1732123774475683484
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 09:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MGMnn514;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-shenai@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKHTXLI4168747
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2024 11:29:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732123773;
	bh=zUE6xGbukOb/M043/OjliGz5TJ1GBFq5AYw/EQOasPs=;
	h=From:To:CC:Subject:Date;
	b=MGMnn514VGSeAxAr+q9RpGIyRh79dbGGwQ+UFAhdHyVAnrhRNKHb5VWC+LXhngnYn
	 MicKpmfcHSL3BUI24GEnc24aJkZPYU0mmEWdL2cFOvO2oIej/8e1NgH1NSPkhKHMg4
	 XJqA+VUtJ0CPYAQDCY6c+Wp/Y48AxOCtYKp9tilM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKHTXwx058164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 11:29:33 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 11:29:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 11:29:33 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKHTV57061708;
	Wed, 20 Nov 2024 11:29:31 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2 0/1] meta-arago: Enable SELinux package
Date: Wed, 20 Nov 2024 22:59:20 +0530
Message-ID: <20241120172921.1881462-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Nov 2024 17:29:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15620

This patch adds build support for SELinux

Changelog:

v1 -> v2:
    - Changed the patch completely to not have changes in meta-ti
      and instead stick to meta-arago via dynamic layers

Aashvij Shenai (1):
  meta-arago: Enable SELinux package

 meta-arago-distro/conf/layer.conf                   |  2 ++
 .../images/tisdk-default-image.bbappend             |  3 +++
 .../linux/linux-ti-staging_%.bbappend               | 13 +++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
 create mode 100644 meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend

-- 
2.34.1


