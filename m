Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91669C3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:33:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.53624.1746459191295880586
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 May 2025 08:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gf4RSe+o;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXA2Q253377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746459190;
	bh=sX57XP4cwSdjylGUqc8P4/H8wUepgnIMv4xzW5cDqLE=;
	h=From:To:Subject:Date;
	b=gf4RSe+oaI4S7YsoPMZM6i/KFi/9oHOm0mT/KTUOvZATgMpxNzg6/0YIoU7L9n2c6
	 ioJLU4gSQ2nY/JcOWAcHT514F3pSRdUDxrHBrQtUUvr4NpYum4bPGTkqjdQVz+ZMyW
	 tlv8mdRn+Bt1imjh4vT9IAgq6s5P3vOX/kmD8m8c=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXA7k128210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 10:33:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 10:33:10 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545FX968026218;
	Mon, 5 May 2025 10:33:09 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 0/3] OpenCL C / C++ header revamp
Date: Mon, 5 May 2025 10:33:06 -0500
Message-ID: <20250505153309.1739313-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 May 2025 15:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16177

From: Antonios Christidis <a-christidis@ti.com> Date: Mon, 5 May 2025

Dear all,

The issue I'm trying to solve, is that the provided opencl C++ headers
files are too old of a version, in scarthgap branches. I'm trying to
upgrade to from version 2023.12.14 -> 2024.05.08.

As it currently stands the c header files have already been bumped to
version 2024.05.08. This is done by a .bbappend that links to a .inc file
where the SRCREV is changed. The issue arises with the original meta-oe
opencl-headers recipe which disables the cmake build system and thus
OpenCLHeadersConfig.cmake is never built. That file is a dependency to
build the proposed new version of the c++ header files.

There is no point in editing further the .inc file for the opencl c headers
cause at this point I will be creating a new recipe with the amount of
modifications required. So, delete the .bbappend and .inc files and create
a new recipe for opencl-headers_2024.05.08 in meta-arago.

Regards, Antonios Christidis

Antonios Christidis (3): meta-arago-test: recipes-extended: Remove opencl c
headers bbappend meta-arago-test: recipes-graphics: Add opencl c headers
meta-arago-test: recipes-graphics: Add opencl c++ headers

 .../opencl/opencl-headers_%.bbappend          |  4 ---
.../opencl/opencl_headers-ti.inc              |  1 -
.../opencl/opencl-clhpp_2024.05.08.bb         | 26 +++++++++++++++++++
.../opencl/opencl-headers_2024.05.08.bb       | 19 ++++++++++++++ 4 files
changed, 45 insertions(+), 5 deletions(-) delete mode 100644
meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend delete
mode 100644 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
create mode 100644
meta-arago-test/recipes-graphics/opencl/opencl-clhpp_2024.05.08.bb create
mode 100644
meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb

-- 2.34.1


