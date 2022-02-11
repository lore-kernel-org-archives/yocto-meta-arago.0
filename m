Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6594.1644583096595300982
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hu4vQUOd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcEwB085401;
	Fri, 11 Feb 2022 06:38:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583094;
	bh=J0aqeEx8HGjYid5fnAxcKPYkWY8sVDb14xTMqoHBrlU=;
	h=From:To:Subject:Date;
	b=hu4vQUOdCvpvcFO2Lbr8IRdnr7LJuUe+MMMFVuVvzs8DmbOx7GF3zrPMKoBhQLYM7
	 z+Z48zqppZ1VPZdME1XkWL/t0AUpZ+LJ24Hnit+kK6SamSOFHDWxMF6Or+SLshzjfJ
	 XzUPsZ25KuwnMn6uPcbStLPgSj/cVKffBpLU7ZVQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BCcEtk017895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:38:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:38:14 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcERK099090;
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVBm-0003Cm-7J; Fri, 11 Feb 2022 06:38:14 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 0/3] Revert docker container
Date: Fri, 11 Feb 2022 06:38:11 -0600
Message-ID: <20220211123814.12258-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

These patches add to the size of the base image and make testing
difficult.  We have plans on reworking the images and will reapply
these patches at that time.

Ryan Eatmon (3):
  Revert "linux-ti-staging: move docker.cfg to be accessible by
    rt/systest variants"
  Revert "packagegroup-arago-base: add docker runtime to the base and
    default rootfs"
  Revert "linux-ti-staging: enable necessary configs for running docker
    containers"

 .../packagegroups/packagegroup-arago-base.bb  |  1 -
 .../recipes-kernel/linux/docker.inc           |  4 ----
 .../recipes-kernel/linux/files/docker.cfg     | 20 -------------------
 .../linux/linux-ti-staging-rt_%.bbappend      |  1 -
 .../linux/linux-ti-staging-systest_%.bbappend |  1 -
 .../linux/linux-ti-staging_%.bbappend         |  1 -
 6 files changed, 28 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/files/docker.cfg

-- 
2.17.1

