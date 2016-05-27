Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 27C5252A16
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 13:18:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4RDI2ef010906
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4RDI1YH028643
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 May 2016 08:18:01 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4RDI1Ci027612;	Fri, 27 May 2016 08:18:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 May 2016 09:17:49 -0400
Message-ID: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Ad pyopencl
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
X-List-Received-Date: Fri, 27 May 2016 13:18:02 -0000
Content-Type: text/plain

Add and integrate python-pyopencl and missing dependencies
python-appdirs and python-pytools.

Jacob Stiffler (4):
  python-appdirs: add version 1.4.0
  python-pytools: add version 2016.2.1
  python-pyopencl: add version 2016.1
  packagegroup-arago-tisdk-opencl: add python-pyopencl package

 .../packagegroup-arago-tisdk-opencl-sdk-target.bb  |  3 ++-
 .../packagegroup-arago-tisdk-opencl.bb             |  3 ++-
 .../python/python-appdirs_1.4.0.bb                 |  8 ++++++++
 .../python/python-pyopencl_2016.1.bb               | 23 ++++++++++++++++++++++
 .../python/python-pytools_2016.2.1.bb              | 17 ++++++++++++++++
 5 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb

-- 
2.7.4


