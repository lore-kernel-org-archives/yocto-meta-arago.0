Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A95F152A1E
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2015 19:05:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RJ5RPn015672
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5QfJ022140
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 14:05:27 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5Qcm029078;
	Tue, 27 Oct 2015 14:05:26 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zr9Yk-0000x9-2K; Tue, 27 Oct 2015 15:05:26 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Oct 2015 15:05:15 -0400
Message-ID: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/8] Integrate OpenCL
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
X-List-Received-Date: Tue, 27 Oct 2015 19:05:30 -0000
Content-Type: text/plain

* Integrate the OpenCL packages into the target filesystem and devkit
* Integrate the OpenCL Example matrix files
* Enable rebuilding the OpenCL example sources from the SDK

Jacob Stiffler (8):
  packagegroup-arago-tisdk-addons: Clean up machine-specific packages
  packagegroup-arago-tisdk-addons: Add opencl dev pkgs and examples
  packagegroup-arago-tisdk-addons-sdk-target: Add opencl to devkit
  packagegroup-arago-tisdk-addons-sdk-host: Add opencl example sources
  packagegroup-arago-tisdk-matrix: Add opencl matrix demos
  nativesdk-packagegroup-arago-sdk-host: Add clocl
  ti-tisdk-makefile: Include opencl-example fragment for dra7xx
  arago-base-tisdk-image: Add BAD_RECOMMENDATIONS to remove unneeded dev
    pkgs

 .../recipes-core/images/arago-base-tisdk-image.bb  |  7 ++++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  6 +++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  6 ++--
 .../packagegroup-arago-tisdk-addons.bb             | 38 ++++++++++++++--------
 .../packagegroup-arago-tisdk-matrix.bb             |  7 +++-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  3 +-
 .../nativesdk-packagegroup-arago-sdk-host.bb       |  4 +--
 7 files changed, 51 insertions(+), 20 deletions(-)

-- 
1.9.1


