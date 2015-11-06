Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6FFE652A5B
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2015 19:30:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6JUaNc031756
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUaat010790
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Nov 2015 13:30:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUaFO007117;
	Fri, 6 Nov 2015 13:30:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZumiZ-0006MP-JP; Fri, 06 Nov 2015 14:30:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Nov 2015 14:30:29 -0500
Message-ID: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Inegrate pru-icss into SDK
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
X-List-Received-Date: Fri, 06 Nov 2015 19:30:37 -0000
Content-Type: text/plain

* Add to filesystem and devkit
* Provide ti-cgt-pru in nativesdk sysroot
* Provide sources and makefile target

Jacob Stiffler (4):
  nativesdk-packagegroup-arago-sdk-host: Add ti-cgt-pru
  arago-source-ipk: Enable pru-icss sourceipk
  packagegroup-arago-tisdk-addons*: Add pru-icss
  ti-tisdk-makefile: Add pru-icss makefile fragment

 .../conf/distro/arago-source-ipk.conf              |  3 +
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  9 ++-
 .../packagegroup-arago-tisdk-addons.bb             |  5 +-
 .../ti-tisdk-makefile/Makefile_pru-icss            | 73 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 15 ++++-
 .../nativesdk-packagegroup-arago-sdk-host.bb       |  7 ++-
 6 files changed, 106 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss

-- 
1.9.1


