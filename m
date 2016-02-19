Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F25DF52ADB
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh2Zp000764
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1GH022378
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1Av012641;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxA-0006eO-JV; Fri, 19 Feb 2016 14:43:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:51 -0500
Message-ID: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Integrate OpenMP Accelerator Model
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:04 -0000
Content-Type: text/plain


Jacob Stiffler (7):
  openmpacc: Add clacc, the OpenMP-Acc compiler
  openmpacc: Add OpenMP-Acc library
  openmpacc-examples: Add the OpenMP-Acc examples
  arago-source-ipk: Enable openmpacc-examples source ipk
  packagegroup-arago-tisdk-addons*: Integrate openmpacc into the SDK
  nativesdk-packagegroup-arago-sdk-host: Add clacc to the devkit
  ti-tisdk-makefile: Add openmpacc-examples target

 .../conf/distro/arago-source-ipk.conf              |  3 +
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  6 +-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 15 +++--
 .../packagegroup-arago-tisdk-addons.bb             |  6 +-
 .../ti-tisdk-makefile/Makefile_openmpacc-examples  | 32 ++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  7 ++-
 .../nativesdk-packagegroup-arago-sdk-host.bb       |  3 +-
 .../recipes-ti/openmpacc/clacc_git.bb              | 38 ++++++++++++
 .../recipes-ti/openmpacc/openmpacc-examples_git.bb | 72 ++++++++++++++++++++++
 .../recipes-ti/openmpacc/openmpacc.inc             | 21 +++++++
 .../recipes-ti/openmpacc/openmpacc_git.bb          | 19 ++++++
 11 files changed, 214 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb

-- 
1.9.1


