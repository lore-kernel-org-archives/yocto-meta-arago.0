Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B934752A9F
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsG9Q027436
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGmb025374
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGnC027955;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2l-0004Zi-Jc; Tue, 15 Mar 2016 15:54:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:05 -0400
Message-ID: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 0/8] Add LibArch and LinAlg
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:17 -0000
Content-Type: text/plain

Integrate Library Architecture and Framework (LibArch)
and TI Linear Algebra Library (LinAlg)

Jacob Stiffler (8):
  libarch: Add version 1.0.0.0
  libarch-examples: Add examples for libarch version 1.0.0.0
  arago-source-ipk: Enable libarch-examples-src
  linalg: Add Linear Algebra Library version 1.2.0.0
  linalg-examples: And Linear Algebra Library examples
  arago-source-ipk: Enable linalg-examples-src
  packagegroup-arago-tisdk-addons: k2hk-evm: Integrate linalg
  ti-tisdk-makefile: Add linalg-examples target

 .../conf/distro/arago-source-ipk.conf              |  7 ++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  3 +-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  3 +-
 .../packagegroup-arago-tisdk-addons.bb             |  3 +-
 .../ti-tisdk-makefile/Makefile_linalg-examples     | 39 ++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +-
 .../recipes-ti/includes/arago-paths.inc            |  7 ++
 .../recipes-ti/libarch/libarch-examples_git.bb     | 36 +++++++++++
 meta-arago-extras/recipes-ti/libarch/libarch.inc   | 32 ++++++++++
 .../recipes-ti/libarch/libarch_git.bb              | 25 ++++++++
 .../recipes-ti/linalg/linalg-examples_git.bb       | 74 ++++++++++++++++++++++
 meta-arago-extras/recipes-ti/linalg/linalg.inc     | 43 +++++++++++++
 meta-arago-extras/recipes-ti/linalg/linalg_git.bb  | 23 +++++++
 13 files changed, 295 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
 create mode 100644 meta-arago-extras/recipes-ti/includes/arago-paths.inc
 create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch.inc
 create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg.inc
 create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg_git.bb

-- 
1.9.1


