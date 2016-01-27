Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4F49F529E2
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:54:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJsWaO022466
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWxi022547
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWil005242;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOWAh-0007Et-EH; Wed, 27 Jan 2016 14:54:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:54:23 -0500
Message-ID: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Upgrade OpenCL and dependencies
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
X-List-Received-Date: Wed, 27 Jan 2016 19:54:34 -0000
Content-Type: text/plain

* Upgrade OpenCL to 1.1.7.2
  - Resolves LCPD-5402
* Extend support to keystone SOCs

Jacob Stiffler (6):
  ti-llvm3.6: Upgrade ti-llvm from version 3.3 to 3.6
  ocl: Upgrade to version 1.1.7.2
  packagegroup-arago-tisdk-addons*: Add OpenCL and related packages for
    keystone
  ti-tisdk-makefile: Add OpenCL and related targets for keystone
  packagegroup-arago-tisdk-matrix: Add OpenCL matrix demos for keystone
  tisdk-server-rootfs-image: Add unnecessary dev packages to
    BAD_RECOMMENDATIONS

 .../images/tisdk-server-rootfs-image.bb            |  7 ++++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 29 ++++++++++++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 14 ++++++-
 .../packagegroup-arago-tisdk-addons.bb             | 21 ++++++++++
 .../packagegroup-arago-tisdk-matrix.bb             | 17 +++++++-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 19 ++++++++-
 ...e-Do-not-check-build-executable-extension.patch | 25 +-----------
 .../llvm/{ti-llvm3.3_3.3.bb => ti-llvm3.6_3.6.bb}  | 47 ++++++++++++++++++----
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |  4 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |  4 +-
 .../recipes-ti/ocl/opencl-examples_git.bb          |  6 ++-
 .../recipes-ti/ocl/opencl-monitor_git.bb           | 35 ++++++++++++++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     | 16 +++++---
 13 files changed, 193 insertions(+), 51 deletions(-)
 rename meta-arago-extras/recipes-core/llvm/{ti-llvm3.3 => ti-llvm3.6}/0001-configure-Do-not-check-build-executable-extension.patch (56%)
 rename meta-arago-extras/recipes-core/llvm/{ti-llvm3.3_3.3.bb => ti-llvm3.6_3.6.bb} (67%)

-- 
1.9.1


